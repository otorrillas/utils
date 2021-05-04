# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# iterm2
brew install --cask iterm2

# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## plugins
brew install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Fira code: https://github.com/tonsky/FiraCode/wiki/Installing
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

# thefuck: https://github.com/nvbn/thefuck
brew install thefuck

# apply configs to $HOME
CURRENT_DIR=$(dirname "$0")

/bin/cp $CURRENT_DIR/.zshenv $HOME/.zshenv
/bin/cp $CURRENT_DIR/.zshrc $HOME/.zshrc
/bin/cp $CURRENT_DIR/.npmrc $HOME/.npmrc
/bin/cp $CURRENT_DIR/.npmrc $HOME/.gitconfig