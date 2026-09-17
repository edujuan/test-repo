---
id: disposable_geo_weather
type: inline
remote: true
owner:
  - juan <juan@bevel.software>
tools:
  - name: geo_current_weather
    description: "Current conditions (temperature, humidity, wind, weather code) for a latitude/longitude from Open-Meteo. No credentials. Disposable test tool."
    inputs:
      type: object
      properties:
        latitude:
          type: number
          description: Latitude in decimal degrees, e.g. 48.14 for Munich
        longitude:
          type: number
          description: Longitude in decimal degrees, e.g. 11.58 for Munich
        current:
          type: string
          description: Comma-separated current variables, e.g. temperature_2m,relative_humidity_2m,wind_speed_10m,weather_code
      required: [latitude, longitude, current]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.open-meteo.com/v1/forecast
  - name: geo_daily_forecast
    description: "Daily forecast (min/max temperature, precipitation, sunrise, sunset) for 1-16 days from Open-Meteo. No credentials. Disposable test tool."
    inputs:
      type: object
      properties:
        latitude:
          type: number
          description: Latitude in decimal degrees
        longitude:
          type: number
          description: Longitude in decimal degrees
        daily:
          type: string
          description: Comma-separated daily variables, e.g. temperature_2m_max,temperature_2m_min,precipitation_sum,sunrise,sunset
        forecast_days:
          type: integer
          description: Number of days to return, 1-16 (default 7)
        timezone:
          type: string
          description: IANA timezone for day boundaries, e.g. Europe/Berlin, or auto
      required: [latitude, longitude, daily]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.open-meteo.com/v1/forecast
  - name: geo_air_quality
    description: "Current air quality (European AQI, PM2.5, PM10, ozone) for a latitude/longitude from Open-Meteo's air-quality service. No credentials. Disposable test tool."
    inputs:
      type: object
      properties:
        latitude:
          type: number
          description: Latitude in decimal degrees
        longitude:
          type: number
          description: Longitude in decimal degrees
        current:
          type: string
          description: Comma-separated variables, e.g. european_aqi,pm2_5,pm10,ozone
      required: [latitude, longitude, current]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://air-quality-api.open-meteo.com/v1/air-quality
---
Disposable test fixture, created 2026-09-17 by the agent for the tool-management test plan. Safe to edit, retire or delete.

Owner: juan <juan@bevel.software> (declared in the frontmatter).
Source: Open-Meteo forecast API (https://open-meteo.com/en/docs) and air-quality API (https://open-meteo.com/en/docs/air-quality-api). Endpoints re-verified 2026-09-17; no API key needed for non-commercial use.
Credentials: none.
Capabilities: three credential-free GET tools in one manual, with every field of the tool schema populated (inputs with a required list, outputs, call template) and the optional `remote` flag set explicitly.
Dependents: skill disposable-geo-brief uses geo_current_weather and geo_air_quality.

Covers: create a valid tool and verify every required field is recognised; agent discovery without reconnecting; plugin membership; edit / retire / delete of a tool that has a dependent skill.
