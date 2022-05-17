# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jwheeler/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

### ALIASES ###
alias ..='cd ../'
alias ...='cd ../../'
alias c='clear && clear'

alias vim='nvim'
alias vi='nvim'
alias vimrc='vim ~/.config/nvim/init.lua'
alias zshrc='vim ~/.zshrc'
alias tmuxrc='vim ~/.tmux.conf'
alias nvmrc='node -v > .nvmrc'
alias jws='aws --profile jltw-dev'
alias resrc='source ~/.zshrc'
alias aptsync='sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y'
alias vs='tmux split-window -h -p 30'
alias hs='tmux split-window -v -p 30'
alias lg='lazygit'
alias jserve='cd ~/json-server && json-server --watch data.json --port 9000'
alias myalias="grep '^alias' ~/.zshrc"
alias start="npm run start:dev"

# utility
alias my-ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias reactcat='adb logcat *:S ReactNative:V ReactNativeJS:V'
alias utime='date +%s'
alias oports='sudo lsof -i -P -n | grep LISTEN'
alias dup='docker-compose up'
alias dupd='docker-compose up -d'
alias ni='npm i'
alias nid='npm i -D'
alias tf='terraform'
alias ide='source ~/scripts/ide.sh'
alias cam='source ~/scripts/cam.sh'

# git stuff
alias branch-clean='git branch --merged | egrep -v "(^\*|master|main)" | xargs git branch -d'
alias dunzo='gcm && ggl && gfa && branch-clean'
alias gsort='git for-each-ref --sort=-committerdate refs/heads/ --format="%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))"'
alias ggraph='git log --graph --oneline --decorate'

# BM
alias make-me='npm run db:userdata:generate -- --uuid 0605549a-98cd-4c63-9ee3-9d36ba4f6db9'
alias make-user='npm run db:userdata:generate'
alias eclean='npm run db:userdata:generate -- --clean'
alias etclean='NODE_ENV=test npm run db:userdata:generate -- --clean'
alias start-ios='./node_modules/.bin/react-native run-ios --simulator="iPhone X"'
alias opsec2='aws-vault exec bymiles-ops-snake -- ./bin/run ec2:securitygrouprule:set -s gocd -e'


# Android
export ANDROID_HOME=${HOME}/Library/Android/sdk
export ANDROID_SDK_ROOT=${HOME}/Library/Android/sdk
export ANDROID_SDK=$HOME/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_SDK}/emulator
export PATH=${PATH}:${ANDROID_SDK}/emulator/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Alias for dotfile commands with bare git repo
alias dotman="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias dm='dotman'

# For nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# For rbenv
eval "$(rbenv init -)"

# For z
. $(brew --prefix)/etc/profile.d/z.sh

# For fzf
# export FZF_DEFAULT_COMMAND='find .* -type f'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.poetry/bin:$PATH"

# Allow fzf to also search hidden dot files
# export FZF_DEFAULT_COMMAND='find .* -type f'

# # For asdf
# . $(brew --prefix asdf)/asdf.sh

source /Users/jwheeler/.config/broot/launcher/bash/br

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
