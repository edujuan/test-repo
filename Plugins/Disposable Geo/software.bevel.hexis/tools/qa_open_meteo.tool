---
id: qa_open_meteo
type: inline
tools:
  - name: geo_current_weather
    description: "Current weather for a latitude/longitude from Open-Meteo. No credentials."
    inputs:
      type: object
      properties:
        latitude:
          type: number
          description: "Latitude in decimal degrees, e.g. 48.14"
        longitude:
          type: number
          description: "Longitude in decimal degrees, e.g. 11.58"
        current:
          type: string
          description: "Comma-separated variables, e.g. temperature_2m,wind_speed_10m,relative_humidity_2m"
      required: [latitude, longitude, current]
    outputs:
      type: object
      properties:
        current: { type: object }
        current_units: { type: object }
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.open-meteo.com/v1/forecast
  - name: geo_daily_forecast
    description: "Daily forecast (up to 16 days) for a latitude/longitude from Open-Meteo. No credentials."
    inputs:
      type: object
      properties:
        latitude:
          type: number
          description: "Latitude in decimal degrees"
        longitude:
          type: number
          description: "Longitude in decimal degrees"
        daily:
          type: string
          description: "Comma-separated daily variables, e.g. temperature_2m_max,temperature_2m_min,precipitation_sum"
        forecast_days:
          type: integer
          description: "Number of days, 1-16 (default 7)"
          minimum: 1
          maximum: 16
        timezone:
          type: string
          description: "IANA timezone for day boundaries, e.g. Europe/Berlin, or auto"
      required: [latitude, longitude, daily]
    outputs:
      type: object
      properties:
        daily: { type: object }
        daily_units: { type: object }
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.open-meteo.com/v1/forecast
  - name: geo_geocode_city
    description: "Resolve a place name to coordinates, country and timezone with Open-Meteo's geocoding API. No credentials."
    inputs:
      type: object
      properties:
        name:
          type: string
          description: "Place name, e.g. Munich"
        count:
          type: integer
          description: "Max results, 1-100 (default 10)"
          minimum: 1
          maximum: 100
        language:
          type: string
          description: "Two-letter language code for names, e.g. en, de"
      required: [name]
    outputs:
      type: object
      properties:
        results: { type: array }
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://geocoding-api.open-meteo.com/v1/search
---
QA fixture (2026-09-17): credential-free weather and geocoding tools for plugin-membership,
sidebar and agent-discovery tests, and a realistic multi-step skill target (geocode a city, then
fetch its weather). Open-Meteo requires no key; the same forecast host is already verified by
Test Toolkit's crud_test_weather (2026-09-16).
