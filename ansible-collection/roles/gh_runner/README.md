casino.gh_runner
=========

Role to install and configure Github Runners

Requirements
------------

This role assumes a standard Casino tribe server, eg. /bigdisk0 is mounted as a separate persistent disk and the aws cli tools are installed

Role Variables
--------------

The variables specific to this role are:

```yaml
repo_name: FlutterInt/fips-fst-ansible
runner_token: abc123
labels: TEST
squad: ""
```

Dependencies
------------

This role does not depend on any other roles or collections

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - casino.gh_runner

This role supports 3 actions - Install, Uninstall and Delete

## Install runner as a service

 This workflow will perform following actions:

 - Create necessary directories, users, groups.
 - Install all dependency packages
 - Download the runner install and scripts for installation
 - Configure the runner instances based on specified number of instances.

Required variables :

 - Select the environment in which you want to configure the runner.
 - Select number of runners you want to configure on single host.
 - Input any additional labels you want to pass in for your runners.


## Uninstall running as service

 This workflow will perform following actions:

 - For each runner you have to run this action, you cannot uninstall all runners in one execution. 
 - Stops and uninstalls the systemd (linux) or Launchd (osx) service
 - Acquires a removal token
 - Uninstalls service for the specified runner

Required variables :

 - Select the environment in which you want to uninstall the runner.
 - Select which runner you want to uninstall ex (1,2,3)

### Delete an offline runner

 Deletes a registered runner that is offline:

 - Ensures the runner is offline
 - Resolves id from name ( runner name is identified by input variable)
 - Deletes the runner

Required variables :

 - Select the environment in which you want to delete the runner.
 - Select which runner you want to uninstall ex (1,2,3)

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
