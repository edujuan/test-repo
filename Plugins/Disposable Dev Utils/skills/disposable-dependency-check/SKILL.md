---
name: disposable-dependency-check
description: Disposable test skill. Looks up the latest version of an npm package and a PyPI package and reports both in one line.
allowed-tools: [npm_package_latest, pypi_package_info]
metadata:
  version: "0.1.0"
  owner: "Disposable Dev Utils"
  lifecycle: active
---
# Dependency check

1. Ask for an npm package name and a PyPI package name (defaults: lodash and six).
2. Call `npm_package_latest` and read `version`.
3. Call `pypi_package_info` and read `info.version`.
4. Reply in one line: `npm <name>@<version> | PyPI <name> <version>`.

If a package is not found (HTTP 404) say so for that registry and still report the other one.
