#!/bin/bash

##########################################################################
### CONSTANTES

SVN_TAG_RAIZ="Raiz do Repositório"
SVN_TAG_RELATIVE_URL="Relative URL"

IP_SRV_SASGC="10.1.110.20"
IP_SRV_PARSER="10.1.110.1"
PATH_DESTINO="/home/rodrigo.felix.ext/src"
BIN_PATH="/home/emerson.silva.ext/bin"
REPORT_DATA_PATH="$BIN_PATH/relatorio/"
RELATORIO_JAR="relatorio.jar"
PATH_TMP="$PATH_DESTINO/tmp/"
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

# $1 -> Origem
# $2 -> Destino
SCP()
{
	PRINT_INFO " > Copiando arquivos de $1"
	PRINT_INFO "                   para $2..."
    scp $1 $2
    if [ $? != 0 ]; then THROW "Não foi possível copiar os arquivos"; fi
}

# $1 -> IP do servidor onde será executado o omake
# $2 -> Caminho onde será o executado o omake
# $3 -> Target (nome final do executável que será compilado)
SOMAKE()
{
    PRINT_INFO " > Compilando $3..."
    ssh -t $1 "cd $2 && omake -j4 $3 $CMD_HIGHLIGHT_ERROR"
    if [ $? != 0 ]; then THROW "Não foi possível compilar $2 $3"; fi
}

# $1 -> Caminho relativo dentro do repositório
# $2 -> Filtro de cópia do repositório para o servidor
# $3 -> Nome do executável a ser compilado
# $4 -> Caminho de compilação dentro do repositório (opcional)
DEPLOY()
{
	#TODO: Utilizar as funcoes SCP e SOMAKE
    PRINT_INFO " > Copiando arquivos de ./$1..."
    scp $PWD/$1/$2* "$IP_SRV_SASGC:$PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/$1/"
    if [ $? != 0 ]; then THROW "Não foi possível copiar os arquivos"; fi
    PRINT_INFO " > Compilando..."
    ssh -t $IP_SRV_SASGC "cd $PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/$1/$4 && omake -j4 $3 $CMD_HIGHLIGHT_ERROR"
    if [ $? != 0 ]; then THROW "Não foi possível compilar $PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/$1/$4 $3"; fi
}

# $1 -> Caminho relativo dentro do repositório
# $2 -> Filtro de cópia do repositório para o servidor
# $3 -> Caminho relativo dentro de $REPORT_DATA_PATH
DEPLOY_REPORT_FILES()
{
	#TODO: Utilizar as funcoes SCP e SOMAKE
    PRINT_INFO " > Copiando arquivos de ./$1..."
    scp $PWD/$1/$2* "$IP_SRV_SASGC:$PATH_TMP"
    if [ $? != 0 ]; then THROW "Não foi possível copiar os arquivos de './$1' para o servidor"; fi
    PRINT_INFO " > Movendo arquivos de $IP_SRV_SASGC:$PATH_TMP"
	PRINT_INFO "                  para $IP_SRV_SASGC:$REPORT_DATA_PATH"
    ssh -t $IP_SRV_SASGC "sudo mv $PATH_TMP/$2* $REPORT_DATA_PATH/$3"
    if [ $? != 0 ]; then THROW "Não foi possível mover os arquivos de '$PATH_TMP' para '$REPORT_DATA_PATH'"; fi
}

# $1 -> targets (gerenciador, gerenciadord ou gerenciador_relatoriod)
DEPLOY_GERENCIADORD()
{
    path_gerenciadord="sasgc_embarcado/src/server"
	SCP "$PWD/$path_gerenciadord/funcao*" "$IP_SRV_SASGC:$PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/$path_gerenciadord/"
	SCP "$PWD/$path_gerenciadord/gerenciador.c" "$IP_SRV_SASGC:$PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/$path_gerenciadord/"

	if [ "$1" == "gerenciadord" ] || [ "$1" == "gerenciador" ]; then
		SOMAKE $IP_SRV_SASGC "$PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/$path_gerenciadord/sasgc/" "gerenciadord";
	fi

	if [ "$1" == "gerenciador_relatoriod" ] || [ "$1" == "gerenciador" ]; then
		SOMAKE $IP_SRV_SASGC "$PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/$path_gerenciadord/relatorio/" "gerenciador_relatoriod";
	fi
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
	#TODO: Utilizar as funcoes SCP e SOMAKE
	scp $PWD/$1/$2 "$IP_SRV_PARSER:$PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/$1/"
    if [ $? != 0 ]; then THROW "Não foi possível copiar os arquivos"; fi
}

# $1 -> Nome do parser
DEPLOY_PARSER()
{
	#TODO: Utilizar as funcoes SCP e SOMAKE
    PRINT_INFO " > Copiando arquivos do parser $1..."
    
	DEPLOY_PARSER_COPY "protocolos/lib" "protocolo.*"
	DEPLOY_PARSER_COPY "protocolos/$1" "*"

    PRINT_INFO " > Compilando..."
    ssh -t $IP_SRV_PARSER "cd $PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/ && sudo omake -j4 $1d $CMD_HIGHLIGHT_ERROR"
    if [ $? != 0 ]; then THROW "Não foi possível compilar $PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/ $1d"; fi
}

DEPLOY_CACHE_CADASTRAL()
{
	#TODO: Utilizar as funcoes SCP e SOMAKE
    PRINT_INFO " > Copiando arquivos do cache cadastral..."
    
	DEPLOY_PARSER_COPY "memoria/cache_cadastral" "*"

    PRINT_INFO " > Compilando..."
    ssh -t $IP_SRV_PARSER "cd $PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/ && sudo omake -j4 $CMD_HIGHLIGHT_ERROR"
    if [ $? != 0 ]; then THROW "Não foi possível compilar $PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/"; fi
}

START_SERVERSYS_REPO()
{
	# TODO: refatorar
	# Verificando se a branch já existe no servidor
	if ssh -t $IP_SRV_SASGC "[ -d '$FULL_PATH' ] && [ ! -z \"\$(ls -A '$FULL_PATH')\" ]"
	then
		ASK_AND_DIE_IF_NO "Diretório '$FULL_PATH' já existe e contém arquivos. Deseja atualizar a branch?" "yes"
		PRINT_INFO " > Atualizando branch..."
		ssh -t $IP_SRV_SASGC "cd $FULL_PATH && svn up"
		if [ $? != 0 ]; then THROW "Não foi possível atualizar branch"; fi
	else
		SVN_URL=`svn info | grep "^URL:" | egrep -o '[^ ]+$'`
		PRINT_INFO "Url SVN: " $SVN_URL
		ASK_AND_DIE_IF_NO "Criar diretório '$FULL_PATH' e baixar branch?" "yes"
		PRINT_INFO " > Criando diretório e baixando branch..."
		ssh -t $IP_SRV_SASGC "mkdir -p $FULL_PATH && cd $FULL_PATH && cd .. && svn co $SVN_URL"
		if [ $? != 0 ]; then THROW "Não foi possível criar diretório e baixar branch"; fi
	fi
}

INIT_SERVERSYS_REPO()
{
	# TODO: refatorar, criando uma funçao de compile omake - TESTAR implementação abaixo para esse TODO
	# SOMAKE $IP_SRV_SASGC "$FULL_PATH/lib"
	# SOMAKE $IP_SRV_SASGC "$FULL_PATH/sasgc_embarcado/lib"
	# SOMAKE $IP_SRV_SASGC "$FULL_PATH/sasgc_embarcado/src/server/"
	# FIM TESTE DO TODO
	PRINT_INFO "\n > Compilando serversys/include..."
	ssh -t $IP_SRV_SASGC "cd $FULL_PATH/include && omake -j4 $CMD_HIGHLIGHT_ERROR"
	
	PRINT_INFO "\n > Compilando serversys/lib..."
	ssh -t $IP_SRV_SASGC "cd $FULL_PATH/lib && omake -j4 $CMD_HIGHLIGHT_ERROR"
	if [ $? != 0 ]; then THROW "Não foi possível compilar serversys/lib"; fi
	
	PRINT_INFO "\n > Compilando serversys/sasgc_embarcado/include/..."
	ssh -t $IP_SRV_SASGC "cd $FULL_PATH/sasgc_embarcado/include/ && omake -j4 $CMD_HIGHLIGHT_ERROR"
	
	PRINT_INFO "\n > Compilando serversys/sasgc_embarcado/lib..."
	ssh -t $IP_SRV_SASGC "cd $FULL_PATH/sasgc_embarcado/lib && omake -j4 $CMD_HIGHLIGHT_ERROR"
	if [ $? != 0 ]; then THROW "Não foi possível compilar serversys/sasgc_embarcado/lib"; fi

	PRINT_INFO "\n > Compilando serversys/sasgc_embarcado/src/server/..."
	ssh -t $IP_SRV_SASGC "cd $FULL_PATH/sasgc_embarcado/src/server/ && omake -j4 $CMD_HIGHLIGHT_ERROR"
	if [ $? != 0 ]; then THROW "Não foi possível compilar serversys/sasgc_embarcado/src/server/"; fi
}

# $1 -> IP
# $2 -> File path
# $3 -> Symbolic link path
CREATE_SYM_LINK()
{
	ASK_FOR "Criar link simbólico '$3'?" "yes"

	if [ "$choose" == "yes" ]; then 
		PRINT_INFO " > Criando link simbólico '$2'"
		PRINT_INFO "                       em '$3'"
		ssh -t $1 "sudo ln -sf $2 $3"
		if [ $? != 0 ]; then THROW "Não foi possível criar link simbólico"; fi
	fi
	
}

##########################################################################
### MAIN

if [ -z $1 ]; then THROW 'Informe os sistemas a serem compilados (OPÇÕES: includes reportincludes libs reportlibs report i18n oracle relatoriojava jasperadicionais)'; fi


REPOSITORIO=`svn info | grep "^$SVN_TAG_RAIZ:" | egrep -o '[^/]+$'`
if [ -z $REPOSITORIO ]; then THROW 'Não foi possível ler o repositório. Você está em um diretório svn?'; fi
if [ "$REPOSITORIO" != "serversys" ] && [ "$REPOSITORIO" != "parser2" ]; then THROW 'Este não é um repositório serversys ou parser2'; fi
PRINT_INFO "Repositório svn: " $REPOSITORIO


RELATIVE_URL=`svn info | grep "^$SVN_TAG_RELATIVE_URL:" | egrep -o '[^^]+$'`
FULL_PATH="$PATH_DESTINO/$REPOSITORIO/$RELATIVE_URL/"
PRINT_INFO "Diretório relativo: " $RELATIVE_URL
if [ `awk -F"/" '{print NF-1}' <<< "$RELATIVE_URL"` != 2 ]; then
	ASK_AND_DIE_IF_NO "Diretório relativo fora do padrão esperado (/ambiente/branch). Deseja continuar?" "no"
fi


PWD=`pwd`
PRINT_INFO "Local dir: " $PWD

#TODO: tornar dinâmico
if [ "$REPOSITORIO" != "parser2" ]; then
    PRINT_INFO "Destino: " "$IP_SRV_SASGC:$PATH_DESTINO"
else
    PRINT_INFO "Destino: " "$IP_SRV_PARSER:$PATH_DESTINO"
fi

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
				start) # Criação da branch no servidor
					START_SERVERSYS_REPO ; INIT_SERVERSYS_REPO ;;
				init) # Inicialização do serversys pela compilação básica no servidor
					INIT_SERVERSYS_REPO ;;
				confbin)
					CREATE_SYM_LINK $IP_SRV_SASGC "$FULL_PATH/sasgc_embarcado/src/server/sasgc/gerenciadord" "$BIN_PATH/gerenciadord"
					CREATE_SYM_LINK $IP_SRV_SASGC "$FULL_PATH/sasgc_embarcado/src/server/relatorio/gerenciador_relatoriod" "$BIN_PATH/gerenciador_relatoriod"
					# ssh -t $IP_SRV_SASGC "sudo ls -alF $BIN_PATH"
					;;

				librevegeo|revgeo)
				    DEPLOY "include" "libGeoWeb.h";
				    DEPLOY "lib" "libGeoWeb.cpp";
					;;
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
				
				gerenciadord|gerd) 
					DEPLOY_GERENCIADORD "gerenciadord" ;;
				gerenciador_relatoriod|relatoriod|reld) 
					DEPLOY_GERENCIADORD "gerenciador_relatoriod" ;;
				gerenciador|ger) # Ambos (gerenciadord e gerenciador_relatoriod)
					DEPLOY_GERENCIADORD "gerenciador" ;;

				jasperadicionais|jadicionais)
				    DEPLOY_REPORT_FILES "sasgc_embarcado/RelatoriosSasgc/template/" "dados_adicionais" "template";;
				jasperregrasseguranca|jregseg)
				    DEPLOY_REPORT_FILES "sasgc_embarcado/RelatoriosSasgc/template/" "sequenciamento_macros" "template" ;;
				jaspergrupopontos|jgpontos)
				    DEPLOY_REPORT_FILES "sasgc_embarcado/RelatoriosSasgc/template/" "grupoPontos" "template";;
				jasperclientes|jclientes)
				    DEPLOY_REPORT_FILES "sasgc_embarcado/RelatoriosSasgc/template/" "relatorio_clientes" "template";;
				jasperposicaodetalhado|jposicaodetalhado|jposdet)
				    DEPLOY_REPORT_FILES "sasgc_embarcado/RelatoriosSasgc/template/" "posicao_detalhado" "template";;

				
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
