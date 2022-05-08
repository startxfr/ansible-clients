# AWS role

The purpose of this role is to install the aws client from the aws community project.
This role is part of the [STARTX client ansible collection](https://galaxy.ansible.com/startxfr/client).

## Requirements

- Ansible runtime
- Installation of the [startx client collection](https://galaxy.ansible.com/startxfr/client) with `ansible-galaxy collection install startxfr.client`

## Role Variables

| Key                     | Default                         | Description                                              |
| ----------------------- | ------------------------------- | -------------------------------------------------------- |
| sc_aws_action           | create                          | The action to perform                                    |
| sc_aws_release          | 2.0.30                          | aws version to install                                   |
| sc_aws_download_baseurl | <https://awscli.amazonaws.com/> | Base url used to download client binaries                |
| sc_aws_download_tmpdir  | /tmp/aws                        | Temporary directory used to unarchive downloaded content |
| sc_aws_bin_directory    | /usr/local/bin                  | Directory used to store binary content                   |

## Dependencies

Depend only on `ansible.builtin`

## Example playbooks

### Install aws Playbook

Install aws CLI.

```yaml
- name: Install an aws client
  hosts: localhost
  roles:
    - role: startx.client.aws
```

### Install aws 2.0.30 playbook

Install aws version 1.13.1 CLI.

```yaml
- name: Install an aws client in version 2.0.30
  hosts: localhost
  roles:
    - role: startx.client.aws
      sc_aws_release: "2.0.30"
```

### Uninstall openhsift playbook

Uninstall aws CLI.

```yaml
- name: Uninstall an aws client
  hosts: localhost
  roles:
    - role: startx.client.aws
      sc_aws_action: "delete"
```
