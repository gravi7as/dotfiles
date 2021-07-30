#!/bin/bash

# Installing all Deps and Configs

## Fish
if brew ls --versions fish > /dev/null; then
  echo "fish exists"
else
  echo "installing fish"
  brew install fish
fi

## Git
if git --version > /dev/null; then
  echo "git exists"
else 
  echo "installing git"
  brew install git
fi

## Omf (pkg manager for fish)
if [ ! -d ~/.config/omf ]; then
  curl -L https://get.oh-my.fish | fish
  sudo bash -c 'echo /usr/local/bin/fish >> /etc/shells'
  chsh -s /usr/local/bin/fish

  omf install spacefish
fi

## Tmux
if brew ls --versions tmux > /dev/null; then
  echo "tmux exists"
else
  echo "installing tmux"
  brew install tmux
fi

## NeoVim
if brew ls --versions neovim > /dev/null; then
  echo "neo vim exists"
else
  echo "installing nvim"
  brew install neovim
fi

## Alacritty
if [ ! -d /Applications/Alacritty.app ]; then
  echo "moving alacritty app to applications"
else
  echo "alacritty app exists"
fi

## Hammerspoon
if brew info --cask hammerspoon > /dev/null; then
  echo "hammerspoon exists"
else 
  brew install hammerspoon --cask
fi

## Alacritty Configs
if [ ! -d ~/.config/alacritty ]; then
  mkdir ~/.config alacritty
  cp alacritty.yml ~/.config/alacritty
fi

## Tmux Configs
if [ ! -f ~/.tmux.conf ]; then
  cp ./tmux/.tmux.conf ~/
  source ~/.tmux.conf
fi




