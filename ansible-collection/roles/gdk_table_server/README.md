casino.gdk_table_server
=========

Installs and configures gdk_table_server

Requirements
------------

This role assumes a standard Casino tribe server

Role Variables
--------------

The variables specific to this role are:

```yaml
gdk_table_server_binaries:
  - binary: pyr64.exe
    url_path: releasesrawserver/coreserver/TAG/PA_PROD_2023_01_2301G/
  - binary: auxictableservermulti64.exe
    url_path: releasesrawserver/casinoserver/TAG/PA_PROD_2023_02_2302A/
  - binary: auxptldstableserverproxy.exe
    url_path: releasesrawserver/casinoserver/TAG/PA_PROD_2023_02_2302A/
  - binary: auxrgstableproxy.exe
    url_path: releasesrawserver/casinoserver/TAG/PA_PROD_2023_02_2302A/
  - binary: auxtableservermulti.exe
    url_path: releasesrawserver/casinoserver/TAG/PA_PROD_2023_02_2302A/
```


Dependencies
------------

This role does not depend on any other roles or collections

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - casino.gdk_table_server

Author Information
------------------

This role was developed by the Flutter International Casino tribe. You can contact them via Slack in #casino-aws-migration
