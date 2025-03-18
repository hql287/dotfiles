#!/bin/bash

echo "🚀 Setting up your Mac..."

# 1️⃣  Install Homebrew
if ! command -v brew &>/dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update && brew upgrade

# 2️⃣  Install Brewfile dependencies
if [ -f "$HOME/.dotfiles/Brewfile" ]; then
  echo "📦 Installing packages from Brewfile..."
  brew bundle --file="$HOME/.dotfiles/Brewfile"
else
  echo "❌ Brewfile not found! Skipping package installation."
fi

# 3️⃣. Symlink dotfiles
echo "🔗 Creating symlinks..."
for file in .zshrc .gitconfig .tmux.conf; do
  if [ -f "$HOME/$file" ] || [ -L "$HOME/$file" ]; then
    echo "🔄 Removing existing $file..."
    rm -f "$HOME/$file"
  fi
done

ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf

# 4️⃣  Configure Zsh
echo "🛠 Configuring Zsh & Plugins..."
# Ensure Zsh is the default shell
if [[ "$SHELL" != "$(brew --prefix)/bin/zsh" ]]; then
  echo "⚡ Changing default shell to Zsh..."
  sudo chsh -s $(brew --prefix)/bin/zsh "$USER"
fi

# Add Zsh plugins to ~/.zshrc (if not already added)
if ! grep -q 'source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh' "$HOME/.zshrc"; then
  echo "⚙️ Configuring Zsh Plugins in ~/.zshrc..."
  cat <<EOF >>"$HOME/.zshrc"

# Zsh Plugins
source \$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source \$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship Prompt
eval "\$(starship init zsh)"
EOF
  echo "✅ Zsh Plugins and Starship added to ~/.zshrc"
else
  echo "✅ Zsh Plugins and Starship already configured in ~/.zshrc"
fi

# 5️⃣  Enable fzf Key Bindings
echo "⌨️ Enabling fzf key bindings..."
yes | $(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc

# 6️⃣  Install NVM (Node Version Manager)
echo "🟢 Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# Ensure NVM directory exists
mkdir -p "$HOME/.nvm"

# Add NVM setup to ~/.zshrc
echo "⚙️ Configuring NVM in ~/.zshrc..."
if ! grep -q 'export NVM_DIR="$HOME/.nvm"' "$HOME/.zshrc"; then
  cat <<EOF >>"$HOME/.zshrc"

# NVM Configuration
export NVM_DIR="\$HOME/.nvm"
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh"
[ -s "\$NVM_DIR/bash_completion" ] && \. "\$NVM_DIR/bash_completion"
EOF
  echo "✅ NVM configuration added to ~/.zshrc"
else
  echo "✅ NVM already configured in ~/.zshrc"
fi

# 7️⃣  Install Node.js LTS via NVM
echo "🟢 Installing latest LTS version of Node.js..."
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install --lts
nvm use --lts
nvm alias default lts/*

# 8️⃣  Optimize macOS settings
echo "⚡ Optimizing macOS settings..."

# Speed up Dock animations
defaults write com.apple.dock autohide-time-modifier -float 0
killall Dock

# Show all file extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
killall Finder

# Show hidden files by default in Finder
defaults write com.apple.Finder AppleShowAllFiles YES
killall Finder

# Disable press-and-hold for key repeat (for faster key input)
defaults write -g ApplePressAndHoldEnabled -bool false

# Set fast key repeat rate
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10

# 9️⃣  Reload shell configuration
echo "🔄 Reloading ~/.zshrc..."
source "$HOME/.zshrc"

echo "✅ Setup complete!"
