# Helm role

The purpose of this role is to install the helm client from the helm community project.
This role is part of the [STARTX client ansible collection](https://galaxy.ansible.com/startxfr/client).

## Requirements

- Ansible runtime
- Installation of the [startx client collection](https://galaxy.ansible.com/startxfr/client) with `ansible-galaxy collection install startxfr.client`

## Role Variables

| Key                      | Default               | Description                                              |
| ------------------------ | --------------------- | -------------------------------------------------------- |
| sc_helm_action           | create                | The action to perform                                    |
| sc_helm_release          | 3.8.2                 | Helm version to install                                  |
| sc_helm_download_baseurl | <https://get.helm.sh> | Base url used to download client binaries                |
| sc_helm_download_tmpdir  | /tmp/helm             | Temporary directory used to unarchive downloaded content |
| sc_helm_bin_directory    | /usr/local/bin        | Directory used to store binary content                   |

## Dependencies

Depend only on `ansible.builtin`

## Example playbooks

### Install helm playbook

Install helm CLI.

```yaml
- name: Install an helm client
  hosts: localhost
  roles:
    - role: startx.client.helm
```

### Install helm version 3.8.2 playbook

Install helm CLI 3.8.2 version.

```yaml
- name: Install an helm client in version 3.8.2
  hosts: localhost
  roles:
    - role: startx.client.helm
      sc_helm_release: "3.8.2"
```

### Uninstall helm playbook

Uninstall helm CLI.

```yaml
- name: Uninstall an helm client
  hosts: localhost
  roles:
    - role: startx.client.helm
      sc_helm_action: "delete"
```
