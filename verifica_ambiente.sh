#!/bin/bash

##########################################################################
### CONSTANTES

URL_TEAMS=https://outlook.office.com/webhook/scb9ca081-5ce1-4e3c-94a9-f915f70c3477@d564d769-9ccb-4032-996e-76901a751c66/IncomingWebhook/2dd11dcefa934b1ca2087348747c1afe/45f72676-5cec-414d-9e77-4ac9306d6866

IP_SRV_SASGC="10.1.110.20"
IP_SRV_PARSER="10.1.110.1"
#CMD_HIGHLIGHT_ERROR="2>&1 | grep --color -E '*|error'"
CMD_HIGHLIGHT_ERROR="2>&1 | awk '
    BEGIN { ret=0 }
    {
        for(i=1;i<=NF;i++)
            if(\$i~/error/){
                ret=1;
                \$i=sprintf(\"\033[0;31m%s\033[0m\",\$i)
            };
        print;
    }
    END { exit ret }
'"

RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

##########################################################################
### FUNCOES

PRINT_INFO ()
{
    if [ -z $2 ]; 
        then printf "${WHITE}$1${NC}\n";
        else printf "${WHITE}$1${NC}$2\n";
    fi
}

PRINT_SUCCESS () { printf "${GREEN}SUCESSO:${NC} $1\n"; }
PRINT_ERRO ()    { printf "${RED}ERRO:${NC} $1 $2\n"; }
THROW() { PRINT_ERRO "$1"; exit 2; }

# $1 -> Mensagem da pergunta
# $2 -> Resposta padrao (default "yes")
# RETURN -> altera o valor da variável choose para "yes" ou "no" de acordo com a resposta do usuário
ASK_FOR()
{
	if [ "$2" == "no" ]; then
		PRINT_INFO "DUVIDA: " "$1 (s/N)"
		read choose
		if [ "$choose" = "s" -o "$choose" = "S" ]; then choose="yes"; else choose="no"; fi;
	else
		PRINT_INFO "DUVIDA: " "$1 (S/n)"
		read choose
		if [ "$choose" = "n" -o "$choose" = "N" ]; then choose="no"; else choose="yes"; fi;
	fi
}

ASK_AND_DIE_IF_NO()  { ASK_FOR "$1" "$2"; if [ "$choose" = "no"  ]; then exit 1; fi }
ASK_AND_DIE_IF_YES() { ASK_FOR "$1" "$2"; if [ "$choose" = "yes" ]; then exit 1; fi }

DIE_IF_ERROR() { if [ $? != 0 ]; then THROW "$1"; fi }

# $1 -> Mensagem
SEND_TEAMS_MESSAGE()
{
    PRINT_INFO "Enviado mensagem ao teams..."
    RET=`curl -s -H "Content-Type: application/json" -d "{\"text\": \"$1\"}" $URL_TEAMS`
    if [ "$RET" != '1' ]; then THROW "Não foi possível enviar a mensagem via teams. Erro: '$RET'"; fi
}

##########################################################################
### MAIN

ping -c 1 10.1.110.2 > /dev/null

echo "? = $?"


exit 0;


SEND_TEAMS_MESSAGE "Test"
PRINT_SUCCESS "Tudo ok!"