# This is a general setup file for getting my Macs ready for customisation
# It should be idempotent!

# install homebrew first - this will trigger Command Line Tools download
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Install RCM for dotfile management
brew tap thoughtbot/formulae
brew install rcm

# Install Caskroom
brew install caskroom/cask/brew-cask

# Update things
brew update
brew cleanup

#TODO: Any other OS X things to install outside of configuration and brew programme

