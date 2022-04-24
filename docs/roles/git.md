# Git role

The purpose of this role is to install the git client from the git community project.
This role is part of the [STARTX client ansible collection](https://galaxy.ansible.com/startxfr/client).

## Requirements

- Ansible runtime
- Installation of the [startx client collection](https://galaxy.ansible.com/startxfr/client) with `ansible-galaxy collection install startxfr.client`

## Role Variables

| Key            | Default | Description            |
| -------------- | ------- | ---------------------- |
| sc_git_action  | create  | The action to perform  |
| sc_git_release | latest  | Git version to install |

## Dependencies

Depend only on `ansible.builtin`

## Example playbooks

### Install git playbook

Install git CLI.

```yaml
- name: Install an git client
  hosts: localhost
  roles:
    - role: startx.client.git
```

### Install git version 2.34.1 playbook

Install git CLI 2.34.1 version.

```yaml
- name: Install an git client
  hosts: localhost
  roles:
    - role: startx.client.git
      sc_git_release: "2.34.1"
```

### Uninstall git playbook

Uninstall git CLI.

```yaml
- name: Uninstall an git client
  hosts: localhost
  roles:
    - role: startx.client.git
      sc_git_action: "delete"
```
