### Exports
export PATH="$PATH:$HOME/development/flutter/bin"
export PATH="$PATH:$HOME/scripts"
export PATH="$PATH:/usr/lib/dart/bin"
export PATH="$PATH:$HOME/.pub-cache/bin"


### Carregando configuracoes de proxy
#. ~/proxy
#./scripts/USB_perm.sh  #Liberar o acesso de leitura e escrita do USB usado para serial
alias usbpermission='sudo ./scripts/USB_perm.sh'

### alias
alias aliasreload='source ~/.bashrc'
alias aliasedit='gedit ~/.bash_aliases'

### psgrep
alias psgrep='ps aux | grep -v "grep --color=auto" | grep -e %CPU -e '

### setProxy
alias setproxy='sudo ~/scripts/setProxy.py'
alias setpassword='sudo ~/scripts/setNewPasswordSascar.py'

### findfor
alias agfindfor='~/scripts/agfindfor.sh '
alias parfindfor='~/scripts/findfor.sh ' #findfor without default parameters
alias findfor='~/scripts/findfor.sh -rni '
alias bfindfor='~/scripts/findfor.sh -rani ' #including binary and insensitive
alias wfindfor='~/scripts/findfor.sh -rnwi ' #word wrap and insensitive
alias bwfindfor='~/scripts/findfor.sh -ranwi ' #binary, wordwrap, insensitive

### programs
#alias sasgc='~/src/sasgccliente/build-sasgc-Desktop_Qt_5_7_0_GCC_64bit-Debug/debug/bin/sasgc &> /dev/null & && sleep 0.5 && xdotool key e t r o p u s 2 0 1 7'
alias sasgc='~/src/sasgccliente/build-sasgc-Desktop_Qt_5_7_0_GCC_64bit-Debug/debug/bin/sasgc &> /dev/null &'
alias kms2='cd ~/src/build-KMS-Desktop_Qt_5_7_0_GCC_64bit-Debug/ && ./KMS &> /dev/null &'
alias kms1='wine /opt/SASGC_3.21.2/kms.exe &> /dev/null &'
alias ireport='~/Downloads/iReport-4.0.2/bin/ireport --jdkhome ~/Downloads/jdk1.7.0_80/ &'

### cds
alias cdsrc='cd ~/src/'
alias cdmount='cd ~/src/mount'
alias cdsasgc='cd ~/src/sasgccliente/'
alias cdsasgchom='cdsasgc && cd homologacao/'
alias cdsasgcdev='cdsasgc && cd desenvolvimento/'
alias cdserversys='cd ~/src/serversys/'
alias cdserversysdev='cdserversys && cd desenvolvimento/'
alias cdserversyshom='cdserversys && cd homologacao/'
alias cdserversysprod='cdserversys && cd producao/'
alias cdmdt='cd ~/src/android/'
alias cdkms='cd ~/src/KMS/'
#alias cdstikadinho='cd ~/src/Stikadinho/src/serversys/homologacao/'
alias cdparser='cd ~/src/parser2/'
alias cdparserdev='cdparser && cd desenvolvimento/'
alias cdparserhom='cdparser && cd homologacao/'
alias cdparserprod='cdparser && cd producao/'
alias cdintranet='cdintranettrunk'
alias cdintranettrunk='cd ~/src/intranet/trunk/'
alias cdintranetbranches='cd ~/src/intranet/branches/'
alias cdjava='cd ~/src/aplicacoes_legado_java/'
alias cdjavadev='cdjava && cd desenvolvimento/'
alias cdjavahom='cdjava && cd homologacao/'
alias cdportalservicos='cd ~/src/portalservicos/'
alias cdportalservicoshom='cdportalservicos && cd homologacao/java/trunk/'
alias cdportalservicosdev='cdportalservicos && cd desenvolvimento/'
alias cdwsportal='cdwsportalsrc'
#alias cdwsportalwww='cd /var/www/html/ws_portal/'
alias cdwsportalsrc='cd ~/src/ws-portal'
alias cdweblogicdomains='cd ~/wls12213/user_projects/domains/'
alias cddownloads='cd ~/Downloads/'
alias cdtestes='cd ~/src/testes/'
alias cdscripts='cd ~/scripts/'
alias cdbdscripts='cd ~/scripts/db/'
alias cdsasintegra='cdsasintegrahom'
alias cdsasintegradev='cd ~/src/SasIntegraV3/desenvolvimento'
alias cdsasintegrahom='cd ~/src/SasIntegraV3/homologacao'

### sshs
alias sshmanagersu='ssh -t rodrigo.felix.ext@10.1.110.20 "cd /home/rodrigo.felix.ext/src/serversys/homologacao/pacotes/managers ; sudo su"'
alias sshmocorrencisua='ssh -t rodrigo.felix.ext@10.1.110.20 "cd /home/rodrigo.felix.ext/src/serversys/homologacao/sasgc_embarcado/src/services ; sudo su"'
alias sshgerenciadordsu='ssh -t rodrigo.felix.ext@10.1.110.20 "cd /home/rodrigo.felix.ext/src/serversys/homologacao/sasgc_embarcado/src/server ; sudo su"'
alias sshprocessorssu='ssh -t rodrigo.felix.ext@10.1.110.20 "cd /home/rodrigo.felix.ext/src/serversys/homologacao/pacotes/processors ; sudo su"'
alias sshserversyssu='ssh -t rodrigo.felix.ext@10.1.110.20 "cd /home/rodrigo.felix.ext/src/serversys/homologacao ; sudo su"'
alias sshemersonsu='ssh -t rodrigo.felix.ext@10.1.110.20 "cd /home/emerson.silva.ext/bin ; sudo su"'

alias sshstikadinho='ssh -t rodrigo.felix.ext@10.1.110.20'
alias sshstikadinhosu='ssh -t rodrigo.felix.ext@10.1.110.20 "sudo su"'
alias sshstikadinhoalias='ssh -t rodrigo.felix.ext@10.1.110.20 "sudo su && . alias"'
alias sshparser='ssh -t rodrigo.felix.ext@10.1.110.1'
alias sshparsersu='ssh -t rodrigo.felix.ext@10.1.110.1 "sudo su"'
alias sshbd='ssh -t rodrigo.felix.ext@10.1.110.2'
alias sshbdsu='ssh -t rodrigo.felix.ext@10.1.110.2 "sudo su"'
alias sshactivemq='ssh -t rodrigo.felix.ext@10.1.110.21'
alias sshactivemqsu='ssh -t rodrigo.felix.ext@10.1.110.21 "sudo su"'
alias sshintranet='ssh -t rodrigo.felix.ext@172.16.2.57'
alias sshintranetsu='ssh -t rodrigo.felix.ext@172.16.2.57 "sudo su"'
alias sshportalservicos='ssh -t rodrigo.felix.ext@10.1.110.11'
alias sshportalservicossu='ssh -t rodrigo.felix.ext@10.1.110.11 "sudo su"'
alias sshjava='ssh -t rodrigo.felix.ext@10.1.110.9'
alias sshjavasu='ssh -t rodrigo.felix.ext@10.1.110.9 "sudo su"'
alias sshsasintegra='ssh -t rodrigo.felix.ext@10.1.110.8'
alias sshsasintegrasu='ssh -t rodrigo.felix.ext@10.1.110.8 "sudo su"'
alias mountstikadinho='sshfs rodrigo.felix.ext@10.1.110.20:/home/rodrigo.felix.ext ~/src/mount'
alias umountstikadinho='sudo umount ~/src/mount'

### request positions
alias requestpos='~/scripts/reqlastpos.sh 10.1.110.20 '
#alias requestposdev='~/scripts/reqlastpos.sh 10.1.110.20 '
alias requestposECM7890='requestpos 354868062763760'
alias requestpos3671SJS='requestpos 354869051140374'
alias requestpos3883SBS='requestpos 357042063643986'
alias requestposHXA7003='requestpos 354868062776051'
alias requestpos0669ENG='requestpos 357302075046739'
alias requestpos0029ENG='requestpos 355000081016033'
alias requestpos2281SFS='requestpos 355371021268715' #MTC 550


### builds
alias buildportalservicos='~/scripts/mvn_build_portalservicos.sh'
alias buildportalservicoshom='~/scripts/mvn_build_portalservicos.sh ~/src/portalservicos/homologacao'
alias buildportalservicosdev='~/scripts/mvn_build_portalservicos.sh ~/src/portalservicos/desenvolvimento/PRDSEG-2961'
alias buildmvn='~/scripts/mvn_build.sh'
alias ssdeploy='~/scripts/serversys_deploy.sh'

### weblogic
alias wldeployer='java -cp ~/wls12213/wlserver/server/lib/weblogic.jar weblogic.Deployer'
alias wlcmd='java -cp ~/wls12213/wlserver/server/lib/weblogic.jar weblogic.Deployer -verbose -noexit -timeout 300'
alias wlredeployprocessor='java -cp ~/wls12213/wlserver/server/lib/weblogic.jar weblogic.Deployer -verbose -noexit -timeout 300 -adminurl t3://10.1.110.9:13000 -username jenkins -password sascar@2364f45518 -name processor_ear-jms -source processor_ear-jms/target/processor_ear-jms-1.3-SNAPSHOT.ear -upload -targets cluster-jms-consumer -stage -redeploy'
alias wlstopprocessor='java -cp ~/wls12213/wlserver/server/lib/weblogic.jar weblogic.Deployer -verbose -noexit -timeout 300 -adminurl t3://10.1.110.9:13000 -username jenkins -password sascar@2364f45518 -name processor_ear-jms -targets cluster-jms-consumer -stop'

### others
#alias meldtemp='meld ~/temp1.c ~/temp2.c'
alias usbpermission='sudo chmod a+rw /dev/ttyUSB0' #Liberar o acesso de leitura e escrita do USB usado para serial
alias codeupdate='wget --no-check-certificate https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -O /tmp/code_latest_amd64.deb && sudo dpkg -i /tmp/code_latest_amd64.deb'
alias androidstudio='~/development/android-studio/bin/studio.sh&'
alias pp='~/scripts/deezerPlayPause.sh'
alias newdesktopshortcut='sudo ~/scripts/newDesktopShortcut.sh'
alias svnforceclean="svn st | grep '^?' | awk '{print $2}' | xargs rm -rf"
alias svnrevertall="svn st | grep '^M' | awk '{print $2}' | xargs svn revert"
alias psqlintranetvim="PSQL_CMD_VIM 10.1.110.14 postgres sascar_desenvolvimento"
alias psqlgerenciadoravim="PSQL_CMD_VIM 10.1.110.2 postgres gerenciadora"

# $1 -> ip
# $2 -> user
# $3 -> database
# $4 -> cmd
PSQL_CMD_VIM() { psql -h "$1" -U "$2" -d "$3" -c "$4" | vim - -c ":set nowrap"; }
PSQL_CMD_CODE() { psql -h "$1" -U "$2" -d "$3" -c "$4" > /tmp/table.log && code /tmp/table.log; }


