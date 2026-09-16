---
id: crud_test_fx
type: inline
tools:
  - name: fx_latest
    description: "Latest ECB reference exchange rates from Frankfurter (no API key)."
    inputs:
      type: object
      properties:
        from:
          type: string
          description: Base currency code, e.g. EUR
        to:
          type: string
          description: Comma-separated target currency codes, e.g. USD,GBP
      required: [from, to]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.frankfurter.app/latest
---
Test fixture (2026-09-16). Endpoint verified 2026-09-16 (HTTP 200, no key required).
