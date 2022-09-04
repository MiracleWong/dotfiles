# Install Homebrew

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  # 
  git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git brew-install
  /bin/bash brew-install/install.sh
  rm -rf brew-install
  # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
  export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
  for tap in core cask{,-fonts,-drivers,-versions} command-not-found; do
      brew tap --custom-remote --force-auto-update "homebrew/${tap}" "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-${tap}.git"
  done
  brew update
  brew upgrade
fi

# brew update
# brew upgrade
echo "brew update & upgrade OK"

# Install packages
apps=(
  python@3.10
  coreutils
  tree
  wget
  curl
  mycil
  httpie
  lftp
  lrzsz
  jq
  xz
  coreutils
  autojump
  shellcheck
  htop
  axel
  cloc
  thefuck
  wtf
  fzf
  exa
  bat
  tmux
  gh
  imagemagick
  restic
)

brew install "${apps[@]}"

qlapps=(
  qlcolorcode
  qlimagesize
  qlmarkdown
  qlmobi
  qlstephen
  qlvideo
  quicklook-json
  quicklook-csv
  webpquicklook
  epubquicklook
  ipynb-quicklook
  provisionql
)

brew install --cask "${qlapps[@]}"

caskapps=(
  appcleaner
  alfred
  iterm2
  sogouinput
  google-chrome
  neovim
  visual-studio-code
  useage
  switchhosts
  # tencent-lemon
  # wechat
  # qq
  # qqmusic
  # dash
  # iina
  # flux
  # licecap
  # maczip
  # hiddenbar
  # obsidian
  # itsycal
  # hazeover
  # sourcetree
  # picgo
  # one-switch # 付费
  # mweb-pro # 付费
)

brew install --cask "${caskapps[@]}"

brew cleanup

open /Applications/Alfred*.app
