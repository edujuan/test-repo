---
id: qa_sun_times
type: inline
tools:
  - name: sunrise_sunset
    description: "Sunrise, sunset, solar noon and twilight times for a latitude/longitude and date, from sunrise-sunset.org. Times are UTC ISO 8601 when formatted=0. No credentials."
    inputs:
      type: object
      properties:
        lat:
          type: number
          description: "Latitude in decimal degrees"
        lng:
          type: number
          description: "Longitude in decimal degrees"
        date:
          type: string
          description: "Date as YYYY-MM-DD, or today / tomorrow (default today)"
        formatted:
          type: integer
          description: "0 for ISO 8601 UTC timestamps (recommended), 1 for 12-hour clock strings"
          enum: [0, 1]
      required: [lat, lng]
    outputs:
      type: object
      properties:
        results: { type: object }
        status: { type: string }
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.sunrise-sunset.org/json
---
QA fixture (2026-09-17): credential-free tool with an integer enum input, for completing the
Disposable Geo plugin's tool set.
