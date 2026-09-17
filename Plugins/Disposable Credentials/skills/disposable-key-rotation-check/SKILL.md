---
name: disposable-key-rotation-check
description: Disposable test skill. Reports which shared dummy bearer token is currently live by calling httpbin.org, showing only the first three characters.
allowed-tools: [bearer_admin_whoami]
metadata:
  version: "0.1.0"
  owner: "Disposable Credentials"
  lifecycle: active
---
# Key rotation check

1. Call `bearer_admin_whoami` with no arguments.
2. On HTTP 200 report `token` as its first 3 characters followed by `...` and its length, e.g. `live key: abc... (12 chars)`. Never print the full value even though it is a dummy.
3. On HTTP 401 report that no shared token is configured (the key has been removed or was never set).
4. If the value contains a literal `${` placeholder, report that secret injection failed.
