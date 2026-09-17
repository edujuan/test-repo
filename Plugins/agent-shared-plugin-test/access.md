---
# THIS BLOCK (the frontmatter) governs this access.md FILE only: who may
# see it and who may change it. `read: everyone` here means every signed-in
# person can see that the plugin exists and ask to join. It admits nobody.
read:
  - everyone
---
# THIS BLOCK (the body) governs the PLUGIN FOLDER — its skills, tools and
# manifest. To admit people, add them under `read:` (use it) or `write:`
# (change it): a role from roles.yaml, a group from groups.yaml, or a person
# as `Name <email>`. `everyone` under `read:` HERE opens the plugin to all
# signed-in users. Keep this block pure YAML; explanations go in `#` lines.
read:
  - juan <juan@bevel.software>
  - agent-interaction-test-group
  - test <test@test.com>
  - ali.raza <ali.raza@bevel.software>

write:
  - juan <juan@bevel.software>
owner:
  - juan <juan@bevel.software>
download:
  - test <test@test.com>