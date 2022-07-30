## Prepare install terminator
sudo add-apt-repository ppa:gnome-terminator

## Prepare install spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt update -y
sudo apt upgrade -y
sudo apt install git zsh powerline fonts-powerline terminator curl -y

## Install spotify
sudo apt-get install spotify-client -y


## Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Install new plugins of ZSH

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1

ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

sed 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc

sed 's/^ZSH_THEME=.*/ZSH_THEME="spaceship"/g' ~/.zshrc

## Installing chrome 

curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb --output ~/Downloads/chrome.deb

sudo dpkg -i ~/Downloads/chrome.deb -y

sudo rm ~/Downloads/chrome.deb

## Installing docker

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

sudo usermod -aG docker $USER

newgrp docker

reboot

