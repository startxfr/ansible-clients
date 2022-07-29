# OCP role

The purpose of this role is to install the kutomize binary from the github releases.
This role is part of the [STARTX client ansible collection](https://galaxy.ansible.com/startxfr/client).

## Requirements

- Ansible runtime
- Installation of the [startx client collection](https://galaxy.ansible.com/startxfr/client) with `ansible-galaxy collection install startxfr.client`

## Role Variables

| Key                     | Default                                                     | Description                                              |
| ----------------------- | ----------------------------------------------------------- | -------------------------------------------------------- |
| sc_kustomize_action     | create                                                      | The action to perform                                    |
| sc_kustomize_release    | N/A                                                     | Kustomize version to install                             |
| sc_kustomize_download_tmpdir  | /tmp/ocp                                                    | Temporary directory used to unarchive downloaded content |
| sc_kustomize_bin_directory    | /usr/local/bin                                              | Directory used to store binary content                   |

## Dependencies

Depend only on `ansible.builtin`

## Example playbooks

### Install openshift playbook

Install kustomize cli latest version.

```yaml
- name: Install an openshift client
  hosts: localhost
  roles:
    - role: startx.client.kustomize
```

### Install kustomize cli version 4.5.5 playbook

Install kustomize installer CLI 4.5.5 version.

```yaml
- name: Install an openshift installer in version 4.9.6
  hosts: localhost
  roles:
    - role: startx.client.kustomize
      sc_kustomize_release: "4.5.5"
```

### Uninstall kustomize playbook

Uninstall kustomize CLI latest version.

```yaml
- name: Uninstall an openshift client
  hosts: localhost
  roles:
    - role: startx.client.kustomize
      sc_kustomize_action: "delete"
```