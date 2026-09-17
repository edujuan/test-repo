---
id: disposable_restricted
type: inline
read:
  - juan <juan@bevel.software>
owner:
  - juan <juan@bevel.software>
tools:
  - name: restricted_ping
    description: "Credential-free GET to httpbin.org/get that echoes the query. This manual's own frontmatter limits read to one person, so members admitted to the plugin still cannot discover or call it until they are added to the read list here. Tests tool-level access overriding plugin-level access. Disposable test tool."
    inputs:
      type: object
      properties:
        tag:
          type: string
          description: Any short text, echoed back under args.tag
      required: [tag]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://httpbin.org/get
---
Disposable test fixture, created 2026-09-17 by the agent for the tool-management test plan. Safe to edit, retire or delete.

Owner: juan <juan@bevel.software>. Readers: only the person listed under read in the frontmatter, regardless of who the plugin's access.md admits.
Source: httpbin.org/get (public echo service). Credentials: none.

Covers: grant a user or group access to the configured tool (add them to read here, or remove the read block to fall back to the plugin's access.md); verify unauthorised users cannot discover or invoke the tool; change or remove access and verify agent discovery refreshes accordingly.
