---
name: test-weather-brief
description: Test skill. Gives a one-line current-weather brief for a city using a credential-free tool.
allowed-tools: [weather_forecast]
metadata:
  version: "0.1.0"
  owner: "Test Toolkit"
  lifecycle: active
---
# Weather brief

1. Resolve the city to latitude/longitude yourself (default: Leipzig, 51.34, 12.37).
2. Call `weather_forecast` with `current: temperature_2m,wind_speed_10m`.
3. Reply in one line: `<city>: <temperature> °C, wind <speed> km/h (Open-Meteo, <time> UTC)`.
