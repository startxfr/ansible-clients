# Vault role

The purpose of this role is to install the vault client from the vault community project.
This role is part of the [STARTX client ansible collection](https://galaxy.ansible.com/startxfr/client).

## Requirements

- Ansible runtime
- Installation of the [startx client collection](https://galaxy.ansible.com/startxfr/client) with `ansible-galaxy collection install startxfr.client`

## Role Variables

| Key              | Default | Description              |
| ---------------- | ------- | ------------------------ |
| sc_vault_action  | create  | The action to perform    |
| sc_vault_release | latest  | vault version to install |

## Dependencies

Depend only on `ansible.builtin`

## Example playbooks

### Install vault playbook

Install vault CLI.

```yaml
- name: Install an vault client
  hosts: localhost
  roles:
    - role: startx.client.vault
```

### Install vault version 1.9.3 playbook

Install vault CLI 1.9.3 version.

```yaml
- name: Install an vault client
  hosts: localhost
  roles:
    - role: startx.client.vault
      sc_vault_release: "1.9.3"
```

### Uninstall vault playbook

Uninstall vault CLI.

```yaml
- name: Uninstall an vault client
  hosts: localhost
  roles:
    - role: startx.client.vault
      sc_vault_action: "delete"
```
