---
id: disposable_stable_probe
type: inline
owner:
  - juan <juan@bevel.software>
tools:
  - name: stable_probe_ping
    description: "Credential-free GET to httpbin.org/get that echoes the query. This manual exists to be EDITED: its id (disposable_stable_probe) deliberately differs from its file name (disposable_edit_me.tool), so testers can rename the file, retitle this tool, rewrite this description or add a variable and confirm the id, its vault namespace and the skill that references the tool still resolve. Disposable test tool."
    inputs:
      type: object
      properties:
        probe:
          type: string
          description: Any short text, echoed back under args.probe
      required: [probe]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://httpbin.org/get
---
Disposable test fixture, created 2026-09-17 by the agent for the tool-management test plan. Built to be edited.

Owner: juan <juan@bevel.software> (frontmatter).
Source: httpbin.org/get (public echo service). Credentials: none at creation time; add a variables block with an admin-scoped ${PROBE_KEY} to test changing the authentication configuration after the fact.
Stable identifier: id = disposable_stable_probe. The file name is intentionally different so an edit or rename of the file proves that grants, the vault namespace (disposable_stable_probe_<VAR>) and the route slug follow the id, not the path.
Dependents: skill disposable-stable-probe references stable_probe_ping in allowed-tools; renaming the tool inside this file should surface as a broken reference in that skill.

Covers: update the tool's name, description, instructions or authentication configuration; verify stable identifiers and plugin references remain valid after editing; audit history for edit actions.
