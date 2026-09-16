---
id: crud_test_github
type: inline
variables:
  - name: GITHUB_TOKEN
    scope: user
    label: "Your GitHub personal access token (public read access is enough)"
tools:
  - name: github_repo_info
    description: "Metadata for a public GitHub repository (stars, default branch, last push). Uses a path-parameter URL and a per-user token."
    inputs:
      type: object
      properties:
        owner:
          type: string
          description: Repository owner, e.g. anthropics
        repo:
          type: string
          description: Repository name, e.g. anthropic-sdk-python
      required: [owner, repo]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.github.com/repos/{owner}/{repo}
      headers:
        Accept: application/vnd.github+json
        Authorization: Bearer ${GITHUB_TOKEN}
---
Test fixture (2026-09-16). Unauthenticated calls to this endpoint were rate-limited (HTTP 403) from a shared IP on 2026-09-16, which makes it a good test for per-user tokens and for how rate-limit errors are surfaced.
