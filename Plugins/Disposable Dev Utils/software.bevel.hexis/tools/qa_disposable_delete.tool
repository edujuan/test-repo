---
id: qa_disposable_delete
type: inline
tools:
  - name: uuid_generate
    description: "Returns a fresh random UUID v4 from httpbin.org. No credentials. Exists to be DELETED as part of the tool lifecycle tests."
    inputs:
      type: object
      properties: {}
    outputs:
      type: object
      properties:
        uuid: { type: string }
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://httpbin.org/uuid
---
QA fixture (2026-09-17) for DELETION: "warn about affected plugins, skills, users and active
connections before deletion" and "delete a disposable tool and verify it disappears from the UI and
from agent discovery".

The skill `qa-lifecycle-check` in this plugin lists `uuid_generate` in its allowed-tools, so the
deletion warning has a dependent skill to name. After deleting, `list_tools` from a connected
agent must no longer include uuid_generate, without reconnecting.
