---
id: crud_test_broken_variables
type: inline
variables:
  - name: BROKEN-NAME-WITH-DASHES
    scope: everyone
tools:
  - name: broken_tool
    description: "DELIBERATELY BROKEN fixture. Should fail to load and never be callable."
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
Negative test fixture (2026-09-16): the variables entry uses an invalid name (dashes) and an invalid scope, so the platform should refuse to load this file and surface a clear error.
