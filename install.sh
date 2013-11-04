#!/bin/bash

rm -rf $HOME/.vim $HOME/.vimrc

git clone -q --recursive https://github.com/mfojtik/vim.git $HOME/.vim

ln -vsf $HOME/.vim/_vimrc $HOME/.vimrc
ln -vsf $HOME/.vim/bundle/vim-pathogen/autoload/pathogen.vim \
  $HOME/.vim/autoload/pathogen.vim
