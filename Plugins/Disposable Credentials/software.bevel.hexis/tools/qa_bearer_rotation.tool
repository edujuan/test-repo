---
id: qa_bearer_rotation
type: inline
variables:
  - name: QA_BEARER_TOKEN
    scope: admin
    label: "Shared DUMMY bearer token (any throwaway value, never a real secret) - httpbin.org echoes it back so you can see which value a call used"
tools:
  - name: bearer_check
    description: "Calls httpbin.org/bearer with the SHARED admin token. Returns {authenticated: true, token: <value used>} so a tester can verify which token a call actually carried (key rotation), or HTTP 401 when no token is configured (key removed). The token IS visible in the response, so only ever configure throwaway values here."
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
        Authorization: Bearer ${QA_BEARER_TOKEN}
---
QA fixture (2026-09-17) for KEY ROTATION and KEY REMOVAL.

httpbin.org/bearer accepts any non-empty bearer token and echoes it back, which is exactly what a
rotation test needs: set the token to `rotation-v1`, call bearer_check and read `token`; set it to
`rotation-v2`, call again and confirm the new value is used and the old one no longer appears.
Remove the token entirely and the call must return HTTP 401 rather than an unhandled error.

Because the value is echoed, this tool is NOT suitable for the "users cannot see the admin secret"
check; use qa_nasa_admin_key for that.
