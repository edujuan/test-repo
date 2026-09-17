---
name: disposable-geo-brief
description: Disposable test skill. One-line weather and air-quality brief for a named city, resolving the city with geocoding first.
allowed-tools: [geo_search_city, geo_current_weather, geo_air_quality]
metadata:
  version: "0.1.0"
  owner: "Disposable Geo"
  lifecycle: active
---
# Geo brief

1. Call `geo_search_city` with the city name (default: Munich) and `count: 1`; take `latitude`, `longitude` and `timezone` from the first result.
2. Call `geo_current_weather` for those coordinates with `current: temperature_2m,wind_speed_10m,weather_code`.
3. Call `geo_air_quality` for the same coordinates with `current: european_aqi,pm2_5`.
4. Reply in one line: `<city>, <country>: <temperature> °C, wind <speed> km/h, European AQI <aqi> (Open-Meteo, <time>)`.

If any tool is missing from your tool list, say which one: this skill exists partly to show what happens when a tool it depends on is edited, retired or deleted.
