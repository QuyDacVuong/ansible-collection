casino.hercules
=========

Installs and configures hercules

Requirements
------------

This role assumes a standard Casino tribe server

Role Variables
--------------

The variables specific to this role are:

```yaml
hercules_binaries:
  - binary: pyrdisp.exe
    url_path: artifactory/build-results/coreserver/TAG/2205C/disp/
  - binary: pyrhedssmem.exe
    url_path: artifactory/build-results/monitor/master/current_202212091713-5c4314b00d67/pyrheds/
  - binary: pyrheessmem.exe
    url_path: artifactory/build-results/monitor/master/current_202212091713-5c4314b00d67/pyrhees/
  - binary: pyrhehssmem.exe
    url_path: artifactory/build-results/monitor/master/current_202212091713-5c4314b00d67/pyrhehs/
  - binary: pyrheissmem.exe
    url_path: artifactory/build-results/monitor/master/current_202212091713-5c4314b00d67/pyrheis/
  - binary: pyrhejdgsmem.exe
    url_path: artifactory/build-results/monitor/master/current_202212091713-5c4314b00d67/pyrhejdg/
  - binary: pyrhemngmmem.exe
    url_path: artifactory/build-results/monitor/master/current_202212091713-5c4314b00d67/pyrhemngmmem/
  - binary: pyrhercpsmem.exe
    url_path: artifactory/build-results/monitor/master/current_202212091713-5c4314b00d67/pyrhercp/
  - binary: pyrstatussendersmem.exe
    url_path: artifactory/build-results/coreserver/TAG/2205C/pyrstatussender/
```


Dependencies
------------

This role does not depend on any other roles or collections

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - casino.hercules

Author Information
------------------

This role was developed by the Flutter International Casino tribe. You can contact them via Slack in #casino-aws-migration
