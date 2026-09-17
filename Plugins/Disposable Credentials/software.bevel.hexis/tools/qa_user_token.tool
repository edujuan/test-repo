---
id: qa_user_token
type: inline
variables:
  - name: QA_USER_TOKEN
    scope: user
    label: "Your own DUMMY token (any throwaway value, never a real secret). Each member sets their own on the Connect page; httpbin.org echoes it back."
tools:
  - name: user_token_check
    description: "Calls httpbin.org/bearer with the CURRENT USER's own token (user-scoped secret). Returns {authenticated: true, token: <the caller's value>}, so two members calling it should see two different tokens. HTTP 401 if the caller has not configured a value yet."
    inputs:
      type: object
      properties: {}
    outputs:
      type: object
      properties:
        authenticated: { type: boolean }
        token: { type: string }
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://httpbin.org/bearer
      headers:
        Authorization: Bearer ${QA_USER_TOKEN}
---
QA fixture (2026-09-17) for PER-USER credentials: the Connect page flow, "the intended
credential is used" when invoked through the agent, and access changes refreshing agent discovery.

Grant a second person read on this plugin, have them set their own QA_USER_TOKEN on the Connect
page, and compare the `token` each of you gets back. Revoke their access and confirm the tool
disappears from their agent without a reconnect.
