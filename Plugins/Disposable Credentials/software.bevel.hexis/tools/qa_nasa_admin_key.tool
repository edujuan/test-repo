---
id: qa_nasa_admin_key
type: inline
variables:
  - name: NASA_API_KEY
    scope: admin
    label: "Shared api.nasa.gov key. The public value DEMO_KEY is a real, valid key (30 req/hour); any other string is rejected by NASA with HTTP 403 API_KEY_INVALID."
tools:
  - name: nasa_apod
    description: "NASA Astronomy Picture of the Day: title, explanation and image URL for a date. Authenticates with the SHARED admin key in the X-Api-Key header. Expected: valid key -> HTTP 200; wrong key -> HTTP 403 API_KEY_INVALID; key removed -> HTTP 403 API_KEY_MISSING. The response never contains the key."
    inputs:
      type: object
      properties:
        date:
          type: string
          description: "Picture date as YYYY-MM-DD. Optional; defaults to today."
    outputs:
      type: object
      properties:
        title: { type: string }
        date: { type: string }
        explanation: { type: string }
        url: { type: string }
        media_type: { type: string }
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.nasa.gov/planetary/apod
      headers:
        X-Api-Key: ${NASA_API_KEY}
  - name: nasa_neo_feed
    description: "Near-Earth objects (asteroids) approaching Earth between two dates, at most 7 days apart (NASA NeoWs). Uses the SAME shared key as nasa_apod: rotating or removing NASA_API_KEY must affect both tools."
    inputs:
      type: object
      properties:
        start_date:
          type: string
          description: "Start date as YYYY-MM-DD."
        end_date:
          type: string
          description: "End date as YYYY-MM-DD, no more than 7 days after start_date."
      required: [start_date, end_date]
    outputs:
      type: object
      properties:
        element_count: { type: integer }
        near_earth_objects: { type: object }
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.nasa.gov/neo/rest/v1/feed
      headers:
        X-Api-Key: ${NASA_API_KEY}
---
QA fixture (2026-09-17) for the SHARED-ADMIN-KEY test cases: open credential setup, enter a
valid key and test the connection, enter an invalid key and see it rejected, save and confirm
the secret is masked, rotate, remove.

Why NASA: api.nasa.gov (fronted by api.data.gov) publishes a real public key, `DEMO_KEY`, so a
tester has a known-good value without signing up for anything, and the server validates the key
strictly, so a wrong value produces a clear, actionable 403 instead of silently succeeding.
Source: https://api.data.gov/docs/api-key/ (X-Api-Key header) and
https://api.nasa.gov/assets/html/authentication.html (DEMO_KEY, 30 requests/hour per IP), both
read 2026-09-17.

Test script:
1. Configure NASA_API_KEY = DEMO_KEY, test connection with nasa_apod -> 200.
2. Set it to `not-a-real-key` -> 403 API_KEY_INVALID.
3. Save DEMO_KEY again; confirm the value is masked and cannot be read back.
4. Rotate: change the value and call nasa_apod; a wrong new value fails, a valid one succeeds.
5. Remove the key -> both tools return 403 API_KEY_MISSING (fail safely, no crash).
