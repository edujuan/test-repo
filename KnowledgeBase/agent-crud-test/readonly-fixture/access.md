---
# Frontmatter governs THIS access.md file: Admins can still edit or remove it (test cleanup path).
owner:
  - Admin
---
# Test fixture for agent-crud-test permission tests (2026-09-16).
# Folder is readable by everyone but not writable by the Admin role.
read:
  - everyone
write:
  - deny role/Admin
