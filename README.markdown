# Installation


### Clone
Clone this project to the `home` directory.

```sh
git clone git@github.com:hungle88/dotfiles.git ~/.dotfiles
```

### Run setup script
Run the setup.sh script to install all dependencies and configure the system:

```sh
~/.dotfiles/setup.sh
```

This script will:

- Install Homebrew dependencies via Brewfile
- Symlink dotfiles (e.g., .zshrc, .gitconfig)
- Symlink the Neovim config to `~/.config/nvim`
- Install & configure Zsh, Starship, and plugins
- Install & configure NVM
- Set macOS system preferences
- Enable fzf key bindings

### Private local config
Keep personal Git identity in `~/.gitconfig.user` so it does not need to be committed:

```gitconfig
[user]
  name = Your Name
  email = you@example.com
  signingkey = ~/.ssh/id_ed25519.pub

[commit]
  gpgsign = true
```

For npm authentication, export `NPM_TOKEN` in your shell or source it from a local secrets file before using npm publish/install flows that require auth.


# Update
Simply running a `git pull` inside the cloned folder

```sh
cd ~/.dotfiles && git pull
```


If changes affect installed packages, re-run:

```sh
brew bundle --file="$HOME/.dotfiles/Brewfile"
```
then 
```sh
~/.dotfiles/setup.sh
```
