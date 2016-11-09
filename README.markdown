# Installation

### Homebrew
First, check if homebrew is installed yet, if not, do so now by running:

```sh
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Then clone this project to home directory. I prefer keeping it as a hidden folder since it contains dotfiles afterall

```sh
$ git clone git@github.com:hungle88/dotfiles.git .dotfiles
```
### Z shell
Symlink the zsh startup file to the home directory. This step is important since it makes sure all the following steps will work as expected (eg: programs installed via brew)

```sh
$ ln -s ~/.dotfiles/zshrc ~/.zshrc
```

**ZIM**
If [ZIM](https://github.com/Eriner/zim) is NOT installed yet, follow the instruction on Github and then symlink ZIM config file by running the command below. This will actually override the newly created `~/.zimrc` file.

```sh
$ ln -s ~/.dotfiles/zimrc ~/.zimrc
```

**Zplug**
Similarly, if [Zplug](https://github.com/zplug/zplug) is NOT installed, do it now:

```sh
# Install Zplug
$ curl -sL zplug.sh/installer | zsh
```

and install all defined plugins by running this command:

```sh
$ zplug install
```

### Vim
Still in the home directory, symlink the two `*rc` files to home directory like so:

```sh
$ ln -s ~/.dotfiles/vimrc ~/.vimrc
$ ln -s ~/.dotfiles/vimrc.bundles ~/.vimrc.bundles
```

All the plugins defined in the `vimrc.bundles` is managed via [Vim Plug](https://github.com/junegunn/vim-plug), so make sure it's installed first before running `PlugInstall` to install the any newly added plugins.

[Vim Plug installation guide](https://github.com/junegunn/vim-plug#installation)

### Tmux
If tmux is not installed, install it via homebrew now

```sh
% brew install tmux
```

Symlink the tmux configuration file to the home directory

```sh
$ ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
```

# Update
Simply running a `git pull` inside the cloned folder

```sh
$ cd ~/.dotfiles
$ git pull
```