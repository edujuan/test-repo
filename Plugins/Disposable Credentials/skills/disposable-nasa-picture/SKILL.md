---
name: disposable-nasa-picture
description: Disposable test skill. Fetches NASA's Astronomy Picture of the Day with the shared admin key and reports it, including how an authentication failure looks.
allowed-tools: [nasa_apod]
metadata:
  version: "0.1.0"
  owner: "Disposable Credentials"
  lifecycle: active
---
# NASA picture of the day

1. Call `nasa_apod` (optionally with a `date` the user gives, YYYY-MM-DD).
2. On HTTP 200 reply: `<title> (<date>): <url>` followed by the first sentence of `explanation`.
3. On HTTP 403 quote `error.code` and `error.message` verbatim and tell the user the shared NASA key is invalid or missing and must be set by a writer of the tool on the tool's page.
4. On any other failure quote the exact error text.

Never ask the user for the key value and never print it.
