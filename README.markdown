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
- Install & configure Zsh, Starship, and plugins
- Install & configure NVM
- Set macOS system preferences
- Enable fzf key bindings


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
