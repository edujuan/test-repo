---
id: disposable_github_oauth
type: inline
owner:
  - juan <juan@bevel.software>
write:
  - juan <juan@bevel.software>
variables:
  - name: GITHUB_OAUTH_TOKEN
    scope: user
    label: "GitHub sign-in (OAuth app registered by the tool owner)"
    oauth:
      clientId: REPLACE_WITH_GITHUB_OAUTH_APP_CLIENT_ID
      authorizationUrl: https://github.com/login/oauth/authorize
      tokenUrl: https://github.com/login/oauth/access_token
      scopes:
        - "read:user"
tools:
  - name: github_oauth_whoami
    description: "GET api.github.com/user with the signed-in member's GitHub OAuth token. Returns the login of the account that authorised, which proves whose credential the agent used. HTTP 401 means the authorisation was revoked or has expired and the member must reconnect. Disposable test tool."
    inputs:
      type: object
      properties: {}
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.github.com/user
      headers:
        Accept: application/vnd.github+json
        Authorization: Bearer ${GITHUB_OAUTH_TOKEN}
  - name: github_oauth_my_repos
    description: "First page of repositories visible to the signed-in member (public ones with the read:user scope). Second dependent of the same sign-in. Disposable test tool."
    inputs:
      type: object
      properties:
        per_page:
          type: integer
          description: Results per page, 1-100 (default 30)
        sort:
          type: string
          description: One of created, updated, pushed, full_name
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://api.github.com/user/repos
      headers:
        Accept: application/vnd.github+json
        Authorization: Bearer ${GITHUB_OAUTH_TOKEN}
---
Disposable test fixture, created 2026-09-17 by the agent for the tool-management test plan. Safe to edit, retire or delete.

Owner and writers: juan <juan@bevel.software> (frontmatter). A writer pastes the OAuth app's client secret on the tool's page; it is never stored in this file.
Source: GitHub OAuth apps, web application flow (https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authorizing-oauth-apps): authorize at https://github.com/login/oauth/authorize, exchange at https://github.com/login/oauth/access_token, PKCE S256 supported. Verified 2026-09-17.
Credentials: GITHUB_OAUTH_TOKEN, user scope, filled by OAuth sign-in on the Connect page. GitHub does not offer dynamic client registration, so this is the oauth-manual case: the owner registers an OAuth app with redirect URI <backend>/api/secrets/oauth/callback (list_tool_setup shows the exact value in setup.reason), then replaces the clientId placeholder above with the app's client id and pastes the client secret on the tool's page.

Covers: start and complete the admin OAuth flow for a supported tool; cancel or deny consent and verify setup can be retried; expire or revoke authorisation (revoke the app under GitHub Settings > Applications) and verify the UI requests reconnection; verify the intended credential is used (whoami returns the signer's login).
