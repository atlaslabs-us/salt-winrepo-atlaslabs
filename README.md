# SaltStack Windows Package Repo

Atlas Labs Packages for use by SaltStack minions. After pushing changes to git, perform the following on the Salt master server:

1. Initialize Salt master: `salt-run winrepo.update_git_repos`
2. Sync repo to Windows minions: `salt -G 'os:windows' pkg.refresh_db` to update all Windows minions, or `salt 'minion_name' pkg.refresh_db`
