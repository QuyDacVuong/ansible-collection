casino.datafeedgateway
=========

Installs and configures datafeedgateway

Requirements
------------

This role assumes a standard Casino tribe server

Role Variables
--------------

The variables specific to this role are:

```yaml
datafeedgateway_binaries:
  - binary: pyr64.exe
    url_path: build-results/coreserver/TAG/2205C/pyr/
  - binary: auxdataservices.exe
    url_path: build-results/casinoserver/TAG/MainDev/auxdataservices/
  - binary: libcrypto-1_1.dll
    url_path: build-results/casinoserver/master/current_202105281126-032872de68ef/auxdataservices/resources/externaldll/
  - binary: libssl-1_1.dll
    url_path: build-results/casinoserver/master/current_202105281126-032872de68ef/auxdataservices/resources/externaldll/
  - binary: lz4.dll
    url_path: build-results/casinoserver/master/current_202105281126-032872de68ef/auxdataservices/resources/externaldll/
  - binary: rdkafka.dll
    url_path: build-results/casinoserver/master/current_202105281126-032872de68ef/auxdataservices/resources/externaldll/
  - binary: zlib.dll
    url_path: build-results/casinoserver/master/current_202105281126-032872de68ef/auxdataservices/resources/externaldll/
  - binary: zstd.dll
    url_path: build-results/casinoserver/master/current_202105281126-032872de68ef/auxdataservices/resources/externaldll/

certificate_domain: "datafeedgateway-{{env}}.csr.pstars-eu-west-1-intermediate"
```


Dependencies
------------

This role does not depend on any other roles or collections

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - casino.datafeedgateway

Author Information
------------------

This role was developed by the Flutter International Casino tribe. You can contact them via Slack in #casino-aws-migration
