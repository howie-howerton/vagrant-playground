#!/bin/bash
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod 755 msfinstall
./msfinstall
msfdb init
msfupdate

# Powershell Empire 2.0
git clone https://github.com/EmpireProject/Empire.git
cd Empire
./setup/install.sh
pip install pefile


# Covenant
git clone --recurse-submodules https://github.com/cobbr/Covenant
cd Covenant
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
#sudo snap install dotnet-sdk --classic
sudo add-apt-repository universe
sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install -y dotnet-sdk-2.2
dotnet build
cd Covenant
dotnet run

#Koadic