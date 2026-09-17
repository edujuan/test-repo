---
id: disposable_packages
type: inline
owner:
  - juan <juan@bevel.software>
tools:
  - name: npm_package_latest
    description: "Manifest of the latest published version of an npm package (version, description, dependencies, dist tarball) from registry.npmjs.org. Path-parameter URL, no credentials. Disposable test tool."
    inputs:
      type: object
      properties:
        name:
          type: string
          description: Package name, e.g. lodash (scoped packages must be URL-encoded, e.g. %40types%2Fnode)
      required: [name]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://registry.npmjs.org/{name}/latest
  - name: pypi_package_info
    description: "Project metadata and release list for a Python package from PyPI's JSON API. Responses can be large for packages with many releases; try a small one like six first. Path-parameter URL, no credentials. Disposable test tool."
    inputs:
      type: object
      properties:
        name:
          type: string
          description: Package name, e.g. six or requests
      required: [name]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://pypi.org/pypi/{name}/json
  - name: crates_io_crate
    description: "Metadata for a Rust crate (downloads, latest versions, repository) from crates.io. crates.io requires a User-Agent header, which this manual sends as a static, non-secret header. Path-parameter URL, no credentials. Disposable test tool."
    inputs:
      type: object
      properties:
        name:
          type: string
          description: Crate name, e.g. serde
        include:
          type: string
          description: Comma-separated extra sections to include; pass downloads to keep the response small, or leave empty for the crate record only
      required: [name]
    outputs:
      type: object
      properties: {}
    tool_call_template:
      call_template_type: http
      http_method: GET
      url: https://crates.io/api/v1/crates/{name}
      headers:
        User-Agent: hexis-disposable-test (juan@bevel.software)
---
Disposable test fixture, created 2026-09-17 by the agent for the tool-management test plan. Safe to edit, retire or delete.

Owner: juan <juan@bevel.software> (frontmatter).
Source: npm registry (https://registry.npmjs.org), PyPI JSON API (https://pypi.org/pypi/<name>/json), crates.io API v1 (https://crates.io/api/v1/crates/<name>). All three answered HTTP 200 on 2026-09-17. Credentials: none; crates.io only needs an identifying User-Agent, sent as a static header.
Capabilities: path-parameter URLs against three registries; a static non-secret header (to contrast with ${VAR} secret headers); a large-response case (PyPI).
Dependents: skill disposable-dependency-check uses npm_package_latest and pypi_package_info.

Covers: valid tool with a static header; agent discovery; delete warnings listing an affected skill.
