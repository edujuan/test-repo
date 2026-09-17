---
id: qa_reference_complete
read:
  - juan <juan@bevel.software>
write:
  - juan <juan@bevel.software>
owner:
  - juan <juan@bevel.software>
download:
  - juan <juan@bevel.software>
type: inline
remote: true
variables:
  - name: QA_REF_ADMIN_KEY
    scope: admin
    label: "Shared DUMMY key (throwaway value) - echoed back by httpbin.org"
  - name: QA_REF_USER_KEY
    scope: user
    label: "Your own DUMMY key (throwaway value) - echoed back by httpbin.org"
tools:
  - name: reference_probe_get
    description: "Reference tool with every field populated. Sends a GET to httpbin.org/anything and returns the request as the server saw it: query args, headers (including both injected dummy keys) and origin."
    inputs:
      type: object
      properties:
        label:
          type: string
          description: "Free-text tag that will appear under args.label in the echo."
        count:
          type: integer
          description: "Any integer 1-100, appears under args.count."
          minimum: 1
          maximum: 100
        mode:
          type: string
          description: "One of the allowed values, appears under args.mode."
          enum: [fast, slow, dry-run]
      required: [label]
    outputs:
      type: object
      properties:
        args: { type: object, description: "Query parameters as received." }
        headers: { type: object, description: "Request headers as received." }
        method: { type: string }
        origin: { type: string }
        url: { type: string }
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://httpbin.org/anything/reference
      headers:
        Authorization: Bearer ${QA_REF_ADMIN_KEY}
        X-Qa-User-Key: ${QA_REF_USER_KEY}
        X-Qa-Fixture: qa_reference_complete
  - name: reference_probe_post
    description: "Companion POST: sends a JSON body to httpbin.org/anything and returns it under `json`, plus the received headers."
    inputs:
      type: object
      properties:
        body:
          type: object
          description: "Any JSON object; echoed back verbatim under json."
      required: [body]
    outputs:
      type: object
      properties:
        json: { type: object }
        headers: { type: object }
        method: { type: string }
    tool_call_template:
      call_template_type: http
      http_method: POST
      url: https://httpbin.org/anything/reference
      content_type: application/json
      body_field: body
      headers:
        Authorization: Bearer ${QA_REF_ADMIN_KEY}
        X-Qa-Fixture: qa_reference_complete
---
QA fixture (2026-09-17): "create a valid tool and verify every required field is recognized".

This manual deliberately uses every documented frontmatter field - `id`, all four access verbs
(`read`/`write`/`owner`/`download`), `type`, `remote`, a `variables` block with one admin- and one
user-scoped entry with labels - and two UTCP tools whose `inputs` use required fields, integer
bounds and an enum, whose `outputs` are fully described, and whose call templates cover GET with
headers and POST with a JSON body. Open it in the admin UI and confirm each of those surfaces:
owner, source (httpbin.org), required credentials (two), capabilities (two tools).

httpbin.org echoes headers, so both keys must be throwaway values.
