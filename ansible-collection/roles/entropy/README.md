casino.entropy
=========

Installs and configures entropy

Requirements
------------

This role assumes a standard Casino tribe server, eg. /bigdisk0 is mounted as a separate persistent disk and the aws cli tools are installed

Role Variables
--------------

The variables specific to this role are:

```yaml
entropy_binaries:
  - binary: pyr64.bin
    artifactory_base_path: build-results/coreserver/TAG/2201B/pyr/
  - binary: pyrentropyurandomsmem.bin
    artifactory_base_path: build-results/rngserver/TAG/2205B/pyrentropyurandom/
```


Dependencies
------------

This role does not depend on any other roles or collections

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - casino.entropy

Author Information
------------------

This role was developed by the Flutter International Casino tribe. You can contact them via Slack in #casino-aws-migration
