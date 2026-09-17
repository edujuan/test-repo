---
id: disposable_geo_malformed
type: inline
owner:
  - juan <juan@bevel.software>
variables:
  - name: MALFORMED_KEY
    scope: shared
    label: "Deliberately invalid entry - scope must be admin or user"
tools:
  - name: geo_malformed_probe
    description: "DELIBERATELY MALFORMED disposable fixture. The variables entry above uses scope 'shared', which is not a valid scope, so this file must fail to load with an error that names this file and the invalid field. It must never become callable, and it must not hide the valid tools in disposable_geo_weather and disposable_geo_lookup."
    inputs:
      type: object
      properties: {}
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://httpbin.org/status/500
---
Negative test fixture, created 2026-09-17. Exactly ONE field is invalid on purpose: variables[0].scope = "shared" (valid values are admin and user). Everything else in the file is well-formed, so the loader error should point at this file and at that field only.

Covers: create a malformed disposable tool and verify the error identifies the file and the invalid field; verify one malformed tool does not hide or disable the unrelated valid tools in the same plugin.

When the check is done, rename this file to disposable_geo_malformed.tool.disabled (as was done with crud_test_broken_variables in Test Toolkit) or delete it.
