#!/bin/bash

### SCRIPT CONFIGs
TITLE="PortalServicos"
declare -a modules=(
					"java/trunk/MiddlewareServicesIntegration"
					"java/trunk/MiddlewareServicesDelegate"
					"java/trunk/IntegrationPortal"
					"java/trunk/PortalDataAccessLayer"
					"java/trunk/PortalBusinessLogicLayer"
					"java/trunk/SascarPortalWeb")
RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[1;37m'
CL=$GREEN
NC='\033[0m' # No Color
### END

if [ -z "$1" ]; then
	echo "Specify the path"
	exit
fi
PATH_SRC=$1

if [ "$2" = "-f" ]; then
	echo "Force mode"
	FORCE=true
fi

if test ! -d "$PATH_SRC"; then
    echo "'$PATH_SRC' is not a directory or not exists"
	exit
fi

echo ""
echo "Starting build of $TITLE"

for module in "${modules[@]}"
do
	printf "\n${CL}=================================================================================================\n"
	printf "   Module: ${WHITE}$module${NC}\n"
	printf "${CL}=================================================================================================${NC}\n\n"

	POM="${PATH_SRC}/$module/pom.xml"

	if test ! -f "$POM"; then
		echo "'$POM' is not a file or not exists"
		exit
	fi

	if [ "$FORCE" != true ] ; then
		printf "Build '$module'? (enter '${RED}e$NC' to exit, '${RED}c$NC' to continue or ${RED}any key${NC} to build)\n"
		read choose
		if [ "$choose" = "e" ]; then
			exit
		fi
	fi

	if [ "$choose" != "c" ]; then
		### Executing the build
		### Using "DEV.MANUAL" to differs of jenkins builds
		mvn -T 4 -U clean package -Dproject.build.sourceEncoding=ISO-8859-1 -DBUILD_NUMBER=DEV.MANUAL -f "$POM"
	fi
done


