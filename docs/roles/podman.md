# Podman role

The purpose of this role is to install the podman client from the podman community project.
This role is part of the [STARTX client ansible collection](https://galaxy.ansible.com/startxfr/client).

## Requirements

- Ansible runtime
- Installation of the [startx client collection](https://galaxy.ansible.com/startxfr/client) with `ansible-galaxy collection install startxfr.client`

## Role Variables

| Key               | Default | Description               |
| ----------------- | ------- | ------------------------- |
| sc_podman_action  | create  | The action to perform     |
| sc_podman_release | latest  | podman version to install |

## Dependencies

Depend only on `ansible.builtin`

## Example playbooks

### Install podman playbook

Install podman CLI.

```yaml
- name: Install an podman client
  hosts: localhost
  roles:
    - role: startx.client.podman
```

### Install podman version 3.4.4 playbook

Install podman CLI 3.4.4 version.

```yaml
- name: Install an podman client
  hosts: localhost
  roles:
    - role: startx.client.podman
      sc_podman_release: "3.4.4"
```

### Uninstall podman playbook

Uninstall podman CLI.

```yaml
- name: Uninstall an podman client
  hosts: localhost
  roles:
    - role: startx.client.podman
      sc_podman_action: "delete"
```
