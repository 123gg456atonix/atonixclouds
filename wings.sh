#!bin/bash
curl -sSL https://get.docker.com/ | CHANNEL=stable bash
sudo systemctl enable --now docker
sudo mkdir -p /etc/pterodactyl
curl -L -o /usr/local/bin/wings "https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_$([[ "$(uname -m)" == "x86_64" ]] && echo "amd64" || echo "arm64")"
sudo chmod u+x /usr/local/bin/wings
cd /etc/systemd/system/
wget 
sudo systemctl enable --now wings
cd /root/
echo -e "Wings Installed pls configure file in '/etc/pterodactyl/config.yml'"
