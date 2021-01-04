# dotfiles

Repo for my dotfiles. This will help **backup**, **restore**, **sync** and
**share** my files.

I have used the `git --bare` approach to easily manage my `dotfiles`. There
are lots of resources documenting this method, some of the ones I used as a
reference are:
- [Manage Dotfiles With a Bare Git Repo](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)
- [Dotfile management by Atlassian](https://www.atlassian.com/git/tutorials/dotfiles)
- [Git Bare Repo by DistroTube](https://www.youtube.com/watch?v=tBoLDpTWVOM&ab_channel=DistroTube)

# Usage

## Installing dotfiles to other systems

1. Create a `dotman` alias in the `.zshrc` file. Reload it, and add `dotfiles`
to a `.gitignore` file in the home directory.

```sh
echo 'alias dotman="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"' >> $HOME/.zshrc
source ~/.zshrc
echo "dotfiles" >> ~/.gitignore
```

2. Clone repo

```sh
git clone --bare git@github.com:jltwheeler/dotfiles.git $HOME/dotfiles
```

3. Checkout and and prevent untracked files

```sh 
dotman checkout
dotman config --local status.showUntrackedFiles no
```

> **NOTE**: if you already have config files with identical names, checkout will
> fail. Back up and remove files. Skip back up if you don't need them.

4. Add / update / delete dotfiles

```sh
dotman status
dotman add .vimrc
dotman commit -m "add: vimrc"
dotman push
```


# Resources
- [awesome dotfiles](https://github.com/webpro/awesome-dotfiles)
- [dwt1/dotfiles repo](https://gitlab.com/dwt1/dotfiles)

