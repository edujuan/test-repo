---
id: disposable_nasa
type: inline
owner:
  - juan <juan@bevel.software>
write:
  - juan <juan@bevel.software>
variables:
  - name: NASA_API_KEY
    scope: admin
    label: "Shared api.nasa.gov key. DEMO_KEY is a valid public key (30 requests/hour per IP); any other string is rejected by NASA with HTTP 403 API_KEY_INVALID"
tools:
  - name: nasa_apod
    description: "NASA Astronomy Picture of the Day for a date. Authenticates with the shared admin key sent in the X-Api-Key header. NASA rejects an invalid key with HTTP 403 and a JSON error naming the problem, so this is the tool to use for 'test connection', invalid-key and removed-key checks. The response never contains the key. Disposable test tool."
    inputs:
      type: object
      properties:
        date:
          type: string
          description: Date as YYYY-MM-DD (defaults to today when omitted)
        thumbs:
          type: boolean
          description: Return a thumbnail URL when the picture of the day is a video
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.nasa.gov/planetary/apod
      headers:
        X-Api-Key: ${NASA_API_KEY}
  - name: nasa_neo_feed
    description: "Near-Earth objects approaching Earth in a date range (at most 7 days) from NASA NeoWs. Second dependent of the same shared admin key, so rotating or removing the key can be seen to affect every tool in the manual, not just one. Disposable test tool."
    inputs:
      type: object
      properties:
        start_date:
          type: string
          description: Start of the range as YYYY-MM-DD
        end_date:
          type: string
          description: End of the range as YYYY-MM-DD, at most 7 days after start_date (defaults to 7 days)
      required: [start_date]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.nasa.gov/neo/rest/v1/feed
      headers:
        X-Api-Key: ${NASA_API_KEY}
---
Disposable test fixture, created 2026-09-17 by the agent for the tool-management test plan. Safe to edit, retire or delete.

Owner and writers: juan <juan@bevel.software> (frontmatter). Whoever is listed under write may set the shared key.
Source: NASA Open APIs (https://api.nasa.gov) served through api.data.gov, whose docs (https://api.data.gov/docs/api-key/) allow the key in the X-Api-Key header. Verified 2026-09-17.
Credentials: one admin-scoped key, NASA_API_KEY, stored in the vault as disposable_nasa_NASA_API_KEY. Valid value for testing: DEMO_KEY (public, rate-limited). Invalid value for testing: anything else, e.g. not-a-real-key.
Expected behaviour: valid key -> HTTP 200 with the picture metadata; invalid key -> HTTP 403 with error.code API_KEY_INVALID and a message pointing to api.nasa.gov; key removed -> the call must fail safely (platform error about the missing secret, or a 403 from NASA), never succeed and never leak a placeholder.
Dependents: skill disposable-nasa-picture uses nasa_apod.

Covers: open credential setup for a shared admin key; enter a valid key and test the connection before saving; enter an invalid key and verify it is rejected with an actionable error; save the key and verify it is masked; rotate the key (pair with bearer_admin_whoami to see which key is live); remove the key and verify dependent calls fail safely; authorised users can use the tool without seeing the admin secret.
