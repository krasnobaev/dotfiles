# Modified Mathias’s dotfiles

## Installation aka Using Git and the deploy (bootstrap) script

Do it at your own risk (to overwrite your dotfiles with my):
```bash
git clone https://github.com/sypwex/dotfiles.git && cd dotfiles && source deploy.sh
```

## Backup aka Update GitHub repository with local changes

### Update local repository

You need to replace dotfiles in this repository by hand, but preserving relatives paths between your home and local home of this repository. Then, you can run this script to update local repository with changed dotfiles every you change local dotfiles and want to backup:

```bash
bup.sh
```

### Update remote repository

Assumes, you have [`initialised git account`](https://help.github.com/articles/set-up-git) and repo.

```bash
git add -A
git commit -m 'description of changes'
git push origin master
```

## Fork

Forked from [`mathiasbynens/dotfiles`](https://github.com/mathiasbynens/dotfiles).
Mostly functional preserved.

