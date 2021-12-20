# Role MOCP Manager - Repository

The purpose of this role is to install the co or kubectl client.

This include installing and removing an openshfift client.

## Requirements

Content in this role requires the Kubernetes Python client to interact with Kubernetes' APIs (required by [community.okd](https://galaxy.ansible.com/community/okd) collection).

## Role Variables

| Key                     | Default                                                   | Description                                              |
| ----------------------- | --------------------------------------------------------- | -------------------------------------------------------- |
| sc_ocp_action           | create                                                    | The action to perform                                    |
| sc_ocp_release          | 4.9.8                                                     | Openshift version to install                             |
| sc_ocp_download_baseurl | https://mirror.openshift.com/pub/openshift-v4/clients/ocp | Base url used to download client binaries                |
| sc_ocp_download_tmpdir  | /tmp/ocp                                                  | Temporary directory used to unarchive downloaded content |
| sc_ocp_bin_directory    | /usr/local/bin                                            | Directory used to store binary content                   |

## Dependencies

Depend on `geerlingguy.git` and `lvrfrc87.git_acp`, both galaxy collections.

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
