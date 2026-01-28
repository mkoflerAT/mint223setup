#!/bin/bash
# https://github.com/tmds/linux-dev-certs
# https://learn.microsoft.com/en-us/aspnet/core/security/enforcing-ssl?view=aspnetcore-9.0&tabs=visual-studio%2Clinux-sles#trust-the-aspnet-core-https-development-certificate
# https://learn.microsoft.com/en-us/aspnet/core/security/enforcing-ssl?view=aspnetcore-8.0&tabs=visual-studio%2Clinux-sles#trust-https-certificate-on-linux

sudo apt install dotnet-sdk-8.0
sudo apt install libnss3-tools
dotnet tool update -g linux-dev-certs
PATH=$PATH:~/.dotnet/tools
dotnet linux-dev-certs install
dotnet dev-certs https --trust

mkdir -p ~/source/blazorapp
cd ~/source/blazorapp
dotnet new blazor --auth Individual

