#!/bin/sh
#set -x

# echo 'Gerando arquivo de entrada...' #Ele será apagado no final pelo JAR
# printf 'Placa;Sensores;Atuadores;Acess�rios;Data Posi��o;Data Chegada;Igni��o;Od�metro;Hor�metro;RPM;Sensor A/D 1;Sensor A/D 2;Sensor A/D 3;Umi;Temp;Mem�ria;Satelital;Ponto de Ref. Embarcado;Ponto de Refer�ncia;Sensores Inibidos;Cidade;UF
# 3883SBS;<b>SCc</b> Sensor Caracol / <b>Des</b> - Desengate / <b>SPM</b> - Sensor Porta Motorista / <b>SPC</b> - Sensor Porta Carona / <b>VPa</b> - Viola��o de Painel;<b>Sir</b> - Sirene / <b>BuZ</b> - Buzzer;--;31/07/2019 15:42:07;31/07/2019 15:41:00;SIM;0,0;905h 35m;0;9;14;-;60,1%%;20,0ºC;NAO;NAO; ;DENTRO de dfsdfsdf;-;Curitiba;PR
# 3883SBS;<b>SCc</b> Sensor Caracol / <b>Des</b> - Desengate / <b>SPM</b> - Sensor Porta Motorista / <b>SPC</b> - Sensor Porta Carona / <b>VPa</b> - Viola��o de Painel;<b>Sir</b> - Sirene / <b>BuZ</b> - Buzzer;--;31/07/2019 15:40:07;31/07/2019 15:39:00;SIM;0,0;905h 33m;0;9;14;-;60,1%%;20,0ºC;NAO;NAO; ;DENTRO de dfsdfsdf;-;Curitiba;PR
# 3883SBS;<b>SCc</b> Sensor Caracol / <b>Des</b> - Desengate / <b>SPM</b> - Sensor Porta Motorista / <b>SPC</b> - Sensor Porta Carona / <b>VPa</b> - Viola��o de Painel;<b>Sir</b> - Sirene / <b>BuZ</b> - Buzzer;--;31/07/2019 15:44:07;31/07/2019 15:42:59;SIM;0,0;905h 37m;0;8;14;-;60,1%%;20,0ºC;NAO;NAO; ;DENTRO de dfsdfsdf;-;Curitiba;PR
# 3883SBS;<b>SCc</b> Sensor Caracol / <b>Des</b> - Desengate / <b>SPM</b> - Sensor Porta Motorista / <b>SPC</b> - Sensor Porta Carona / <b>VPa</b> - Viola��o de Painel;<b>Sir</b> - Sirene / <b>BuZ</b> - Buzzer;--;31/07/2019 15:38:07;31/07/2019 15:37:01;SIM;0,0;905h 31m;0;9;14;-;60,1%%;20,0ºC;NAO;NAO; ;DENTRO de dfsdfsdf;-;Curitiba;PR
# 3883SBS;<b>SCc</b> Sensor Caracol / <b>Des</b> - Desengate / <b>SPM</b> - Sensor Porta Motorista / <b>SPC</b> - Sensor Porta Carona / <b>VPa</b> - Viola��o de Painel;<b>Sir</b> - Sirene / <b>BuZ</b> - Buzzer;--;31/07/2019 15:36:07;31/07/2019 15:35:00;SIM;0,0;905h 29m;0;9;14;-;60,1%%;20,0ºC;NAO;NAO; ;DENTRO de dfsdfsdf;-;Curitiba;PR
# 3883SBS;<b>SCc</b> Sensor Caracol / <b>Des</b> - Desengate / <b>SPM</b> - Sensor Porta Motorista / <b>SPC</b> - Sensor Porta Carona / <b>VPa</b> - Viola��o de Painel;<b>Sir</b> - Sirene / <b>BuZ</b> - Buzzer;--;31/07/2019 15:34:07;31/07/2019 15:32:59;SIM;0,0;905h 27m;0;9;14;-;60,1%%;20,0ºC;NAO;NAO; ;DENTRO de dfsdfsdf;-;Curitiba;PR
# 3883SBS;<b>SCc</b> Sensor Caracol / <b>Des</b> - Desengate / <b>SPM</b> - Sensor Porta Motorista / <b>SPC</b> - Sensor Porta Carona / <b>VPa</b> - Viola��o de Painel;<b>Sir</b> - Sirene / <b>BuZ</b> - Buzzer;--;31/07/2019 15:32:07;31/07/2019 15:30:59;SIM;0,0;905h 25m;0;8;14;-;60,1%%;20,0ºC;NAO;NAO; ;DENTRO de cop agosto;-;Curitiba;PR
# 3883SBS;<b>SCc</b> Sensor Caracol / <b>Des</b> - Desengate / <b>SPM</b> - Sensor Porta Motorista / <b>SPC</b> - Sensor Porta Carona / <b>VPa</b> - Viola��o de Painel;<b>Sir</b> - Sirene / <b>BuZ</b> - Buzzer;--;31/07/2019 15:31:02;31/07/2019 15:29:53;SIM;0,0;905h 23m;0;9;14;-;60,1%%;20,0ºC;NAO;NAO; ;DENTRO de Bezerra descanso;-;Curitiba;PR
# 3883SBS;<b>SCc</b> Sensor Caracol / <b>Des</b> - Desengate / <b>SPM</b> - Sensor Porta Motorista / <b>SPC</b> - Sensor Porta Carona / <b>VPa</b> - Viola��o de Painel;<b>Sir</b> - Sirene / <b>BuZ</b> - Buzzer;--;31/07/2019 15:30:50;31/07/2019 15:29:42;SIM;0,0;905h 23m;0;8;14;-;60,1%%;20,0ºC;NAO;NAO; ;DENTRO de SASCAR - COP;-;Curitiba;PR
# 3883SBS;<b>SCc</b> Sensor Caracol / <b>Des</b> - Desengate / <b>SPM</b> - Sensor Porta Motorista / <b>SPC</b> - Sensor Porta Carona / <b>VPa</b> - Viola��o de Painel;<b>Sir</b> - Sirene / <b>BuZ</b> - Buzzer;--;31/07/2019 15:28:50;31/07/2019 15:27:42;SIM;0,0;905h 21m;0;8;14;-;60,1%%;20,0ºC;NAO;NAO; ;DENTRO de Arsenio;-;Curitiba;PR
# ' > /tmp/relatorio777.csv
#EXEMPLO: sudo ~/scripts/relatorio_devel.sh 406575 0 80 '24/07/2019 15:53:16' '31/07/2019 15:53:16' 10 40 7 67 0 s 2 America/Sao_Paulo 'false' 777

I18N="$HOME/src/serversys/producao/sasgc_embarcado/RelatoriosAgendados/resources/"
PROPERTIES="$HOME/scripts/config_bd_relatorio.properties"
JAR="$HOME/src/serversys/homologacao/sasgc_embarcado/RelatoriosSasgc/target/RelatoriosSasgc-jar-with-dependencies.jar"

#echo $* > /tmp/gera_relatorio.log

# echo $1
# echo $2
# echo $3
# echo $4
# echo $5
# echo $6
# echo $7
# echo $8
# echo $9
# echo ${10}
# echo ${11}
# echo ${12}
# echo ${13}
# echo ${14}
# echo ${15}

#monta o comando
# comando="java -DPathI18nProperties=/usr/sascar/sasgc/ -Xmx512m -DConfigRelatorioSagc=/usr/sascar/sasgc/config_bd_relatorio.properties -jar /usr/sascar/sasgc/relatorio.jar $1 $2 $3 \"$4\" \"$5\" $6 $7 $8 $9 ${10} ${15} 0 1 \"${11}\" ${12} \"${13}\" \"${14}\""
comando="java -DPathI18nProperties=$I18N -Xmx512m -DConfigRelatorioSagc=$PROPERTIES -jar $JAR $1 $2 $3 \"$4\" \"$5\" $6 $7 $8 $9 ${10} ${15} 0 1 \"${11}\" ${12} \"${13}\" \"${14}\""

#salva a chamada do java
#echo $comando > /root/teste_devel 

#executa o comando
# (eval $comando) > /root/tmp/report_java.log 2>&1
echo "comando:\n~~~~\n$comando\n~~~~\n"
(eval $comando)

libreoffice --calc /tmp/rel${15}.csv &

# sleep 1