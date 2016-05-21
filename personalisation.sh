# idempotent script to get things to my base state...

# see also:
# http://robots.thoughtbot.com/manage-team-and-personal-dotfiles-together-with-rcm

# Personal settings:
mydf=$HOME/Projects/jensraaby/dotfiles
mydfrepo=https://github.com/jensraaby/dotfiles.git
tbdf=$HOME/Projects/thoughtbot/dotfiles

# change default shell to zsh if not currently using:
echo "Current shell is $SHELL"
if [ "/bin/zsh" !=  "$SHELL" ]; then
  echo "Changing shell to Brewed Zsh"
  chsh -s $(which zsh)
  echo "You need to run ZSH/open a new shell after this script is complete!"
else

  # clone the dotfiles
  if [ ! -d $mydf ]; then
    git clone $mydfrepo $mydf
  fi

  if [ ! -d $tbdf ]; then
    git clone git://github.com/thoughtbot/dotfiles.git $tbdf
  fi
fi

env RCRC=$mydf/rcrc rcup -v

echo "All done setting up dotfiles personalisation"
# clone a clean install of Prezto ZSH framework
#if [[ ! -d "$HOME/.zprezto" ]]; then
#  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
#fi

