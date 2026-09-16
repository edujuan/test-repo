---
name: test-repo-snapshot
description: Test skill with a bundled file. Summarises a public GitHub repository using a per-user token.
allowed-tools: [github_repo_info]
metadata:
  version: "0.1.0"
  owner: "Test Toolkit"
  lifecycle: active
---
# Repository snapshot

1. Get `owner` and `repo` from the user (default: anthropics / anthropic-sdk-python).
2. Call `github_repo_info`.
3. Format the answer using the template in the bundled `reference.md`.
4. If the call returns HTTP 401 or 403, tell the user to sign in or set their GitHub token on the Connect page, and quote the error message.
