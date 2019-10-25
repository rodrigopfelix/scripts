#!/bin/bash

##########################################################################
### CONSTANTES

SVN_TAG_RAIZ="Raiz do Repositório"
SVN_TAG_RELATIVE_URL="Relative URL"

IP_SRV_SASGC="10.1.110.20"
IP_SRV_PARSER="10.1.110.1"
PATH_DESTINO="/home/rodrigo.felix.ext/src"
REPORT_DATA_PATH="/home/emerson.silva.ext/bin/relatorio/"
RELATORIO_JAR="relatorio.jar"
PATH_TMP="$PATH_DESTINO/tmp/"

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
THROW() { PRINT_ERRO "$1"; exit; }

DEPLOY()
{
    PRINT_INFO " > Copiando arquivos de ./$1..."
    scp $PWD/$1/$2* "$IP_SRV_SASGC:$PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/$1/"
    if [ $? != 0 ]; then THROW "Não foi possível copiar os arquivos"; fi
    PRINT_INFO " > Compilando..."
    ssh -t $IP_SRV_SASGC "cd $PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/$1/$4 && omake -j4 $3 "
    if [ $? != 0 ]; then THROW "Não foi possível compilar $PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/$1/$4 $3"; fi
}

# $1 -> Caminho relativo dentro do repositório
# $2 -> Filtro de cópia do repositório para o servidor
# $3 -> Caminho relativo dentro de $REPORT_DATA_PATH
DEPLOY_REPORT_FILES()
{
    PRINT_INFO " > Copiando arquivos de ./$1..."
    scp $PWD/$1/$2* "$IP_SRV_SASGC:$PATH_TMP"
    if [ $? != 0 ]; then THROW "Não foi possível copiar os arquivos de './$1' para o servidor"; fi
    PRINT_INFO " > Movendo arquivos de $IP_SRV_SASGC:$PATH_TMP..."
    ssh -t $IP_SRV_SASGC "sudo mv $PATH_TMP/$2* $REPORT_DATA_PATH/$3"
    if [ $? != 0 ]; then THROW "Não foi possível mover os arquivos de '$PATH_TMP' para '$REPORT_DATA_PATH'"; fi
}

BUILD_JAVA()
{
    PRINT_INFO " > Compilando ./$1..."
    mvn -T 4 -U clean install -f "$PWD/$1" #buildmvn $PWD/$1
    if [ $? != 0 ]; then THROW "Não foi compilar o projeto $PWD/$1"; fi
}

###
# $1 -> Caminho relativo dentro do repositório
# $2 -> Filtro de cópia do repositório para o servidor
DEPLOY_PARSER_COPY()
{
	scp $PWD/$1/$2 "$IP_SRV_PARSER:$PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/$1/"
    if [ $? != 0 ]; then THROW "Não foi possível copiar os arquivos"; fi
}

# $1 -> Nome do parser
DEPLOY_PARSER()
{
    PRINT_INFO " > Copiando arquivos do parser $1..."
    
	DEPLOY_PARSER_COPY "protocolos/lib" "protocolo.*"
	DEPLOY_PARSER_COPY "protocolos/$1" "*"

    PRINT_INFO " > Compilando..."
    ssh -t $IP_SRV_PARSER "cd $PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/ && sudo omake -j4 $1d "
    if [ $? != 0 ]; then THROW "Não foi possível compilar $PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/ $1d"; fi
}

DEPLOY_CACHE_CADASTRAL()
{
    PRINT_INFO " > Copiando arquivos do cache cadastral..."
    
	DEPLOY_PARSER_COPY "memoria/cache_cadastral" "*"

    PRINT_INFO " > Compilando..."
    ssh -t $IP_SRV_PARSER "cd $PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/ && sudo omake -j4"
    if [ $? != 0 ]; then THROW "Não foi possível compilar $PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/"; fi
}

##########################################################################
### MAIN

if [ -z $1 ]; then THROW 'Informe os sistemas a serem compilados (OPÇÕES: includes reportincludes libs reportlibs report i18n oracle relatoriojava jasperadicionais)'; fi


REPOSITORIO=`svn info | grep "^$SVN_TAG_RAIZ:" | egrep -o '[^/]+$'`
if [ -z $REPOSITORIO ]; then THROW 'Não foi possível ler o repositório. Você está em um diretório svn?'; fi
if [ "$REPOSITORIO" != "serversys" ] && [ "$REPOSITORIO" != "parser2" ]; then THROW 'Este não é um repositório serversys'; fi
PRINT_INFO "Repositório svn: " $REPOSITORIO


RELATIVE_URL=`svn info | grep "^$SVN_TAG_RELATIVE_URL:" | egrep -o '[^^]+$'`
PRINT_INFO "Diretório relativo: " $RELATIVE_URL
if [ `awk -F"/" '{print NF-1}' <<< "$RELATIVE_URL"` != 2 ]; then
    echo "Diretório relativo fora do padrão esperado (/ambiente/branch). Deseja continuar (s/N)?"
    read choose
    if [ "$choose" != "s" -a "$choose" != "S" ]; then exit; fi
fi


PWD=`pwd`
PRINT_INFO "Local dir: " $PWD

PRINT_INFO "Destino: " "$IP_SRV_SASGC:/$PATH_DESTINO" #TODO: tem 2 repositorios agora

for var in "$@"
do
    PRINT_INFO "======== TAG: " "$var"

	case $REPOSITORIO in

		"parser2") # Comandos de deploy para o parser
			case $var in
				lmu42XX|lmu42xx|42xx|42) DEPLOY_PARSER "lmu42XX" ;;
				mtc700|MTC700|700) DEPLOY_PARSER "mtc700" ;;
				mtc550|MTC550|550) DEPLOY_PARSER "mtc550" ;;
				cache_cadastral|cache) DEPLOY_CACHE_CADASTRAL ;;
				*) 
				    PRINT_ERRO "Desconsiderando parâmetro desconhecido '$var'"; continue ;;
			esac
			;;

		"serversys") # Comandos de deploy para o serversys
			case $var in
				includes|include) #serversys includes && #sasgc includes
				    DEPLOY "include"; DEPLOY "sasgc_embarcado/include";;
				reportincludes|reporti|reportinclude) #serversys includes report && #sasgc includes report
				    DEPLOY "include" "report"; DEPLOY "sasgc_embarcado/include" "report";;
				libs|lib)
				    DEPLOY "lib"; DEPLOY "sasgc_embarcado/lib";;
				reportlibs|reportlib|reportl)
				    DEPLOY "sasgc_embarcado/lib" "report";;
				report)
				    DEPLOY "sasgc_embarcado/src/server" "report" "report" "relatorio";;
				oracle|sqldbsasgcORACLEd)
				    DEPLOY "pacotes/database" "sqldbsasgc_ORACLE" "sqldbsasgcORACLEd";;
				i18n|properties) #i18n properties
				    DEPLOY_REPORT_FILES "sasgc_embarcado/RelatoriosAgendados/resources" "i18n_"
				    # scp $PWD/sasgc_embarcado/RelatoriosAgendados/resources/i18n_* $IP_SRV_SASGC:$PATH_DESTINO/tmp/
				    # if [ $? != 0 ]; then THROW "Não foi possível copiar os arquivos para o servidor"; fi
				    # ssh -t $IP_SRV_SASGC "sudo mv $PATH_DESTINO/tmp/i18n_* $REPORT_DATA_PATH"
				    # if [ $? != 0 ]; then THROW "Não foi possível copiar do servidor para o diretório do sasgc"; fi
				    ;;
				jasperadicionais|jadicionais)
				    DEPLOY_REPORT_FILES "sasgc_embarcado/RelatoriosSasgc/template/" "dados_adicionais" "template"
				    ;;
				relatoriojava|relatoriojar|relatorioj|java)
				    BUILD_JAVA "sasgc_embarcado/RelatoriosSasgc"    
				    # scp $PWD/sasgc_embarcado/RelatoriosSasgc/target/RelatoriosSasgc-jar-with-dependencies.jar "$IP_SRV_SASGC:$PATH_DESTINO/tmp/$RELATORIO_JAR"
				    scp $PWD/sasgc_embarcado/RelatoriosSasgc/target/relatorios-sasgc-2.0-SNAPSHOT-jar-with-dependencies.jar "$IP_SRV_SASGC:$PATH_DESTINO/tmp/$RELATORIO_JAR"
				    if [ $? != 0 ]; then THROW "Não foi possível copiar o arquivo $2"; fi
				    ssh -t $IP_SRV_SASGC "sudo mv $PATH_DESTINO/tmp/$RELATORIO_JAR $REPORT_DATA_PATH"
				    if [ $? != 0 ]; then THROW "Não foi possível copiar do servidor para o diretório do sasgc"; fi
				    ;;
				*)
				    PRINT_ERRO "Desconsiderando parâmetro desconhecido '$var'"; continue ;;
			esac

			;;
	esac
	PRINT_SUCCESS "$var finalizado"
done
