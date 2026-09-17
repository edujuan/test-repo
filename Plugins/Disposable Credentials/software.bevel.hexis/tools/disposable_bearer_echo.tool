---
id: disposable_bearer_echo
type: inline
owner:
  - juan <juan@bevel.software>
variables:
  - name: ECHO_ADMIN_TOKEN
    scope: admin
    label: "Shared DUMMY bearer token (any throwaway value, never a real secret) - httpbin.org echoes it back so a rotation can be observed"
  - name: ECHO_USER_TOKEN
    scope: user
    label: "Your own DUMMY bearer token (any throwaway value, never a real secret)"
tools:
  - name: bearer_admin_whoami
    description: "Calls httpbin.org/bearer with the shared admin token. Returns {authenticated: true, token: <the token that was actually sent>}, so a tester can confirm which shared key is live after a rotation, and gets HTTP 401 once the key has been removed. Because it echoes the token, only ever configure a throwaway value. Disposable test tool."
    inputs:
      type: object
      properties: {}
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://httpbin.org/bearer
      headers:
        Authorization: Bearer ${ECHO_ADMIN_TOKEN}
  - name: bearer_user_whoami
    description: "Same httpbin.org/bearer call with the caller's own per-user token. Verifies that a member's credential is used for the member's call and that the admin's value is not. Disposable test tool."
    inputs:
      type: object
      properties: {}
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://httpbin.org/bearer
      headers:
        Authorization: Bearer ${ECHO_USER_TOKEN}
---
Disposable test fixture, created 2026-09-17 by the agent for the tool-management test plan. Safe to edit, retire or delete.

Owner: juan <juan@bevel.software> (frontmatter).
Source: httpbin.org (public request/response service; /bearer returns 200 with the presented token when an Authorization: Bearer header is present and 401 when it is missing or empty). Already in use by the Test Toolkit fixtures.
Credentials: ECHO_ADMIN_TOKEN (admin scope, vault key disposable_bearer_echo_ECHO_ADMIN_TOKEN) and ECHO_USER_TOKEN (user scope). Both are DUMMY values by design: the tools echo them back, so never enter a real secret here. Use nasa_apod for the check that a member cannot see the admin secret.
Dependents: skill disposable-key-rotation-check uses bearer_admin_whoami.

Covers: rotate the key and verify new calls use it while the old key stops being used; remove the key and verify dependent calls fail safely (401); invoke the tool through the agent and verify the intended credential (admin vs per-user) is used.
