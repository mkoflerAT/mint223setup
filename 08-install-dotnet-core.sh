#!/bin/bash
# https://github.com/tmds/linux-dev-certs
# https://learn.microsoft.com/en-us/aspnet/core/security/enforcing-ssl?view=aspnetcore-9.0&tabs=visual-studio%2Clinux-sles#trust-the-aspnet-core-https-development-certificate
# https://learn.microsoft.com/en-us/aspnet/core/security/enforcing-ssl?view=aspnetcore-8.0&tabs=visual-studio%2Clinux-sles#trust-https-certificate-on-linux

sudo apt install -y dotnet-sdk-10.0
sudo apt install -y libnss3-tools
# PATH=$PATH:~/.dotnet/tools

export PATH="$PATH:$HOME/.dotnet/tools"
dotnet tool update -g linux-dev-certs
dotnet linux-dev-certs install
dotnet dev-certs https --trust

mkdir -p ~/source/blazorapp
cd ~/source/blazorapp
dotnet new blazor --auth Individual

