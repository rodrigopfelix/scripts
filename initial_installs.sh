sudo ~/scripts/setProxy.py # script to set proxy configuration

sudo apt update
sudo apt -y upgrade

###################################################################################
### Adding 1 GB to swap memory
sudo fallocate -l 1G /swap.img
sudo chmod 600 /swap.img
sudo mkswap /swap.img 
sudo swapon /swap.img
echo '/swap.img none swap sw 0 0' | sudo tee -a /etc/fstab

###################################################################################
### general dev utilities
sudo apt -y install net-tools
sudo apt -y install nmap
sudo apt -y install htop
sudo apt -y install silversearcher-ag
sudo apt -y install software-properties-common apt-transport-https wget -f
sudo apt -y install ssh
sudo apt -y install sshfs
sudo apt -y install sshpass
sudo apt -y install vim
sudo apt -y install curl
sudo apt -y install meld
sudo apt -y install gnome-tweaks
sudo apt -y install ncat
#sudo apt -y install gnome-shell-extension-system-monitor
#sudo apt -y install python
sudo apt -y install xdotool
sudo apt -y install terminator
sudo apt -y install wine-stable
sudo apt -y install libcanberra-gtk-module
sudo apt -y install gparted

### Skype
echo "deb [arch=amd64] https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skype-stable.list
wget https://repo.skype.com/data/SKYPE-GPG-KEY
sudo apt-key add SKYPE-GPG-KEY
sudo apt install apt-transport-https
rm -f SKYPE-GPG-KEY
sudo apt update
sudo apt -y install skypeforlinux

### git
sudo apt -y install git
sudo apt -y install git-gui
sudo apt -y install aspell-pt-br 
git config --global user.email "rodrigopfelix@hotmail.com"
git config --global user.name "Rodrigo Félix"

### Dart
sudo apt update
sudo apt -y install apt-transport-https
sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
sudo apt update
sudo apt -y install dart
pub global activate slidy #slidy

###################################################################################
### VSCode
sudo wget --no-check-certificate https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -O /tmp/code_latest_amd64.deb && sudo dpkg -i /tmp/code_latest_amd64.deb

#configs do vscode
printf '{
    "editor.rulers": [80,120],
    "editor.suggestSelection": "first",
    "files.exclude": {
            "**/.classpath": true,
            "**/.project": true,
            "**/.settings": true,
            "**/.factorypath": true,
            "**/*.g.dart": true
    },
    "dart.previewFlutterUiGuides": true,
    "todo-tree.general.statusBar": "tags",
    "todo-tree.tree.showTagsFromOpenFilesOnly": true
}' > ~/.config/Code/User/settings.json

printf '// Place your key bindings in this file to override the defaults
[
    {
        "key": "alt+left",
        "command": "workbench.action.navigateBack"
    },
    {
        "key": "alt+right",
        "command": "workbench.action.navigateForward"
    },
    {
        "key": "ctrl+shift+-",
        "command": "-workbench.action.navigateForward"
    },
    {
        "key": "ctrl+shift+down",
        "command": "editor.action.copyLinesDownAction",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "ctrl+shift+alt+down",
        "command": "-editor.action.copyLinesDownAction",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "ctrl+shift+up",
        "command": "editor.action.copyLinesUpAction",
        "when": "editorTextFocus && !editorReadonly"
    },
    {
        "key": "ctrl+shift+alt+up",
        "command": "-editor.action.copyLinesUpAction",
        "when": "editorTextFocus && !editorReadonly"
    }
]' > ~/.config/Code/User/keybindings.json

#Extensões
code --install-extension vscjava.vscode-java-pack
code --install-extension alefragnani.Bookmarks
code --install-extension ms-vscode.cpptools
code --install-extension bmewburn.vscode-intelephense-client
code --install-extension dart-code.flutter
code --install-extension coenraads.bracket-pair-colorizer-2
code --install-extension jeroen-meijer.pubspec-assist
code --install-extension pkief.material-icon-theme
code --install-extension aaron-bond.better-comments
code --install-extension gruntfuggly.todo-tree
#code --install-extension wayou.vscode-todo-highlight
code --install-extension naumovs.color-highlight
code --install-extension kisstkondoros.vscode-gutter-preview
#flutter config --android-sdk ~/development/Android/Sdk/
#spring boot
code --install-extension vscjava.vscode-spring-initializr
code --install-extension vscjava.vscode-spring-boot-dashboard
code --install-extension Pivotal.vscode-spring-boot

###################################################################################
### Deezer - https://nuvola.tiliado.eu/nuvola/ubuntu/bionic/
sudo apt-get install flatpak xdg-desktop-portal-gtk gnome-software-plugin-flatpak
# Reiniciar o pc
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo, flatpak remote-add --if-not-exists nuvola https://dl.tiliado.eu/flatpak/nuvola.flatpakrepo
flatpak update.
flatpak install nuvola eu.tiliado.Nuvola

###################################################################################
### JDK- https://www.vultr.com/docs/how-to-manually-install-java-8-on-ubuntu-16-04

###################################################################################
### Sascar dev utilities
sudo apt -y install subversion
sudo apt -y install rabbitvcs-cli
sudo apt -y install maven
git config --global user.email "rodrigo.felix.ext@sascar.com.br"
git config --global user.name "Rodrigo Félix"

### QT 5.7
sudo apt -y install build-essential 
sudo apt -y install cmake
sudo apt -y install mesa-common-dev
sudo apt -y install libgl1-mesa-dev
sudo apt -y install libz-dev
sudo wget --no-check-certificate http://linorg.usp.br/Qt/archive/qt/5.7/5.7.0/qt-opensource-linux-x64-5.7.0.run -O /tmp/qt-opensource-linux-x64-5.7.0.run
chmod a+x /tmp/qt-opensource-linux-x64-5.7.0.run
/tmp/qt-opensource-linux-x64-5.7.0.run

### Virtualbox
sudo apt -y install virtualbox


### Shortcuts
newdesktopshortcut sasgc $HOME/src/sasgccliente/homologacao/src/resources/imagens/sasgc.ico $HOME/src/sasgccliente/build-sasgc-Desktop_Qt_5_7_0_GCC_64bit-Debug/debug/bin/sasgc SasGC

newdesktopshortcut ireport $HOME/Downloads/iReport-4.0.2/bin/document.ico "sh $HOME/Downloads/iReport-4.0.2/bin/ireport --jdkhome $HOME/Downloads/jdk1.7.0_80/" iReport

newdesktopshortcut qtlinguist QtProject-qtcreator /opt/Qt5.7.0/5.7/gcc_64/bin/linguist "Linguist (Qt)"

#printf "[Desktop Entry]\nVersion=1.0\nType=Application\nTerminal=false
#Icon=$HOME/Downloads/iReport-4.0.2/bin/document.ico
#Exec=sh $HOME/Downloads/iReport-4.0.2/bin/ireport --jdkhome $HOME/Downloads/jdk1.7.0_80/\nName=iReport" > /tmp/ireport_TST.desktop # shortcut to ireport
#sudo mv /tmp/ireport_TST.desktop /usr/share/applications/

###################################################################################
### Configs to gedit
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor highlight-current-line true
gsettings set org.gnome.gedit.preferences.editor auto-save true
gsettings set org.gnome.gedit.preferences.editor auto-save-interval 1
gsettings set org.gnome.gedit.preferences.editor scheme oblivion
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
#https://github.com/hannenz/duplicate
mkdir ~/.local/share/gedit/plugins/
wget --no-check-certificate https://raw.githubusercontent.com/hannenz/duplicate/master/duplicateline.py -O ~/.local/share/gedit/plugins/duplicateline.py
wget --no-check-certificate https://raw.githubusercontent.com/hannenz/duplicate/master/duplicateline.plugin -O ~/.local/share/gedit/plugins/duplicateline.plugin
#gsettings set org.gnome.gedit.plugins active-plugins "['duplicateline', 'filebrowser', 'modelines', 'spell', 'time', 'docinfo']"

### Configs ubuntu
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.settings-daemon.plugins.media-keys home '<Super>e'

### COnfigs do meld
gsettings set org.gnome.meld highlight-syntax true
gsettings set org.gnome.meld highlight-current-line true
gsettings set org.gnome.meld insert-spaces-instead-of-tabs true
gsettings set org.gnome.meld indent-width 4
gsettings set org.gnome.meld show-line-numbers true
gsettings set org.gnome.meld wrap-mode 'word'
gsettings set org.gnome.meld detect-encodings "['UTF-8', 'WINDOWS-1252', 'ISO-8859-15', 'UTF-16', 'ISO-8859-1']"

###################################################################################
### SSH configs
ssh-keygen
echo "Insira o usuario AD: "
read USUARIOAD
echo "Insira a senha AD: "
read SENHAAD
sshpass -p $SENHAAD ssh-copy-id -oStrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub $USUARIOAD@10.1.110.1
sshpass -p $SENHAAD ssh-copy-id -oStrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub $USUARIOAD@10.1.110.2
sshpass -p $SENHAAD ssh-copy-id -oStrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub $USUARIOAD@10.1.110.8
sshpass -p $SENHAAD ssh-copy-id -oStrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub $USUARIOAD@10.1.110.9
sshpass -p $SENHAAD ssh-copy-id -oStrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub $USUARIOAD@10.1.110.11
sshpass -p $SENHAAD ssh-copy-id -oStrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub $USUARIOAD@10.1.110.20
sshpass -p $SENHAAD ssh-copy-id -oStrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub $USUARIOAD@10.1.110.21
sshpass -p $SENHAAD ssh-copy-id -oStrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub $USUARIOAD@172.16.2.57

printf "host 10.1.110.1 10.1.110.2 10.1.110.8 10.1.110.9 10.1.110.11 10.1.110.20 10.1.110.21 172.16.2.57\nuser $USUARIOAD" > ~/.ssh/config


