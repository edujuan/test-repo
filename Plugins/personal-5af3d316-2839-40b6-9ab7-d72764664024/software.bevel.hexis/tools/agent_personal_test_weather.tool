---
id: agent_personal_test_weather
type: inline
tools:
  - name: personal_weather_forecast
    description: "Personal-plugin test copy: current weather from Open-Meteo (no API key)."
    inputs:
      type: object
      properties:
        latitude:
          type: number
        longitude:
          type: number
        current:
          type: string
      required: [latitude, longitude, current]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.open-meteo.com/v1/forecast
---
Disposable test tool for the agent-interaction plan (2026-09-16). No credentials.
