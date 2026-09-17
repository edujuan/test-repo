---
id: qa_restricted_access
read:
  - juan <juan@bevel.software>
write:
  - juan <juan@bevel.software>
owner:
  - juan <juan@bevel.software>
type: inline
tools:
  - name: caller_ip
    description: "Returns the public IP address the call originated from, as seen by httpbin.org. No credentials. Its only purpose is to have a tool whose visibility is restricted at the FILE level."
    inputs:
      type: object
      properties: {}
    outputs:
      type: object
      properties:
        origin: { type: string }
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://httpbin.org/ip
---
QA fixture (2026-09-17) for ACCESS: "grant a user or group access", "authorized users can use the
tool", "unauthorized users cannot discover or invoke the tool", "change or remove access and verify
agent discovery refreshes".

The frontmatter `read:` list above is the most specific rule and overrides the plugin's access.md,
so even a member of Disposable Dev Utils cannot see this tool unless named here. To grant someone,
add a person as `Name <email>`, a role from roles.yaml or a group from groups.yaml under `read:`;
remove the line to revoke. In each case the other person's agent should gain or lose `caller_ip`
in `list_tools` without reconnecting, and a call by an unauthorized user must be refused, not
merely hidden.
