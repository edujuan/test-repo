---
id: crud_test_weather
type: inline
tools:
  - name: weather_forecast
    description: "Current weather for a latitude/longitude from Open-Meteo (no API key). Tests a credential-free tool."
    inputs:
      type: object
      properties:
        latitude:
          type: number
          description: Latitude in decimal degrees, e.g. 51.34
        longitude:
          type: number
          description: Longitude in decimal degrees, e.g. 12.37
        current:
          type: string
          description: Comma-separated variables, e.g. temperature_2m,wind_speed_10m
      required: [latitude, longitude, current]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.open-meteo.com/v1/forecast
---
Test fixture (2026-09-16). Endpoint verified 2026-09-16 (HTTP 200, no key required).
