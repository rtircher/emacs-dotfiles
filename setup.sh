#!/bin/bash

git submodule update --init

ln -svf `pwd`/.emacs ~
ln -svf `pwd`/.emacs.d ~

echo "Installing Incosolata font"
open bin/Inconsolata.otf
