# Git

The purpose of this role is to install the git client from the git community project.
This role is part of the [STARTX client ansible collection](https://galaxy.ansible.com/startxfr/client).

## Requirements

- Ansible runtime
- Installation of the [startx client collection](https://galaxy.ansible.com/startxfr/client) with `ansible-galaxy collection install startxfr.client`

## Role Variables

| Key            | Default | Description             |
| -------------- | ------- | ----------------------- |
| sc_git_action  | create  | The action to perform   |
| sc_git_release | latest  | Helm version to install |

## Dependencies

Depend only on `ansible.builtin`

## Example playbooks

### Install openhsift Playbook

Install an 'git' client.

```yaml
- name: Install an git client
  hosts: localhost
  roles:
    - role: startx.client.git
      sc_git_action: "create"
      sc_git_release: "3.8.2"
```

### Uninstall openhsift Playbook

Uninstall an 'git' client.

```yaml
- name: Uninstall an git client
  hosts: localhost
  roles:
    - role: startx.client.git
      sc_git_action: "delete"
      sc_git_release: "3.8.2"
```
