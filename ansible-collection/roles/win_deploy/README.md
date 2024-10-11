win_deploy
=========

Deploy Windows binaries, handling versioning and stopping/restarting services

This role downloads files to D:\software on a Windows server. It then copies them across to the running location, and if that fails it stops the provided services before retrying. Whilst this may seem a lot more complicated than a single download task, it allows services to be restarted as required

Whilst this role was created specifically for the GGN Casino AWS migration work, it should be reusable for any Windows server with minimal changes

Requirements
------------

This role uses the `ansible.windows` and `community.windows` Ansible collections from Ansible Galaxy

Role Variables
--------------

Variables are passed in via role parameters

- artifactory_baseurl, defaults to "https://artifactory.pyrsoftware.ca/artifactory/", the base path to download binaries from
- win_deploy_bins, a list of dicts describing the binaries to download (see examples below)
- win_deploy_services, a list of services to stop or restart when binaries change
- win_deploy_id, required if you are running this role multiple times in a single play, defaults to `versions` which forms the base of `D:\software\versions.txt` that describes where files are downloaded from


Dependencies
------------

This role doesn't depend on any other roles. See the examples below for how to use this role

Example Playbook
----------------

Here's a full example:

```yaml
- name: win_deploy
  import_role:
    name: casino.server.win_deploy
  vars:
    artifactory_baseurl: https://example.com/artifactory/
    win_deploy_bins:
      - binary: example.exe
        url_path: aux/release/main/
        dest_path: D:\apps\foo
    win_deploy_services:
      - PYR_C_EXAMPLE
    win_deploy_id: example
```

Typically you'd provide `win_deploy_bins` from a per-environment variables file so that you can use different version numbers in different environments (which is the whole point of this role)

Author Information
------------------

For any support please reach out to #casino-aws-migration in the first instance
