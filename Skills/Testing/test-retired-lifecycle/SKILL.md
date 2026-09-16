---
name: test-retired-lifecycle
description: Test skill. Marked retired; it should be kept for its owners but never distributed to agents.
metadata:
  version: "1.0.0"
  owner: "Testing"
  lifecycle: retired
---
# Retired lifecycle fixture

If an agent can ever load this skill through `get_skill` or `list_skills`, retirement is not being enforced.
