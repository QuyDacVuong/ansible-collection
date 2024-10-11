casino.common
=========

Installs and configures Common packages and dependencies

Requirements
------------

This role assumes a standard Casino tribe server, eg. /bigdisk0 is mounted as a separate persistent disk and the aws cli tools are installed

Role Variables
--------------

The variables specific to this role are:

```yaml
C_ZNS_LOBBY: "ip:127.0.46.73:2348"
C_ZNS_REEF_LOBBY: "ip:127.0.46.73:9348"
C_ZNS_OLAP: "ip:127.0.46.27:2348"
C_ZNS_OLTP: "ip:127.0.46.24:2348"
C_ZNS_OLAP_BROKER_IP: "127.0.46.227:2348"
C_TEMPLATESERVER: "ip:127.0.20.81:3348"

# Zone 0
C_ZN_ADAPTOR: "ip:127.0.46.11:2348"
C_ZN_GDK2: "ip:127.0.46.14:2348"
C_ZN_LOBBY: "ip:127.0.46.3:2348"
C_ZN_ITGATEWAY: "ip:127.0.46.72:2348"
C_ZN_RGS: "ip:127.0.46.3:3348"
C_ZN_STATS: "ip:127.0.46.7:2348"

# Poker
ICE_OS: "ip:127.0.20.30:3348"
LOGINDBM: "ip:127.0.20.212:2348"
PYRHUB: "ip:127.0.20.81:4348"
TEMPLATESERVER: "ip:127.0.20.81:3348"

sharedzone_crm: 127.0.20.3
sharedzone_olap: 127.0.46.27
sharedzone_olap_port: 2348
```

Dependencies
------------

This role does not depend on any other roles or collections

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - casino.common


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
