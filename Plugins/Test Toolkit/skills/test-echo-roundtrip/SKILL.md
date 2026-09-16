---
name: test-echo-roundtrip
description: Test skill. Sends a message through GET and POST echo tools and checks both come back unchanged.
allowed-tools: [echo_get, echo_post]
metadata:
  version: "0.1.0"
  owner: "Test Toolkit"
  lifecycle: active
---
# Echo round-trip

1. Ask the user for a short message (default: `hexis-roundtrip-check`).
2. Call `echo_get` with `message` set to it. Confirm `args.message` in the response equals the input.
3. Call `echo_post` with `body: {"message": <same text>, "sent_at": <current ISO time>}`. Confirm `json.message` matches.
4. Report PASS only if both matched; otherwise report FAIL with the raw mismatching values.
