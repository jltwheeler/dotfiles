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

1. Add the `dotman` alias to your `.bashrc` or `.zshrc` file
```sh
# Add this line to zshrc and source it
alias dotman='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
source ~/.zshrc
echo ".dotfiles.git" >> ~/.gitignore
```

2. Clone repo

```sh
git clone git@github.com:jltwheeler/dotfiles.git

# Pulls dotfiles into their directories. Will fail if config files already
# exist.
dotman checkout

# Prevent untracked files from showing up on dotman status
dotman config --local status.showUntrackedFiles no
```

3. Add / update / delete dotfiles

```sh
dotman status
dotman add .vimrc
dotman commit -m "add: vimrc"
dotman push
```


# Resources
- [awesome dotfiles](https://github.com/webpro/awesome-dotfiles)
- [dwt1/dotfiles repo](https://gitlab.com/dwt1/dotfiles)

