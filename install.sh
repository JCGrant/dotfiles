#!/bin/bash

dotfiles_path="$HOME/dotfiles"

ln -sf "$dotfiles_path/bash_profile" ~/.bash_profile
ln -sf "$dotfiles_path/bashrc" ~/.bashrc
ln -sf "$dotfiles_path/zshrc" ~/.zshrc

ln -sf "$dotfiles_path/gitconfig" ~/.gitconfig

ln -sf "$dotfiles_path/vimrc" ~/.vimrc

ln -sf "$dotfiles_path/inputrc" ~/.inputrc

ln -sf "$dotfiles_path/tmux.conf" ~/.tmux.conf

[ ! -d ~/.ssh ] && mkdir .ssh
ln -sf "$dotfiles_path/ssh/config" ~/.ssh/config

[ ! -x "$(command -v brew)" ] && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle

