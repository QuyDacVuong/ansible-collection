casino.lobby
=========

Role for Casino Lobby servers

Requirements
------------

This role assumes a standard Casino tribe server, eg. D:\ is mounted as a separate persistent disk and the aws cli tools are installed

Role Variables
--------------

The variables specific to this role are:

```yaml
lobby_binaries:
  - binary: auxadmin.exe
    url_path: build-results/casinoserver/TAG/AUX2302/auxadmin/
    dest_path: D:\apps\bin\c_lobby
  - binary: auxhhserver.exe
    url_path: build-results/casinoserver/debug/AUX2302_DEBUG/auxhhserver/
    dest_path: D:\apps\bin\c_lobby
  - binary: auxids.exe
    url_path: build-results/casinoserver/debug/AUX2302_DEBUG/auxids/
    dest_path: D:\apps\bin\c_lobby
  - binary: auxintegrationserver.exe
    url_path: build-results/casinoserver/debug/AUX2302_DEBUG/auxintegrationserver/
    dest_path: D:\apps\bin\c_lobby
  - binary: auxisadaptorppb.exe
    url_path: build-results/casinoserver/debug/AUX2302_DEBUG/auxisadaptorppb/
    dest_path: D:\apps\bin\c_lobby
  - binary: auxisadaptorsbg.exe
    url_path: build-results/casinoserver/debug/AUX2302_DEBUG/auxisadaptorsbg/
    dest_path: D:\apps\bin\c_lobby
  - binary: auxisassistant.exe
    url_path: build-results/casinoserver/debug/AUX2302_DEBUG/auxisassistant/
    dest_path: D:\apps\bin\c_lobby
  - binary: auxlobby.exe
    url_path: build-results/casinoserver/debug/AUX2302_DEBUG/auxlobby/
    dest_path: D:\apps\bin\c_lobby
  - binary: auxrgsmessagerouter.exe
    url_path: build-results/casinoserver/debug/AUX2302_DEBUG/auxrgsmessagerouter/
    dest_path: D:\apps\bin\c_lobby
  - binary: auxshadowlobby.exe
    url_path: build-results/casinoserver/debug/AUX2302_DEBUG/auxshadowlobby/
    dest_path: D:\apps\bin\c_lobby
  - binary: auxtablemonitorserver.exe
    url_path: build-results/casinoserver/debug/AUX2302_DEBUG/auxtablemonitorserver/
    dest_path: D:\apps\bin\c_lobby
  - binary: auxtrigger.exe
    url_path: build-results/casinoserver/debug/AUX2302_DEBUG/auxtrigger/
    dest_path: D:\apps\bin\c_lobby
  - binary: pyrmultiproxysmem.exe
    url_path: releasesrawserver/coreserver/TAG/PA_PROD_2023_01_2301G/
    dest_path: D:\apps\bin\c_lobby
  - binary: pyrentropyroutersmem.exe
    url_path: releasesrawserver/coreserver/TAG/PA_PROD_2023_01_2301G/
    dest_path: D:\apps\bin\c_lobby
  - binary: auxreef.exe
    url_path: build-results/casinoserver/debug/AUX2302_DEBUG/auxreef/
    dest_path: D:\apps\bin\c_reef_lobby
  - binary: pyr64.exe
    url_path: releasesrawserver/coreserver/TAG/PA_PROD_2023_01_2301G/
    dest_path: D:\apps\c_lobby
  - binary: pyr64.exe
    url_path: releasesrawserver/coreserver/TAG/PA_PROD_2023_01_2301G/
    dest_path: D:\apps\c_reef_lobby
```

Dependencies
------------

This role does not depend on any other roles or collections

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - casino.lobby


Testing
-------

This is an Ansible role for Windows hosts, and therefore we have no molecule tests for it

Author Information
------------------

This role was developed by the Flutter International Casino tribe. You can contact them via Slack in #casino-aws-migration
