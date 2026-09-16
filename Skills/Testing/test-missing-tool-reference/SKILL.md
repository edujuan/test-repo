---
name: test-missing-tool-reference
description: Test skill. References a tool that does not exist, to see how the platform reports it.
allowed-tools: [tool_that_does_not_exist]
metadata:
  version: "0.1.0"
  owner: "Testing"
  lifecycle: active
---
# Missing tool reference fixture

This skill lists `tool_that_does_not_exist` in `allowed-tools`. The platform should flag it or ignore it cleanly, not crash the skill catalog.
