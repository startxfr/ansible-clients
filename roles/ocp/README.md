# STARTX Client - OKD

The purpose of this role is to install the oc, kubectl and/or openshift-install client from the Enterprise RedHat mirror.
This role is part of the [STARTX client ansible collection](https://galaxy.ansible.com/startxfr/client).

## Requirements

- Ansible runtime
- Installation of the [startx client collection](https://galaxy.ansible.com/startxfr/client) with `ansible-galaxy collection install startxfr.client`

## Role Variables

| Key                     | Default                                                     | Description                                              |
| ----------------------- | ----------------------------------------------------------- | -------------------------------------------------------- |
| sc_ocp_action           | create                                                      | The action to perform                                    |
| sc_ocp_binaries         | [kubectl, oc, installer ]                                   | The binaries to install?remove                           |
| sc_ocp_release          | 4.9.8                                                       | Openshift version to install                             |
| sc_ocp_download_baseurl | <https://mirror.openshift.com/pub/openshift-v4/clients/ocp> | Base url used to download client binaries                |
| sc_ocp_download_tmpdir  | /tmp/ocp                                                    | Temporary directory used to unarchive downloaded content |
| sc_ocp_bin_directory    | /usr/local/bin                                              | Directory used to store binary content                   |

## Dependencies

Depend only on `ansible.builtin`

## Example playbooks

### Install openhsift Playbook

Install an 'openshift' client.

```yaml
- name: Install an openshift client
  hosts: localhost
  roles:
    - role: startx.client.ocp
      sc_ocp_action: "create"
      sc_ocp_release: "4.9.6"
```

### Uninstall openhsift Playbook

Uninstall an 'openshift' client.

```yaml
- name: Uninstall an openshift client
  hosts: localhost
  roles:
    - role: startx.client.ocp
      sc_ocp_action: "delete"
      sc_ocp_release: "4.9.6"
```
