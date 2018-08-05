#!/bin/bash

ln -sf ~/dot-files/bash_profile ~/.bash_profile
ln -sf ~/dot-files/bashrc ~/.bashrc
ln -sf ~/dot-files/zshrc ~/.zshrc

ln -sf ~/dot-files/gitconfig ~/.gitconfig

ln -sf ~/dot-files/vimrc ~/.vimrc

ln -sf ~/dot-files/inputrc ~/.inputrc

[ ! -d ~/.ssh ] && mkdir .ssh
ln -sf .ssh/config ~/.ssh/config
