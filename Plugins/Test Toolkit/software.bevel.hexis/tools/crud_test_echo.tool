---
id: crud_test_echo
type: inline
variables:
  - name: ECHO_TOKEN
    scope: admin
    label: "Shared DUMMY token (any throwaway value, never a real secret) - httpbin.org echoes it back"
  - name: ECHO_USER_KEY
    scope: user
    label: "Your own DUMMY key (any throwaway value, never a real secret) - httpbin.org echoes it back"
tools:
  - name: echo_get
    description: "Send a message to httpbin.org as a query parameter and get it echoed back. Tests a basic GET round-trip."
    inputs:
      type: object
      properties:
        message:
          type: string
          description: Any text to echo back.
      required: [message]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://httpbin.org/get
  - name: echo_post
    description: "POST a JSON body to httpbin.org and get it echoed back under `json`. Tests request bodies."
    inputs:
      type: object
      properties:
        body:
          type: object
          description: Any JSON object to send.
      required: [body]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: POST
      url: https://httpbin.org/post
      content_type: application/json
      body_field: body
  - name: echo_headers
    description: "Return the request headers httpbin.org received. Shows whether the shared and per-user test secrets were injected."
    inputs:
      type: object
      properties: {}
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://httpbin.org/headers
      headers:
        Authorization: Bearer ${ECHO_TOKEN}
        X-Test-User-Key: ${ECHO_USER_KEY}
---
Test fixture (2026-09-16). httpbin.org is a public echo service: only ever configure throwaway values here.
Covers: GET query params, POST JSON bodies, admin-scoped and user-scoped secret injection.
