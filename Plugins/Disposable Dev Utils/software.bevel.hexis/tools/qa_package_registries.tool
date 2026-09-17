---
id: qa_package_registries
type: inline
tools:
  - name: pypi_package_info
    description: "Metadata for a package on PyPI: latest version, summary, author, homepage and release list. No credentials."
    inputs:
      type: object
      properties:
        package:
          type: string
          description: "PyPI project name, e.g. requests"
      required: [package]
    outputs:
      type: object
      properties:
        info: { type: object }
        releases: { type: object }
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://pypi.org/pypi/{package}/json
  - name: npm_package_info
    description: "Metadata for a package on the npm registry: dist-tags (latest), description, maintainers and versions. No credentials. Scoped packages must be URL-encoded, e.g. %40types%2Fnode."
    inputs:
      type: object
      properties:
        package:
          type: string
          description: "npm package name, e.g. express"
      required: [package]
    outputs:
      type: object
      properties:
        name: { type: string }
        description: { type: string }
        dist-tags: { type: object }
        versions: { type: object }
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://registry.npmjs.org/{package}
---
QA fixture (2026-09-17): a credential-free multi-tool manual for the plugin-membership and
agent-discovery tests ("add the tool to a disposable plugin and verify it appears on the plugin
page and in the sidebar", "remove the tool from the plugin and verify membership updates
reverywhere", "confirm the agent discovers the new tool without reconnecting").

Both endpoints are the registries' own public JSON APIs and need no key.
