---
id: disposable_geo_lookup
type: inline
owner:
  - juan <juan@bevel.software>
tools:
  - name: geo_search_city
    description: "Resolve a place name to coordinates, country and timezone using Open-Meteo geocoding. No credentials. Disposable test tool."
    inputs:
      type: object
      properties:
        name:
          type: string
          description: Place name, optionally followed by a comma and a country or region, e.g. Munich or Springfield, IL
        count:
          type: integer
          description: Maximum number of matches, 1-100 (default 10)
        language:
          type: string
          description: Two-letter language code for the result names, e.g. en or de
      required: [name]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://geocoding-api.open-meteo.com/v1/search
  - name: geo_sun_times
    description: "Sunrise, sunset, solar noon and twilight times for a coordinate and date from sunrise-sunset.org (API v2). No credentials; the provider asks for attribution. Disposable test tool."
    inputs:
      type: object
      properties:
        lat:
          type: number
          description: Latitude in decimal degrees, -90 to 90
        lng:
          type: number
          description: Longitude in decimal degrees, -180 to 180
        date:
          type: string
          description: YYYY-MM-DD, today or tomorrow (default today)
      required: [lat, lng]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.sunrise-sunset.org/v2
  - name: geo_country_info
    description: "Country facts (capital, population, currencies, languages, region) by name from REST Countries v3.1. Uses a path parameter. No credentials. Disposable test tool."
    inputs:
      type: object
      properties:
        name:
          type: string
          description: Country name, full or partial, e.g. Germany
        fields:
          type: string
          description: Comma-separated fields to return so the response stays small, e.g. name,capital,population,currencies,languages,region
      required: [name]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://restcountries.com/v3.1/name/{name}
---
Disposable test fixture, created 2026-09-17 by the agent for the tool-management test plan. Safe to edit, retire or delete.

Owner: juan <juan@bevel.software> (declared in the frontmatter).
Source: Open-Meteo geocoding API (https://open-meteo.com/en/docs/geocoding-api), sunrise-sunset.org API v2 (https://sunrise-sunset.org/api), REST Countries v3.1 (https://restcountries.com). All verified 2026-09-17.
Credentials: none.
Capabilities: three vendors in one manual; geo_country_info exercises a path-parameter URL.
Dependents: skill disposable-geo-brief uses geo_search_city; skill disposable-geo-sun-report (lifecycle deprecated) uses geo_sun_times.

Covers: path-parameter URL; a tool whose only dependent skill is deprecated, for the retire flow; delete warnings that must list affected skills.
