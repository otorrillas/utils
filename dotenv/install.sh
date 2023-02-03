# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## update & upgrade first
brew update
brew upgrade

## iterm2
brew install --cask iterm2

## dev tools
brew install git
brew install git-lfs
brew install --cask visual-studio-code
brew install thefuck

## browsers
brew install --cask firefox

## apps
brew install --cask spotify
brew install --cask rectangle
brew install --cask raycast

## Fira code: https://github.com/tonsky/FiraCode/wiki/Installing
brew tap homebrew/cask-fonts
brew install --cask font-fira-code


# ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## plugins
brew install zsh-syntax-highlighting
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# brew cleanup
brew cleanup

# apply configs to $HOME
CURRENT_DIR=$(dirname "$0")
/bin/cp $CURRENT_DIR/.zshenv .zshrc .npmrc .gitconfig $HOME/
