---
id: qa_rest_countries
type: inline
tools:
  - name: country_lookup
    description: "Country facts by name from REST Countries v3.1: capital, region, population, currencies, languages, coordinates. No credentials."
    inputs:
      type: object
      properties:
        name:
          type: string
          description: "Country name, e.g. Germany (partial names match several countries)"
        fields:
          type: string
          description: "Optional comma-separated fields to return, e.g. name,capital,region,population,currencies,latlng"
      required: [name]
    outputs:
      type: array
      items: { type: object }
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://restcountries.com/v3.1/name/{name}
---
QA fixture (2026-09-17): credential-free, path-parameter lookup with an optional query filter.
