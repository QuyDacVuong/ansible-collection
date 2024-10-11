# Ansible Collection - casino.server

This ansible collection contains roles and plugins for the deployment of applications to Casino and GGN (Flutter Studios) platforms in AWS

## Linting

GitHub PRs are automatically linted by yamllint and ansible-lint, and these need to pass. The rules are relatively relaxed and quite stable.

You can run these linting checks locally

```bash
# Install linters (brew install also works)
pip install yamllint ansible-lint

# Validate your yaml
yamllint .

# Install ansible dependencies
ansible-galaxy install -r requirements.yml

# Validate your ansible code
ansible-lint
```

Configuration files are in the top level of this repo, and other locations are ignored:

- .ansible-lint
- .yamllint

In the case of a false-positive you can override ansible-lint rules at a task-level:

```yaml
- name: Register certificate ARN
  ansible.builtin.set_fact:  # noqa: jinja[invalid]
    certificate_arn: "{{ output | json_query('certificates[*].certificate_arn') | first }}"
    certificate_status: "ISSUED"
  when: output | json_query('certificates[*]') | length != 0
```

## Testing

Some of the Linux roles have molecule tests for running and verifying them in docker. Some of these get run by GitHub Actions on PRs, but many only run locally because they don't pass idempotency checks.

In order to run these tests locally you need docker, python, and various python packages installed.

```bash
# install python packages
pip install molecule molecule-plugins pytest pytest-ansible pytest-xdist

# generate a non-production Artifactory user token and then export it
export ARTIFACTORY_USERNAME=your_email@flutterint.com
export ARTIFACTORY_PASSWORD=your_artifactory_token

# configure docker if using a non-standard socket path
export DOCKER_HOST=unix:///Users/kaeraali/.colima/default/docker.sock

# converge and inspect a single role
cd roles/tomcat
molecule converge
molecule login
molecule destroy

# run full tests for a role, including verification and idempotency checks
cd roles/java
molecule test

# test all roles
MOLECULE_OPTS="--parallel" pytest -vv --numprocesses auto  --molecule roles/
```
