#!/bin/bash
if [ -f ~/.vimrc ]; then
    echo "VimRC file already exists!"
    echo "Not overwriting"
else
    ln -s $(pwd)/_vimrc ~/.vimrc
fi

if [ -d ~/.vim ]; then
    echo "Vim directory already exists!"
    echo "Not overwriting"
else
    ln -s $(pwd)/vimfiles ~/.vim
fi

if [ ! -d ~/.vimswpdir ]; then
    mkdir ~/.vimswpdir
fi

if [ ! -d ~/.vimundodir ]; then
    mkdir ~/.vimundodir
fi

if [ ! -d ~/.vimbackupdir ]; then
    mkdir ~/.vimbackupdir
fi
    
