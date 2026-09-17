---
name: disposable-stable-probe
description: Disposable test skill. Calls the stable-id probe tool and echoes the result; exists so edits to that tool have a dependent to break.
allowed-tools: [stable_probe_ping]
metadata:
  version: "0.1.0"
  owner: "Disposable Dev Utils"
  lifecycle: active
---
# Stable probe

1. Call `stable_probe_ping` with `probe` set to the current ISO timestamp.
2. Reply with `args.probe` from the response and PASS if it matches what was sent.
3. If `stable_probe_ping` is not in your tool list, reply `FAIL: stable_probe_ping missing` — this is the expected signal after the tool has been renamed, retired or deleted.
