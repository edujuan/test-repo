---
id: qa_github_oauth
type: inline
variables:
  - name: GITHUB_OAUTH_TOKEN
    scope: user
    label: "GitHub sign-in (OAuth). Authorize on the Connect page."
    oauth:
      clientId: REPLACE_WITH_GITHUB_OAUTH_APP_CLIENT_ID
      authorizationUrl: https://github.com/login/oauth/authorize
      tokenUrl: https://github.com/login/oauth/access_token
      scopes: [read:user]
tools:
  - name: github_viewer
    description: "The signed-in GitHub user's own profile (login, name, public repo count). Proves the OAuth token obtained on the Connect page is the credential being sent."
    inputs:
      type: object
      properties: {}
    outputs:
      type: object
      properties:
        login: { type: string }
        name: { type: string }
        public_repos: { type: integer }
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.github.com/user
      headers:
        Accept: application/vnd.github+json
        Authorization: Bearer ${GITHUB_OAUTH_TOKEN}
  - name: github_rate_limit
    description: "GitHub API rate-limit status for the current credential. An authenticated call reports a 5,000/hour core limit; an unauthenticated or revoked one reports 60/hour or HTTP 401 - a quick way to see whether the OAuth token is live, expired or revoked."
    inputs:
      type: object
      properties: {}
    outputs:
      type: object
      properties:
        rate: { type: object }
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.github.com/rate_limit
      headers:
        Accept: application/vnd.github+json
        Authorization: Bearer ${GITHUB_OAUTH_TOKEN}
---
QA fixture (2026-09-17) for the MANUAL OAuth test cases: start and complete the sign-in flow, cancel
or deny consent and retry, expire or revoke the authorization and see the UI ask to reconnect.

GitHub offers no dynamic client registration, so this is the `oauth-manual` shape described in
AGENTS.md: the sign-in variable names the client id of an OAuth app the owner registers, and the
client secret is pasted once on the tool's page (never into this file).

ONE-TIME SETUP (owner) - the clientId above is a placeholder until this is done:
1. GitHub -> Settings -> Developer settings -> OAuth Apps -> New OAuth App. Authorization callback
   URL: `<backend>/api/secrets/oauth/callback` - run `list_tool_setup` and copy the exact URI from
   `setup.reason`; for this deployment it should be https://juan-hexis.bevel.software/api/secrets/oauth/callback
2. Replace `REPLACE_WITH_GITHUB_OAUTH_APP_CLIENT_ID` above with the app's Client ID (public value).
   Doing this edit through the tool page doubles as the "update authentication configuration" test.
3. Paste the app's Client secret into the "Client secret" field on the tool's page.
4. Each member authorizes on the Connect page, then calls github_viewer.

To test REVOCATION, revoke the app's authorization from GitHub -> Settings -> Applications ->
Authorized OAuth Apps; github_rate_limit then returns HTTP 401 and the Connect page should request
reconnection.

Endpoints are GitHub's documented OAuth web-application-flow URLs. PKCE is left at the platform
default; GitHub ignores it where unsupported.
