---
name: test-multi-tool-report
description: Test skill. Chains three tools from two manuals (weather, currency, echo) into one report.
allowed-tools: [weather_forecast, fx_latest, echo_post]
metadata:
  version: "0.1.0"
  owner: "Test Toolkit"
  lifecycle: active
---
# Multi-tool report

1. Call `weather_forecast` for Leipzig (51.34, 12.37) with `current: temperature_2m`.
2. Call `fx_latest` with `from: EUR`, `to: USD`.
3. Call `echo_post` with `body` containing both results.
4. Report the echoed `json` and confirm it matches what steps 1 and 2 returned. Report which step failed, if any.
