casino.oltp
=========

Role for Casino OLTP servers

Requirements
------------

This role assumes a standard Casino tribe server, eg. D:\ is mounted as a separate persistent disk and the aws cli tools are installed

Role Variables
--------------

The variables specific to this role are:

```yaml
oltp_gameis_proxy_instances: 4

db2_client_package: "DB2_client_11.5.8.32821_ntx64"
db2_client_version: "11.5.8000.7748"

db_config:
  dbs:
    zone0:
      dbname: ROOTCMQA
      host: 127.0.0.1
      port: 50000
    zoneS:
      dbname: RZNSCMQA
      host: 127.0.0.1
      port: 50000
  parameters:
    - name: ConnectTimeout
      value: 180
    - name: IsolationLevel
      value: SQL_TXN_READ_UNCOMMITTED

oltp_binaries:
  - binary: pyr64.exe
    url_path: releasesrawserver/coreserver/TAG/PA_PROD_2023_01_2301G/
    dest_path: D:\apps\bin\c_oltp\
  - binary: pyrdbmproxy2smem.exe
    url_path: releasesrawserver/coreserver/TAG/PA_PROD_2023_01_2301G/
    dest_path: D:\apps\bin\c_oltp\
  - binary: pyretcdbmsmem.exe
    url_path: releasesrawserver/coreserver/TAG/PA_PROD_2023_01_2301G/
    dest_path: D:\apps\bin\c_oltp\
  - binary: pyrm2nproxysmem.exe
    url_path: releasesrawserver/coreserver/TAG/PA_PROD_2023_01_2301G/
    dest_path: D:\apps\bin\c_oltp\
  - binary: pyrolapsaversmem.exe
    url_path: releasesrawserver/coreserver/TAG/PA_PROD_2023_01_2301G/
    dest_path: D:\apps\bin\c_oltp\
  - binary: pyrtobrelaysmem.exe
    url_path: releasesrawserver/coreserver/TAG/PA_PROD_2023_01_2301G/
    dest_path: D:\apps\bin\c_tobrelay\
  - binary: auxdataservices.exe
    url_path: build-results/casinoserver/TAG/AUX2303/auxdataservices/
    dest_path: D:\apps\bin\c_oltp\
  - binary: auxdbd.exe
    url_path: build-results/casinoserver/TAG/AUX2303/auxdbd/
    dest_path: D:\apps\bin\c_oltp\
  - binary: auxdbm.exe
    url_path: build-results/casinoserver/TAG/AUX2303/auxdbm/
    dest_path: D:\apps\bin\c_oltp\
  - binary: auxemailserver.exe
    url_path: build-results/casinoserver/TAG/AUX2303/auxemailserver/
    dest_path: D:\apps\bin\c_oltp\
  - binary: auxintegrationdbm.exe
    url_path: build-results/casinoserver/TAG/AUX2303/auxintegrationdbm/
    dest_path: D:\apps\bin\c_oltp\
  - binary: auxjackpotdbm.exe
    url_path: build-results/casinoserver/TAG/AUX2303/auxjackpotdbm/
    dest_path: D:\apps\bin\c_oltp\
  - binary: auxproxyserver.exe
    url_path: build-results/casinoserver/TAG/AUX2303/auxproxyserver/
    dest_path: D:\apps\bin\c_oltp\
  - binary: auxtabledbm.exe
    url_path: build-results/casinoserver/TAG/AUX2303/auxtabledbm/
    dest_path: D:\apps\bin\c_oltp\
  - binary: auxiddbm.exe
    url_path: build-results/casinoserver/TAG/AUX2303/auxiddbm/
    dest_path: D:\apps\bin\c_oltp\
  - binary: auxreef.exe
    url_path: build-results/casinoserver/TAG/AUX2303/auxreef/
    dest_path: D:\apps\bin\c_reef_oltp\

loki_url: https://services.loki.distributor.casino.iss-test.starsops.com/loki/api/v1/push
```

Dependencies
------------

This role does not depend on any other roles or collections

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - casino.oltp


Testing
-------

The [molecule](https://ansible.readthedocs.io/projects/molecule/) test suite for this role uses Docker

```shell
make deps  # to install python libraries
make test  # to run tests
```

The tests require connectivity to Artifactory

You may need to set DOCKER_HOST if your docker socket is in a non-standard location (eg. ~/.colima/default/docker.sock)

Author Information
------------------

This role was developed by the Flutter International Casino tribe. You can contact them via Slack in #casino-aws-migration
