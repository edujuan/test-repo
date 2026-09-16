---
# Admins can still edit or remove this rule file (test cleanup path).
owner:
  - Admin
---
# Review-only fixture: readable, but the Admin role cannot write here directly.
read:
  - Admin
  - agent-interaction-test-role
write:
  - deny role/Admin
