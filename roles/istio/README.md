# STARTX Client - Helm

The purpose of this role is to install the istio client from the istio community project.
This role is part of the [STARTX client ansible collection](https://galaxy.ansible.com/startxfr/client).

## Requirements

- Ansible runtime
- Installation of the [startx client collection](https://galaxy.ansible.com/startxfr/client) with `ansible-galaxy collection install startxfr.client`

## Role Variables

| Key                       | Default                                            | Description                                              |
| ------------------------- | -------------------------------------------------- | -------------------------------------------------------- |
| sc_istio_action           | create                                             | The action to perform                                    |
| sc_istio_release          | 1.13.3                                             | Helm version to install                                  |
| sc_istio_download_baseurl | <https://github.com/istio/istio/releases/download> | Base url used to download client binaries                |
| sc_istio_download_tmpdir  | /tmp/istio                                         | Temporary directory used to unarchive downloaded content |
| sc_istio_bin_directory    | /usr/local/bin                                     | Directory used to store binary content                   |

## Dependencies

Depend only on `ansible.builtin`

## Example playbooks

### Install openhsift Playbook

Install an 'istio' client.

```yaml
- name: Install an istio client
  hosts: localhost
  roles:
    - role: startx.client.istio
      sc_istio_action: "create"
      sc_istio_release: "1.13.3"
```

### Uninstall openhsift Playbook

Uninstall an 'istio' client.

```yaml
- name: Uninstall an istio client
  hosts: localhost
  roles:
    - role: startx.client.istio
      sc_istio_action: "delete"
      sc_istio_release: "1.13.3"
```
