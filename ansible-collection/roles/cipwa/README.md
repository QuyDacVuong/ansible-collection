casino.cipwa
=========

Installs and configures CIPWA, along with Apache Tomcat and an NGINX reverse proxy

Requirements
------------

This role assumes a standard Casino tribe server, eg. /bigdisk0 is mounted as a separate persistent disk and the aws cli tools are installed

Role Variables
--------------

The variables specific to this role are:

```yaml
cipwa_version: 1.12.143
cipwa_allowed_origins:
  - "https://cdn.{{ public_domain }}"
  - "https://origin.{{ public_domain }}"

cipwa_tomcat_version: 8.5.43
certificate_domain: "cipwa-{{ env }}.csr.pstars-{{ region }}-intermediate"
```

You will also need to set some common variables that we reuse across roles:

```yaml
public_domain: example.com
env: development
stationname: "DEV"
artifactory_username: youruser
artifactory_password: yourpassword
```

And to be functional we also need to know about some other hosts:

```yaml
concentrator_hosts: "{{ groups['role_ggn_concentrator'] | map('extract', hostvars, ['private_ip_address']) | list | sort }}"
lobby_host: {{ hostvars[groups.role_ggn_lobby.0]['private_ip_address'] }}
hercules_host: {{ hostvars[groups.role_ggn_hercules.0]['private_ip_address'] }}
advertise_host: {{ hostvars[inventory_hostname]['private_ip_address'] }}
```


Dependencies
------------

This role does not depend on any other roles or collections

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - casino.cipwa


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
