---
name: disposable-github-identity
description: Disposable test skill. Tells the user which GitHub account their OAuth sign-in is using, or that they need to (re)connect.
allowed-tools: [github_oauth_whoami]
metadata:
  version: "0.1.0"
  owner: "Disposable Credentials"
  lifecycle: active
---
# GitHub identity

1. Call `github_oauth_whoami` with no arguments.
2. On HTTP 200 reply: `Signed in to GitHub as <login> (<name>)`.
3. On HTTP 401 tell the user their GitHub authorisation is missing, expired or revoked and that they should reconnect on the Connect page. Quote the error message.
4. On HTTP 403 quote the message; it is usually a rate limit.
