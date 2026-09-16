---
name: test-fx-convert
description: Test skill. Converts an amount between currencies using the latest ECB reference rate.
allowed-tools: [fx_latest]
metadata:
  version: "0.1.0"
  owner: "Test Toolkit"
  lifecycle: active
---
# Currency conversion

1. Get amount, source and target currency from the user (default: 100 EUR to USD).
2. Call `fx_latest` with `from` and `to`.
3. Multiply the amount by the returned rate and reply with the result, the rate, and the rate's `date`.
