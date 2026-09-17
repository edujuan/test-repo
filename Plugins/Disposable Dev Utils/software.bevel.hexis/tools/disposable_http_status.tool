---
id: disposable_http_status
type: inline
owner:
  - juan <juan@bevel.software>
tools:
  - name: http_status
    description: "Asks httpbin.org to answer with a specific HTTP status code (empty body). Use 200, 404, 429, 500 or 503 to see how each class of response is surfaced to the agent. Path-parameter URL. No credentials. Disposable test tool."
    inputs:
      type: object
      properties:
        code:
          type: integer
          description: HTTP status code to return, 200-599
      required: [code]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://httpbin.org/status/{code}
  - name: http_delay
    description: "Asks httpbin.org to wait the given number of seconds (max 10) before answering. Use it to observe slow calls and timeout handling. No credentials. Disposable test tool."
    inputs:
      type: object
      properties:
        seconds:
          type: integer
          description: Seconds to wait before responding, 0-10
      required: [seconds]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://httpbin.org/delay/{seconds}
  - name: http_uuid
    description: "Returns a fresh random UUID from httpbin.org. Zero-argument tool with no credentials, the simplest possible smoke test that a tool is callable. Disposable test tool."
    inputs:
      type: object
      properties: {}
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://httpbin.org/uuid
---
Disposable test fixture, created 2026-09-17 by the agent for the tool-management test plan. Safe to edit, retire or delete.

Owner: juan <juan@bevel.software> (frontmatter).
Source: httpbin.org (public request/response service; already used by the Test Toolkit fixtures). Credentials: none.
Capabilities: error-status surfacing, slow responses, a zero-argument smoke test.
Dependents: none. This manual is the one to use for pure UI lifecycle tests (add to plugin, remove from plugin, delete) because nothing else references it.

Covers: add the tool to a disposable plugin and verify it appears on the plugin page and in the sidebar; remove the tool from the plugin and verify membership updates everywhere; delete a disposable tool and verify it disappears from UI and agent discovery; audit history for create and delete.
