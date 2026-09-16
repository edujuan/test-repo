---
name: test-secret-injection
description: Test skill. Verifies that admin-scoped and user-scoped secrets are injected into tool requests.
allowed-tools: [echo_headers]
metadata:
  version: "0.1.0"
  owner: "Test Toolkit"
  lifecycle: active
---
# Secret injection check

1. Call `echo_headers` with no arguments.
2. In the returned `headers`, inspect `Authorization` and `X-Test-User-Key`.
3. Report for each one: present with a value, present but empty, or contains a literal `${...}` placeholder (injection failed).
4. Never print the full values. Show only the first 3 characters followed by `...`.

If the call fails, report the exact error text: it tells the tester whether the secret is missing, unauthorized, or misconfigured.
