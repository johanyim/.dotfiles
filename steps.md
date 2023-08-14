sudo apt update
sudo apt upgrade
sudo apt install git

//git setup 
git config --global user.name "johanyim"
git config --global user.email "37012949+johanyim@users.noreply.github.com"
git config --global init.defaultBranch main
git config --global color.ui auto
git config --global pull.rebase false

//ssh key
ssh-keygen -t ed25519 -C 37012949+johanyim@users.noreply.github.com
cat ~/.ssh/id_ed25519.pub

@github.com profile
SSH and GPG keys -> New SSH Key

Highlight and copy the output, which starts with ssh-ed25519 and ends with your email address.
Now, go back to GitHub in your browser window and paste the key you copied into the key field. Keep the key type as Authentication Key and then, click Add SSH key

//.dotfiles directory 
mkdir ~/.dotfiles
