casino.server.sbgintegration
=========

Role for Casino SBG Integration servers

Requirements
------------

This role assumes a standard Casino tribe server, eg. /bigdisk0 is mounted as a separate persistent disk and the aws cli tools are installed

Role Variables
--------------

The variables specific to this role are:

```yaml
env: development
stationname: DEV

sbgintegration_tomcat_version: 8.5.78
sbgbackofficegateway_version: 1.11.80

# Overridden at the `env_vars` level
SBGGatewayUrl: http://127.0.46.131:3100/aux
SBGPassword: password

hercules_host: 127.0.0.145
lobby_host: 127.0.0.133
advertise_host: 127.0.0.1

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
         - casino.sbgintegration


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
