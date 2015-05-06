#!/usr/bin/env zsh

# see https://github.com/caius/zshrc
taps=(
  caskroom/fonts
  caskroom/cask
)

packages=(
  ag
  ansible
  cmake
  ctags
  exiftool
  gist
  git-extras
  go
  "graphviz --with-app --with-bindings --universal"
  htop-osx
  "imagemagick --with-fftw --with-wepb --with-jp2 --with-pango"
  leiningen
  "macvim --override-system-vim"
  mercurial
  mobile-shell
  netcat
  r
  rbenv
  readline
  ruby-build
  ssh-copy-id
  tmux
  tree
  unrar
  valgrind
  watch
  wget
  youtube-dl
  zsh-completions

  brew-cask
)

cask_packages=(
  qlmarkdown
  qlprettypatch
  quicklook-csv
  quicklook-json

  flux
  hazel
  handbrake
  handbrakecli
  iterm2
  launchrocket
  vagrant
  virtualbox

  font-inconsolata
  font-source-code-pro
  font-inconsolata-for-powerline
  font-meslo-lg-for-powerline
)

function log() {
  echo $* > /dev/stderr
}

log "brew update"
brew update

log "brew upgrade"
brew upgrade

log "Tapping.."
for name in $taps
do
  log "brew tap ${name}"
  brew tap $name
done

log "Installing"
for name_and_args in $packages
do
  log "brew install ${=name_and_args}"
  brew install "${=name_and_args}"
done

for name_and_args in $cask_packages
do
  log "brew cask install ${=name_and_args}"
  brew cask install "${=name_and_args}"
done

log "brew cleanup"
brew cleanup

log "brew linkapps"
brew linkapps
