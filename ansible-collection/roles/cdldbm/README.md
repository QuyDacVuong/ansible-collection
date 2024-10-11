Casino.cdldbm
=========

Installs and configures the PYR_C_CDLDBM and PYR_C_WMTCDLDBM services

These services are handled in separate tasks files, you can target either of these by using the tags `cdldbm` or `wmtcdldbm`

See also the [runbook](https://confluence.pyrsoftware.ca/confluence/display/SRE/CDL+RB)

Requirements
------------

 - Windows Server
 - A D: drive
 - Connectivity to Artifactory

Role Variables
--------------

To specify the versions of binaries installed:

    casinoserver_bin_branch: "TAG/AUX2401"
    coreserver_bin_branch: "TAG/2401E"

You can further customise the binaries being installed by overriding the `cdldbm_binaries` or the `cdldbm_wmt_binaries` objects (see defaults/main.yml)

Dependencies
------------

This playbook uses the `casino.server.win_deploy` role

Example Playbook
----------------

    - hosts: servers
      roles:
         - casino.cdldbm

Author Information
------------------

Originally authored by @alicekaerast, ongoing maintenance and support from #casino-aws-migration
