---
id: qa_frankfurter
type: inline
tools:
  - name: fx_latest_rates
    description: "Latest ECB reference exchange rates from Frankfurter. No credentials."
    inputs:
      type: object
      properties:
        from:
          type: string
          description: "Base currency code, e.g. EUR"
        to:
          type: string
          description: "Comma-separated target currency codes, e.g. USD,GBP,CHF"
      required: [from, to]
    outputs:
      type: object
      properties:
        base: { type: string }
        date: { type: string }
        rates: { type: object }
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.frankfurter.app/latest
  - name: fx_historical_rates
    description: "ECB reference exchange rates on a past date (1999-01-04 onward) from Frankfurter. No credentials."
    inputs:
      type: object
      properties:
        date:
          type: string
          description: "Date as YYYY-MM-DD"
        from:
          type: string
          description: "Base currency code, e.g. EUR"
        to:
          type: string
          description: "Comma-separated target currency codes"
      required: [date, from, to]
    outputs:
      type: object
      properties:
        base: { type: string }
        date: { type: string }
        rates: { type: object }
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.frankfurter.app/{date}
---
QA fixture (2026-09-17). Same host and parameter names as Test Toolkit's crud_test_fx, verified
2026-09-16; adds a path-parameter variant for historical dates.
