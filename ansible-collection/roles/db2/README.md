casino.db2
=========

Installs and configures db2 tools

Requirements
------------

This role assumes a standard Casino tribe server

Role Variables
--------------

The variables specific to this role are:

```yaml
db2_dbname: "RZN1CMQA"
db2_exporter_username: "db2_exporter"
db2_exporter_group: "db2_exporter"
db2_exporter_groups: "pyrro"
```


Dependencies
------------

This role does not depend on any other roles or collections

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - casino.db2

Testing
-------

This role requires an artifactory username and password in order to converge. You can pass these in via environment variables:

```bash
ARTIFACTORY_USERNAME="myuser@flutterint.com" ARTIFACTORY_PASSWORD="super_secret_identity_token" make test  # run the full tests (clean run plus idempotency test)
ARTIFACTORY_USERNAME="myuser@flutterint.com" ARTIFACTORY_PASSWORD="super_secret_identity_token" molecule converge  # converge the playbook
```

You can generate these identity tokens from https://artifactory.pyrsoftware.ca/ui/user_profile

Author Information
------------------

This role was developed by the Flutter International Casino tribe. You can contact them via Slack in #casino-aws-migration
