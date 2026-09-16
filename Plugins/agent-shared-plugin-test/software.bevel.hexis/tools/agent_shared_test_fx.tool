---
id: agent_shared_test_fx
type: inline
tools:
  - name: shared_fx_latest
    description: "Shared-plugin test copy: latest ECB exchange rates from Frankfurter (no API key)."
    inputs:
      type: object
      properties:
        from:
          type: string
        to:
          type: string
      required: [from, to]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.frankfurter.app/latest
---
Disposable test tool for the agent-interaction plan (2026-09-16). No credentials.
