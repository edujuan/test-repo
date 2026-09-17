---
id: qa_malformed_probe
type: inline
variables:
  - name: QA-PROBE-KEY
    scope: admin
    label: "DELIBERATELY INVALID variable name (contains dashes)"
tools:
  - name: malformed_probe
    description: "DELIBERATELY MALFORMED fixture. This manual must fail to load and this tool must never be callable."
    inputs:
      type: object
      properties: {}
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://httpbin.org/status/418
---
NEGATIVE QA fixture (2026-09-17): "create a malformed disposable tool and verify the error
identifies the file and the invalid field" and "verify one malformed tool does not hide or disable
unrelated valid tools".

Exactly ONE thing is wrong: `variables[0].name` is `QA-PROBE-KEY`, and AGENTS.md requires variable
names to match `[A-Za-z0-9_]+`. Everything else in the file is valid, so the expected outcome is a
load error that names THIS file and THAT field - not a generic parse failure.

The other seven manuals in this plugin (qa_reference_complete, qa_disposable_delete,
qa_disposable_retire, qa_rename_me, qa_restricted_access, qa_package_registries) must keep loading
and stay callable while this one is broken. If the error is too noisy to leave in place, rename the
file to `.tool.disabled`, the convention already used by crud_test_broken_variables in Test Toolkit.
