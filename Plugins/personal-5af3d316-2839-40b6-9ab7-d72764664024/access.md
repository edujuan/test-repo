---
# THIS BLOCK (the frontmatter) governs this access.md FILE only. Only the
# owner is named: a personal space is not listed for anyone else.
read:
  - deny everyone
  - juan <juan@bevel.software>
---
# THIS BLOCK (the body) governs the FOLDER — one person's private space.
# `deny everyone` keeps it closed even when the repository root grants
# `read: everyone`; only the owner is named — not even Admin reads it.
# To share it, add a person as `Name <email>` or a role under `read:`.
read:
  - deny everyone
  - juan <juan@bevel.software>

write:
  - juan <juan@bevel.software>
owner:
  - juan <juan@bevel.software>