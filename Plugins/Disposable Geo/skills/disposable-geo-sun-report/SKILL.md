---
name: disposable-geo-sun-report
description: Disposable test skill, DEPRECATED on purpose. Reports sunrise and sunset for a coordinate; exists to exercise the retire flow and the library's deprecated flag.
allowed-tools: [geo_sun_times]
metadata:
  version: "0.1.0"
  owner: "Disposable Geo"
  lifecycle: deprecated
---
# Sun report (deprecated fixture)

1. Call `geo_sun_times` with `lat`, `lng` (default: Munich, 48.14 / 11.58) and `date: today`.
2. Reply in one line: `Sunrise <sunrise>, sunset <sunset>, day length <day_length> (sunrise-sunset.org)`.

This skill is marked `lifecycle: deprecated` so testers can check that deprecated skills are still served but flagged, and that retiring or deleting `geo_sun_times` warns about this dependent.
