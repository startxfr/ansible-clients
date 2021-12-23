# Development

[startx ansible collections](https://gitlab.com/startx1/ansible) offer many ansible roles used to deliver low and high building blocks
used to build your gitops backbone. To contribute and improve this collection content, you should read the following guidelines.

## Fork code

`startxfr` collections used gitlab infrastructure as a backend for it code management. This choice nested us with this service and
required you to have a gitlab account. You could go to [gitlab sign-in](https://gitlab.com/users/sign_in) to create or authenthicate
to a gitlab account.

After being authenticate to gitlab services, you must [create your own copy](https://gitlab.com/startx1/ansible/client/-/forks/new) of the `startxfr.client` ansible collection (choose public if undecided for the visibility mode).

## Get a working copy

After [create your own copy](https://gitlab.com/startx1/ansible/client/-/forks/new) of the `startxfr.client` ansible collection, you should
create your local copy of you own repsitoy. To get this done, you must foolow theses steps :

### create your repository

You must create a local copy of your repository by running :

#### Install with ssh keys

```bash
mkdir -p ~/gitrepo/ansible-client
git clone git@gitlab.com:<gitlab_username>/<gitlab_namespace>/<gitlab_collection>/.git ~/gitrepo/ansible-<gitlab_collection>
cd ~/gitrepo/ansible-<gitlab_collection>
```

#### Install with https

```bash
mkdir -p ~/gitrepo/ansible-client
git clone https://gitlab.com/<gitlab_username>/<gitlab_collection>/<gitlab_namespace>/<gitlab_collection>.git ~/gitrepo/ansible-<gitlab_collection>
cd ~/gitrepo/ansible-<gitlab_collection>
```

### Change code

You must edit content localted in your `~/gitrepo/ansible-<gitlab_collection>` to improve the collection content. This action
must be followed by a `cd ~/gitrepo/ansible-<gitlab_collection> && git add .` command to add this change to the next commit.

## Update code

After you code modification, you must commit theses change into your git repository with usage of the `git commit` command. You
can run the

```bash
cd ~/gitrepo/ansible-<gitlab_collection>
git add .
```

## Commit code

```bash
git commit -S -am "[<role>] My message"
```

**Message** format should match the follwing guideline :

- "Begin with a role separator (use [] to identify namespace)"
- Role must match available role in [startx roles](https://gitlab.com/startx1/ansible)
- If role located subcontent is changed, role prfix should be addapted with *role/subcontent*
- Global mesage houd look like `[<role>/<event>] My change` where *role* egal the nale of the role, and componemt the `subcontent,.action` to execute. 

## push your request in your namespace

```bash
git push origin devel
```

## pull request your changes

```bash
firefox https://gitlab.com/mallowtek/client/-/merge_requests/new?merge_request%5Bsource_project_id%5D=<source_projectid>&&merge_request%5Bsource_branch%5D=devel&merge_request%5Btarget_project_id%5D=<target_projectid>&merge_request%5Btarget_branch%5D=devel
```

## Getting involved

As soon as one of your first contribution is validated, you will be added to the [contributor list]](contributors.md).
