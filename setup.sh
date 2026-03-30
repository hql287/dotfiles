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

# 3️⃣ Symlink dotfiles
echo "🔗 Creating symlinks..."

# Define the source and target paths
dotfiles=(
  "$HOME/.dotfiles/zsh/zshrc:$HOME/.zshrc"
  "$HOME/.dotfiles/zsh/functions/:$HOME/.zsh/functions"
  "$HOME/.dotfiles/gitconfig:$HOME/.gitconfig"
  "$HOME/.dotfiles/tmux/tmux.conf:$HOME/.tmux.conf"
  "$HOME/.dotfiles/nvim:$HOME/.config/nvim"
)

link_path() {
  local source_path="$1"
  local target_path="$2"
  local backup_path=""

  mkdir -p "$(dirname "$target_path")"

  if [ -L "$target_path" ] && [ "$(readlink "$target_path")" = "$source_path" ]; then
    echo "✅ Symlink for $(basename "$target_path") already correct"
    return
  fi

  if [ -e "$target_path" ] || [ -L "$target_path" ]; then
    backup_path="${target_path}.bak.$(date +%Y%m%d%H%M%S)"
    echo "📦 Backing up existing $(basename "$target_path") to $backup_path"
    mv "$target_path" "$backup_path"
  fi

  echo "🔄 Linking $(basename "$target_path")..."
  ln -s "$source_path" "$target_path"
}

# Link custom functions
mkdir -p "$HOME/.zsh/functions"
for f in "$HOME/.dotfiles/zsh/functions/"*.zsh; do
  ln -sf "$f" "$HOME/.zsh/functions/$(basename "$f")"
done

# Loop through each file and create symlink
for entry in "${dotfiles[@]}"; do
  source_path="${entry%%:*}"
  target_path="${entry##*:}"
  link_path "$source_path" "$target_path"
done

# 4️⃣  Configure Zsh
echo "🛠 Configuring Zsh & Plugins..."
if [ "$SHELL" != "$(brew --prefix)/bin/zsh" ]; then
  echo "⚡ Changing default shell to Zsh... (You may be asked for your password)"
  sudo chsh -s $(brew --prefix)/bin/zsh "$USER"
else
  echo "✅ Zsh is already the default shell."
fi

# 5️⃣  Enable fzf Key Bindings
echo "⌨️ Enabling fzf key bindings..."
yes | $(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc

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

# 6️⃣  Install & Configure NVM
if [ ! -d "$HOME/.nvm" ]; then
  echo "🟢 Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
else
  echo "✅ NVM is already installed."
fi

# Add NVM setup to ~/.zshrc (if not already present)
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
if [ -s "$HOME/.nvm/nvm.sh" ]; then
  . "$HOME/.nvm/nvm.sh"
  nvm install --lts
  nvm use --lts
  nvm alias default lts/*
else
  echo "❌ NVM installation failed. Please check your installation."
fi

# 8️⃣  Optimize macOS settings
echo "⚡ Optimizing macOS settings..."

# Set fast key repeat rate
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10

# Show hidden files by default in Finder
defaults write com.apple.Finder AppleShowAllFiles YES
killall Finder

# 10  Reload shell configuration
echo "🔄 Reloading ~/.zshrc..."

exec zsh

echo "✅ Setup complete!"
