---
id: qa_rename_me
type: inline
tools:
  - name: delayed_response
    description: "Waits the requested number of seconds on httpbin.org before responding. Exists to be RENAMED and re-described as part of the tool lifecycle tests."
    inputs:
      type: object
      properties:
        seconds:
          type: integer
          description: "Seconds to wait before responding, 0-10."
          minimum: 0
          maximum: 10
      required: [seconds]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://httpbin.org/delay/{seconds}
---
QA fixture (2026-09-17) for EDITING: "update its name, description, instructions or authentication
configuration" and "verify stable identifiers and plugin references remain valid after editing".

The stable identifier is the frontmatter `id` (qa_rename_me): it is the route slug and the
namespace any secret would bind to. Edit the tool's `name`, its `description` and these notes
(the instructions) and confirm: the id and route are unchanged, this plugin still lists the manual,
and the skill `qa-lifecycle-check` - which references `delayed_response` in allowed-tools - is
flagged if the tool name it depends on changes.
