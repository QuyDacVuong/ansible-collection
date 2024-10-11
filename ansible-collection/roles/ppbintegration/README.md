casino.server.ppbintegration
=========

Role for Casino PPB Integration servers

Requirements
------------

This role assumes a standard Casino tribe server, eg. /bigdisk0 is mounted as a separate persistent disk and the aws cli tools are installed

Role Variables
--------------

The variables specific to this role are:

```yaml
stationname: TEST
ppbintegration_tomcat_version: 8.5.78
ppbbackofficegateway_version: 1.0.33

ppbintegration_pp_bgi_host: bgi.paddypower.com.nxt.ppbdev.com
ppbintegration_pp_bgi_port: "443"

ppbintegration_bf_bgi_host: bgi.betfair.com.nxt.ppbdev.com
ppbintegration_bf_bgi_port: "443"

lobby_host: 127.0.0.133
hercules_host: 127.0.0.145
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
         - casino.ppbintegration


Testing
-------

The [molecule](https://ansible.readthedocs.io/projects/molecule/) test suite for this role uses Docker

The tests require connectivity to Artifactory

You may need to set DOCKER_HOST if your docker socket is in a non-standard location (eg. ~/.colima/default/docker.sock)

Author Information
------------------

This role was developed by the Flutter International Casino tribe. You can contact them via Slack in #casino-aws-migration
