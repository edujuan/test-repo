---
id: qa_disposable_retire
type: inline
tools:
  - name: http_status_probe
    description: "Asks httpbin.org to respond with a specific HTTP status code, so error surfacing (4xx, 5xx) can be tested on demand. Exists to be RETIRED as part of the tool lifecycle tests."
    inputs:
      type: object
      properties:
        code:
          type: integer
          description: "HTTP status code to receive, e.g. 200, 404, 429, 503."
          minimum: 200
          maximum: 599
      required: [code]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://httpbin.org/status/{code}
---
QA fixture (2026-09-17) for RETIREMENT: "retire a tool and verify it is no longer offered for new
use". Retire it through the admin UI and confirm agents stop discovering http_status_probe while
the file and its history remain for owners.

Also handy on its own: call it with 429 or 503 to see how the platform reports upstream errors.
