casino.ggndemobackoffice
=========

Installs and configures GGN Demo Back Office

Requirements
------------

This role assumes a standard Casino tribe server, eg. /bigdisk0 is mounted as a separate persistent disk and the aws cli tools are installed

Role Variables
--------------

The variables specific to this role are:

```yaml
env: 'test'
stationname: "TST"

ggndemobackoffice_version: 1.0.11
ggndemobackoffice_tomcat_version: 8.5.78
ggndemobackoffice_api_password: 'P455w0rd'
certificate_domain: "ggndemobackoffice-{{ env }}.csr.pstars-eu-west-1-intermediate"

advertise_host: "127.0.0.1"
hercules_host: "127.0.0.145"

artifactory_username: anonymous
artifactory_password: password

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
         - casino.ggndemobackoffice


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
