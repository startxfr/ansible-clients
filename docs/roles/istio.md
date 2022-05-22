# Istio role

The purpose of this role is to install the istio client from the istio community project.
This role is part of the [STARTX client ansible collection](https://galaxy.ansible.com/startxfr/client).

## Requirements

- Ansible runtime
- Installation of the [startx client collection](https://galaxy.ansible.com/startxfr/client) with `ansible-galaxy collection install startxfr.client`

## Role Variables

| Key                       | Default                                            | Description                                              |
| ------------------------- | -------------------------------------------------- | -------------------------------------------------------- |
| sc_istio_action           | create                                             | The action to perform                                    |
| sc_istio_release          | 1.13.3                                             | Istioctl version to install                              |
| sc_istio_download_baseurl | <https://github.com/istio/istio/releases/download> | Base url used to download client binaries                |
| sc_istio_download_tmpdir  | /tmp/istio                                         | Temporary directory used to unarchive downloaded content |
| sc_istio_bin_directory    | /usr/local/bin                                     | Directory used to store binary content                   |

## Dependencies

Depend only on `ansible.builtin`

## Example playbooks

### Install istio Playbook

Install istioctl CLI.

```yaml
- name: Install an istio client
  hosts: localhost
  roles:
    - role: startx.client.istio
```

### Install istio 1.13.3 playbook

Install istioctl version 1.13.1 CLI.

```yaml
- name: Install an istio client in version 1.13.3
  hosts: localhost
  roles:
    - role: startx.client.istio
      sc_istio_release: "1.13.3"
```

### Uninstall istio playbook

Uninstall istioctl CLI.

```yaml
- name: Uninstall an istio client
  hosts: localhost
  roles:
    - role: startx.client.istio
      sc_istio_action: "delete"
```
