#!/bin/bash

git submodule update --init

rm ~/.emacs
rm -rf ~/.emacs.d

ln -svf `pwd`/.emacs ~
ln -svf `pwd`/.emacs.d ~

echo "Installing Incosolata font"
open bin/Inconsolata.otf
