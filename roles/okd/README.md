# STARTX Client - OKD

The purpose of this role is to install the oc and/or kubectl client from RedHat mirror of the OKD community project.
This role is part of the [STARTX client ansible collection](https://galaxy.ansible.com/startxfr/client).

## Requirements

- Ansible runtime
- Installation of the [startx client collection](https://galaxy.ansible.com/startxfr/client) with `ansible-galaxy collection install startxfr.client`

## Role Variables

| Key                     | Default                                              | Description                                              |
| ----------------------- | ---------------------------------------------------- | -------------------------------------------------------- |
| sc_okd_action           | create                                               | The action to perform                                    |
| sc_okd_release          | 4.10.0                                               | Openshift version to install                             |
| sc_okd_release_minor    | 0.okd-2022-03-07-131213                              | Openshift minor version (unsed for install)              |
| sc_okd_download_baseurl | <https://github.com/openshift/okd/releases/download> | Base url used to download client binaries                |
| sc_okd_download_tmpdir  | /tmp/okd                                             | Temporary directory used to unarchive downloaded content |
| sc_okd_bin_directory    | /usr/local/bin                                       | Directory used to store binary content                   |

## Dependencies

Depend only on `ansible.builtin`

## Example playbooks

### Install openhsift Playbook

Install an 'openshift' client.

```yaml
- name: Install an openshift client
  hosts: localhost
  roles:
    - role: startx.client.okd
      sc_okd_action: "create"
      sc_okd_release: "4.10.0"
      sc_okd_release_minor: "0.okd-2022-03-07-131213"
```

### Uninstall openhsift Playbook

Uninstall an 'openshift' client.

```yaml
- name: Uninstall an openshift client
  hosts: localhost
  roles:
    - role: startx.client.okd
      sc_okd_action: "delete"
      sc_okd_release: "4.9.0"
      sc_okd_release_minor: "0.okd-2022-02-12-140851"
```
