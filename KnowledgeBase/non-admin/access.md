---
# THIS BLOCK (the frontmatter) governs this access.md FILE only: who may see
# and change these rules. Left empty, the file follows the folder rules below.
---
# THIS BLOCK (the body) governs the FOLDER this file sits in, and everything
# beneath it until a nearer access.md says otherwise. Verbs: read, write,
# download, owner (owner implies the rest; write implies read). An entry is a
# role from roles.yaml, a group from groups.yaml, a person as `Name <email>`,
# or `everyone` — every signed-in person, the whole organisation. `deny X`
# takes away. Keep this block pure YAML; explanations go in `#` lines.
read:
  - deny test@test.com <test@test.com>

write: []
download:
  - deny test@test.com <test@test.com>
owner:
  - deny test@test.com <test@test.com>