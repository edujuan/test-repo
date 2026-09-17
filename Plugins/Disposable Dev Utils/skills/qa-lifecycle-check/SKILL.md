---
name: qa-lifecycle-check
description: QA fixture. Depends on three Disposable Dev Utils tools so the rename, retire and delete tests have a dependent skill to warn about.
allowed-tools: [uuid_generate, delayed_response, http_status_probe]
metadata:
  version: "0.1.0"
  owner: "QA Fixtures"
  lifecycle: active
---
# Lifecycle check

1. Call `uuid_generate` and note the UUID.
2. Call `delayed_response` with `seconds: 1`.
3. Call `http_status_probe` with `code: 204`.
4. Reply with one line per step: the tool name and whether it was still callable.

If any of the three tools is missing from your tool list, say which one and stop - that is the
expected result after the corresponding tool has been renamed, retired or deleted.
