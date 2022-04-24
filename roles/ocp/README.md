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
| sc_ocp_binaries         | [kubectl, oc, installer ]                                   | The binaries to install/remove                           |
| sc_ocp_release          | 4.9.8                                                       | Openshift version to install                             |
| sc_ocp_download_baseurl | <https://mirror.openshift.com/pub/openshift-v4/clients/ocp> | Base url used to download client binaries                |
| sc_ocp_download_tmpdir  | /tmp/ocp                                                    | Temporary directory used to unarchive downloaded content |
| sc_ocp_bin_directory    | /usr/local/bin                                              | Directory used to store binary content                   |

## Dependencies

Depend only on `ansible.builtin`

## Example playbooks

### Install openshift Playbook

Install all openshift CLI default version (curent is 4.9.8).

```yaml
- name: Install an openshift client
  hosts: localhost
  roles:
    - role: startx.client.ocp
```

### Uninstall openhsift Playbook

Uninstall all openshift CLI default version (curent is 4.9.8).

```yaml
- name: Uninstall an openshift client
  hosts: localhost
  roles:
    - role: startx.client.ocp
      sc_ocp_action: "delete"
```


### Install openhsift installer version 4.9.6 Playbook

Install openshift installer CLI 4.9.6 version.

```yaml
- name: Install an openshift installer in version 4.9.6
  hosts: localhost
  roles:
    - role: startx.client.ocp
      sc_ocp_release: "4.9.6"
      sc_ocp_binaries: [ "installer" ]
```
