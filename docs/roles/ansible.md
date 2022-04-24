# Ansible role

The purpose of this role is to install the ansible client from the ansible community project.
This role is part of the [STARTX client ansible collection](https://galaxy.ansible.com/startxfr/client).

## Requirements

- Ansible runtime
- Installation of the [startx client collection](https://galaxy.ansible.com/startxfr/client) with `ansible-galaxy collection install startxfr.client`

## Role Variables

| Key                | Default | Description                |
| ------------------ | ------- | -------------------------- |
| sc_ansible_action  | create  | The action to perform      |
| sc_ansible_release | latest  | ansible version to install |

## Dependencies

Depend only on `ansible.builtin`

## Example playbooks

### Install ansible playbook

Install ansible CLI.

```yaml
- name: Install an ansible client
  hosts: localhost
  roles:
    - role: startx.client.ansible
```

### Install ansible version 2.9.27 playbook

Install ansible CLI 2.9.27 version.

```yaml
- name: Install an ansible client
  hosts: localhost
  roles:
    - role: startx.client.ansible
      sc_ansible_release: "2.9.27"
```

### Uninstall ansible playbook

Uninstall ansible CLI.

```yaml
- name: Uninstall an ansible client
  hosts: localhost
  roles:
    - role: startx.client.ansible
      sc_ansible_action: "delete"
```
