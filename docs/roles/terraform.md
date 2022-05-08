# Terraform role

The purpose of this role is to install the terraform client from the terraform community project.
This role is part of the [STARTX client ansible collection](https://galaxy.ansible.com/startxfr/client).

## Requirements

- Ansible runtime
- Installation of the [startx client collection](https://galaxy.ansible.com/startxfr/client) with `ansible-galaxy collection install startxfr.client`

## Role Variables

| Key                  | Default | Description                  |
| -------------------- | ------- | ---------------------------- |
| sc_terraform_action  | create  | The action to perform        |
| sc_terraform_release | latest  | Terraform version to install |

## Dependencies

Depend only on `ansible.builtin`

## Example playbooks

### Install terraform playbook

Install terraform CLI.

```yaml
- name: Install an terraform client
  hosts: localhost
  roles:
    - role: startx.client.terraform
```

### Install terraform version 1.1.8 playbook

Install terraform CLI 1.1.8 version.

```yaml
- name: Install an terraform client
  hosts: localhost
  roles:
    - role: startx.client.terraform
      sc_terraform_release: "1.1.8"
```

### Uninstall terraform playbook

Uninstall terraform CLI.

```yaml
- name: Uninstall an terraform client
  hosts: localhost
  roles:
    - role: startx.client.terraform
      sc_terraform_action: "delete"
```
