casino.server.concentrator
=========

Installs and configures concentrators (previously known as webdispatchers or walldispatchers)

Requirements
------------

This role assumes a standard Casino tribe server

Role Variables
--------------

The variables specific to this role are:

```yaml
concentrator_binaries:
  - binary: pyr64.exe
    url_path: releasesrawserver/coreserver/TAG/PA_PROD_2023_01_2301G/
  - binary: pyrssl64.exe
    url_path: releasesrawserver/coreserver/TAG/PA_PROD_2023_01_2301G/

certificate_domain: "concentrator-{{ env }}.csr.pstars-eu-west-1-intermediate"
```


Dependencies
------------

This role does not depend on any other roles or collections

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - casino.server.concentrator

Author Information
------------------

This role was developed by the Flutter International Casino tribe. You can contact them via Slack in #casino-aws-migration
