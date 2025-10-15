#!/bin/bash

sudo apt update
sudo apt install -y firefox
sudo apt update -y && sudo apt upgrade -y

sudo apt install xfce4 xfce4-goodies xrdp -y

echo "startxfce4" > ~/.xsession
sudo chown $(whoami):$(whoami) ~/.xsession

sudo systemctl enable xrdp
sudo systemctl restart xrdp
