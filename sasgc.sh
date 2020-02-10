#!/bin/bash

####################################################################################
### Functions

findSasgc()
{
    xdotool search --name "Gerenciador de Cargas" windowactivate
    sleep 0.1
}

loginSasgc()
{
    key ctrl+l 1
    sleep 2
    xdotool type etropus2017
    key Return 1
}

find ()
{
    xdotool key ctrl+f
    xdotool type $1
    xdotool key Return
    key Tab 4
}

key() # Press a key $1 for $2 times
{
    i=0
    while [ $i -lt $2 ]
    do
        xdotool key $1
        sleep 0.01
        i=`expr $i + 1`
    done
}

relatorioDadosAdicionais()
{
    key Esc 1
    key Menu 1
    key Down 3
    key Right 1
    key Down 4
    key Return 1
    sleep 0.75

    key shift+Tab 3
    case $1 in
        # html|h) key Down 0 ;;
        pdf|p) key Down 1 ;;
        csv|c) key Down 2 ;;
    esac
}

relatorioPosicaoDetalhada()
{
    key Esc 3
    key Menu 1
    key Down 3
    key Right 1
    key Up 8
    key Return 1
    sleep 0.75

    key shift+Tab 3
    case $1 in
        # html|h) key Down 0 ;;
        pdf|p) key Down 1 ;;
        csv|c) key Down 2 ;;
        kml|k) key Down 3 ;;
    esac
}

# relatorioAssociacaoVeiculos()
# {
#     key Alt 1
#     xdotool type l
#     key Return 1
#     sleep 0.75
#     key Tab 4
#     xdotool type 10
# }

throw() { zenity --error --title "$TITLE" --text "$1"; exit; }
pedir() { echo `zenity --entry --title "$TITLE" --text "$1" $2`; }

####################################################################################
### Script
TITLE="Automatizador SasGC"
HELP="Digite a opção desejada:

	[L]		Login no SasGC
	[B]		Buscar veículo
	[3]		Filtrar pelo 3883SBS
	[0]		Filtrar pelo 0029ENG
	[D]		Relatório de posição detalhada
	[A]		Relatório de dados adicionais
	[V]		Relatório de associação de veículos (desativado)
	[ESC]	Sair"


zenity --help > /dev/null
if [ $? != 0 ]; then echo "Dependencia não encontrada: zenity"; exit; fi
xdotool -h > /dev/null
if [ $? != 0 ]; then throw "Dependencia não encontrada: xdotool"; fi



CHOOSE=`zenity --entry --title "$TITLE" --text "$HELP"`

case $CHOOSE in
    'L'|'l') findSasgc; loginSasgc ;;
    'B'|'b') findSasgc; find `pedir 'Informe o filtro de busca: '`;;
    '3'|'3') findSasgc; find "3883SBS" ;;
    '0'|'0') findSasgc; find "0029ENG" ;;
    # 'V'|'v') findSasgc; relatorioAssociacaoVeiculos ;;
    'D'|'d')
        fmt=`pedir 'Informe o formato desejado' 'csv html kml pdf'`;
        findSasgc; relatorioPosicaoDetalhada "$fmt";
        ;;
    'A'|'a')
        fmt=`pedir 'Informe o formato desejado' 'csv html pdf'`;
        findSasgc; relatorioDadosAdicionais "$fmt";
        ;;
    '') exit;;
    *) throw "Opção '$CHOOSE' inválida";;
esac

# zenity --info --text "$VAR"
exit

findSasgc
#relatorioDadosAdicionais pdf
relatorioPosicaoDetalhada pdf
#xdotool key Return
