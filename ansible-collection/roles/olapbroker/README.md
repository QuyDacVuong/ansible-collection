Olap Broker
=========

Ansible role to install and configure OLAP Broker

Requirements
------------

 - Windows Server                                                                                                                                                                                            
 - A D: drive                                                                                                                                                                                                
 - Connectivity to Artifactory

Role Variables
--------------

- `olapbroker_binaries` to specify what binaries and versions are installed

Dependencies
------------

This role uses the `casino.server.win_deploy` role

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - casino.olapbroker

Author Information
------------------

Originally authored by @alicekaerast, ongoing maintenance and support from #casino-aws-migration
