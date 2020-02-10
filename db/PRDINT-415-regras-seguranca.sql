/**
  * Hist�ria: PRDINT-415
  * Base: gerenciadora
  *
  * Script de tradu��o do relat�rio "Regras de Seguran�a"
  * - Insere as novas strings necess�rias na tabela tradu��o
  * - Altera as procedures relatorio_sequenciamento_macros e traducao_acao_embarcada
  *       para suporte ao idioma
  * - Refatora��o das procedures
  *
  **/
  
----------------------------------------------------------------------------------------
--- inserts das novas tradu��es
----------------------------------------------------------------------------------------

--- Portugu�s
insert into public.traducao values ('Desativado','Desativado','pt_BR');
insert into public.traducao values ('Ativado','Ativado','pt_BR');
insert into public.traducao values ('Invers�o de Estado','Invers�o de Estado','pt_BR');
insert into public.traducao values ('N�o Obrigat�rio','N�o Obrigat�rio','pt_BR');
insert into public.traducao values ('Obrigat�rio','Obrigat�rio','pt_BR');
insert into public.traducao values ('V�lido','V�lido','pt_BR');
insert into public.traducao values ('Inv�lido','Inv�lido','pt_BR');
insert into public.traducao values ('Falha GPS','Falha GPS','pt_BR');
insert into public.traducao values ('Conectado','Conectado','pt_BR');
insert into public.traducao values ('Desconectou','Desconectou','pt_BR');
insert into public.traducao values ('Verifica','Verifica','pt_BR');
insert into public.traducao values ('N�o Verifica Falha','N�o Verifica Falha','pt_BR');
insert into public.traducao values ('Verifica Falha','Verifica Falha','pt_BR');
insert into public.traducao values ('Modo Satelital','Modo Satelital','pt_BR');
insert into public.traducao values ('Falha de comunica��o da antena','Falha de comunica��o da antena','pt_BR');
insert into public.traducao values ('Falta de sinal Satelital','Falta de sinal Satelital','pt_BR');
insert into public.traducao values ('Entrar em opera��o','Entrar em opera��o','pt_BR');
insert into public.traducao values ('Sair da opera��o','Sair da opera��o','pt_BR');
insert into public.traducao values ('Estar em opera��o','Estar em opera��o','pt_BR');
insert into public.traducao values ('Abaixo da temp m�nimo','Abaixo da temp m�nimo','pt_BR');
insert into public.traducao values ('Entre o m�nimo e o m�ximo','Entre o m�nimo e o m�ximo','pt_BR');
insert into public.traducao values ('Acima temp m�ximo','Acima temp m�ximo','pt_BR');
insert into public.traducao values ('Falha','Falha','pt_BR');
insert into public.traducao values ('Carga','Carga','pt_BR');
insert into public.traducao values ('Em uso','Em uso','pt_BR');
insert into public.traducao values ('Alimenta��o OK','Alimenta��o OK','pt_BR');
insert into public.traducao values ('Sobre Tens�o','Sobre Tens�o','pt_BR');
insert into public.traducao values ('Sob tens�o','Sob tens�o','pt_BR');
insert into public.traducao values ('Verifica Urbano','Verifica Urbano','pt_BR');
insert into public.traducao values ('Verifica Rodovi�rio','Verifica Rodovi�rio','pt_BR');
insert into public.traducao values ('Verifica Desligado','Verifica Desligado','pt_BR');
insert into public.traducao values ('Verifica Ligado','Verifica Ligado','pt_BR');
insert into public.traducao values ('Verifica Invers�o de Estado','Verifica Invers�o de Estado','pt_BR');
insert into public.traducao values ('Analisa se est� dentro','Analisa se est� dentro','pt_BR');
insert into public.traducao values ('Analisa se entrou','Analisa se entrou','pt_BR');
insert into public.traducao values ('Analisa se saiu','Analisa se saiu','pt_BR');
insert into public.traducao values ('Analisa se n�o est� em nenhuma �rea','Analisa se n�o est� em nenhuma �rea','pt_BR');
insert into public.traducao values ('Analisa se est� em qualquer �rea','Analisa se est� em qualquer �rea','pt_BR');
insert into public.traducao values ('Analisa se n�o est� em nenhum ponto','Analisa se n�o est� em nenhum ponto','pt_BR');
insert into public.traducao values ('Analisa se est� em qualquer ponto','Analisa se est� em qualquer ponto','pt_BR');
insert into public.traducao values ('minutos','minutos','pt_BR');
insert into public.traducao values ('segundos','segundos','pt_BR');
insert into public.traducao values ('KM','KM','pt_BR');
insert into public.traducao values ('Analisa em modo seguro','Analisa em modo seguro','pt_BR');
insert into public.traducao values ('Analisa fora de modo seguro','Analisa fora de modo seguro','pt_BR');
insert into public.traducao values ('Analisa mudan�a de modo','Analisa mudan�a de modo','pt_BR');
insert into public.traducao values ('Desligado','Desligado','pt_BR');
insert into public.traducao values ('Ligado','Ligado','pt_BR');
insert into public.traducao values ('Inverte Estado','Inverte Estado','pt_BR');
insert into public.traducao values ('In�cio de viagem','In�cio de viagem','pt_BR');
insert into public.traducao values ('Fim de viagem','Fim de viagem','pt_BR');
insert into public.traducao values ('Ba� destravado','Ba� destravado','pt_BR');
insert into public.traducao values ('Ba� travado','Ba� travado','pt_BR');
insert into public.traducao values ('Carreta desengatada','Carreta desengatada','pt_BR');
insert into public.traducao values ('Carreta engatada','Carreta engatada','pt_BR');
insert into public.traducao values ('Entrada �rea de risco','Entrada �rea de risco','pt_BR');
insert into public.traducao values ('Local autorizado','Local autorizado','pt_BR');
insert into public.traducao values ('Local n�o autorizado','Local n�o autorizado','pt_BR');
insert into public.traducao values ('Mens. armazenada em mem�ria','Mens. armazenada em mem�ria','pt_BR');
insert into public.traducao values ('Mens. enviada com sucesso','Mens. enviada com sucesso','pt_BR');
insert into public.traducao values ('Portas abertas','Portas abertas','pt_BR');
insert into public.traducao values ('Porta carona aberta','Porta carona aberta','pt_BR');
insert into public.traducao values ('Porta motorista aberta','Porta motorista aberta','pt_BR');
insert into public.traducao values ('Nova coleta verifique mensagem','Nova coleta verifique mensagem','pt_BR');
insert into public.traducao values ('5a. roda liberada por 2 minutos','5a. roda liberada por 2 minutos','pt_BR');
insert into public.traducao values ('Necess�rio identica��o do motorista','Necess�rio identica��o do motorista','pt_BR');
insert into public.traducao values ('Parada indevida','Parada indevida','pt_BR');
insert into public.traducao values ('Sa�da �rea de risco','Sa�da �rea de risco','pt_BR');
insert into public.traducao values ('Desvio de rota','Desvio de rota','pt_BR');
insert into public.traducao values ('Sa�da de rota','Sa�da de rota','pt_BR');
insert into public.traducao values ('Informe o motivo da parada','Informe o motivo da parada','pt_BR');
insert into public.traducao values ('Movimento indevido','Movimento indevido','pt_BR');
insert into public.traducao values ('Entrar em contato com a central','Entrar em contato com a central','pt_BR');
insert into public.traducao values ('Entrar em contato com a gerenciadora','Entrar em contato com a gerenciadora','pt_BR');
insert into public.traducao values ('Freada brusca','Freada brusca','pt_BR');
insert into public.traducao values ('Modo rodoviario selecionado','Modo rodoviario selecionado','pt_BR');
insert into public.traducao values ('Modo seguro ativado','Modo seguro ativado','pt_BR');
insert into public.traducao values ('Modo seguro desativado','Modo seguro desativado','pt_BR');
insert into public.traducao values ('Modo urbano selecionado','Modo urbano selecionado','pt_BR');
insert into public.traducao values ('RPM auto','RPM auto','pt_BR');
insert into public.traducao values ('Verificar press�o do �leo','Verificar press�o do �leo','pt_BR');
insert into public.traducao values ('Verificar temperatura ba�','Verificar temperatura ba�','pt_BR');
insert into public.traducao values ('Verificar temperatura motor','Verificar temperatura motor','pt_BR');
insert into public.traducao values ('Beep1','Beep1','pt_BR');
insert into public.traducao values ('Beep2','Beep2','pt_BR');
insert into public.traducao values ('Excesso de tempo parado','Excesso de tempo parado','pt_BR');
insert into public.traducao values ('Reduza a velocidade','Reduza a velocidade','pt_BR');
insert into public.traducao values ('Mensagem nova','Mensagem nova','pt_BR');
insert into public.traducao values ('Tirar Foto e Gravar','Tirar Foto e Gravar','pt_BR');
insert into public.traducao values ('Tirar Foto, Gravar e enviar foto','Tirar Foto, Gravar e enviar foto','pt_BR');
insert into public.traducao values ('Todas as Cameras','Todas as Cameras','pt_BR');
insert into public.traducao values ('Camera 1','Camera 1','pt_BR');
insert into public.traducao values ('Camera 2','Camera 2','pt_BR');
insert into public.traducao values ('Camera 3','Camera 3','pt_BR');
insert into public.traducao values ('Camera 4','Camera 4','pt_BR');
insert into public.traducao values ('(Km/h)','(Km/h)','pt_BR');
insert into public.traducao values ('M�xima Urbana','M�xima Urbana','pt_BR');
insert into public.traducao values ('M�xima Rodovi�ria','M�xima Rodovi�ria','pt_BR');
insert into public.traducao values ('M�ximo Urbano Chuva','M�ximo Urbano Chuva','pt_BR');
insert into public.traducao values ('M�ximo Rodovi�rio Chuva','M�ximo Rodovi�rio Chuva','pt_BR');
insert into public.traducao values ('(s)','(s)','pt_BR');
insert into public.traducao values ('Igni��o ligada gprs','Igni��o ligada gprs','pt_BR');
insert into public.traducao values ('Igni��o deligada gprs','Igni��o deligada gprs','pt_BR');
insert into public.traducao values ('Igni��o ligada satelital','Igni��o ligada satelital','pt_BR');
insert into public.traducao values ('Igni��o desligada satelital','Igni��o desligada satelital','pt_BR');
insert into public.traducao values ('Verificar','Verificar','pt_BR');
insert into public.traducao values ('Desativa','Desativa','pt_BR');
insert into public.traducao values ('Ativa','Ativa','pt_BR');
insert into public.traducao values ('Guarda posi��o','Guarda posi��o','pt_BR');
insert into public.traducao values ('Sair do low power','Sair do low power','pt_BR');
insert into public.traducao values ('Envio por GPRS ou satelital','Envio por GPRS ou satelital','pt_BR');
insert into public.traducao values ('Aciona','Aciona','pt_BR');
insert into public.traducao values ('Inicia','Inicia','pt_BR');
insert into public.traducao values ('Fecha','Fecha','pt_BR');
insert into public.traducao values ('Inicia e Fecha','Inicia e Fecha','pt_BR');
insert into public.traducao values ('Rodovi�rio','Rodovi�rio','pt_BR');
insert into public.traducao values ('Urbano','Urbano','pt_BR');
insert into public.traducao values ('Fora de Modo Seguro','Fora de Modo Seguro','pt_BR');
insert into public.traducao values ('Em Modo Seguro','Em Modo Seguro','pt_BR');
insert into public.traducao values ('Mudan�a de Modo','Mudan�a de Modo','pt_BR');
insert into public.traducao values ('segundo(s)','segundo(s)','pt_BR');

--- Espanhol
insert into public.traducao values ('Desativado','Desactivado','es_AR');
insert into public.traducao values ('Ativado','Activado','es_AR');
insert into public.traducao values ('Invers�o de Estado','Inversi�n de estado','es_AR');
insert into public.traducao values ('N�o Obrigat�rio','opcional','es_AR');
insert into public.traducao values ('Obrigat�rio','Obligatorio','es_AR');
insert into public.traducao values ('V�lido','V�lido','es_AR');
insert into public.traducao values ('Inv�lido','Inv�lido','es_AR');
insert into public.traducao values ('Falha GPS','Falla del GPS','es_AR');
insert into public.traducao values ('Conectado','Conectado','es_AR');
insert into public.traducao values ('Desconectou','desconectado','es_AR');
insert into public.traducao values ('Verifica','Verificar','es_AR');
insert into public.traducao values ('N�o Verifica Falha','No detecta falla','es_AR');
insert into public.traducao values ('Verifica Falha','Detecta falla','es_AR');
insert into public.traducao values ('Modo Satelital','Modo satelital','es_AR');
insert into public.traducao values ('Falha de comunica��o da antena','�falla de comunicaci�n de la antena�','es_AR');
insert into public.traducao values ('Falta de sinal Satelital','Falta de se�al satelital','es_AR');
insert into public.traducao values ('Entrar em opera��o','Poner en marcha','es_AR');
insert into public.traducao values ('Sair da opera��o','Salir de la operaci�n�','es_AR');
insert into public.traducao values ('Estar em opera��o','Estar en funcionamiento','es_AR');
insert into public.traducao values ('Abaixo da temp m�nimo','Abajo de la temperatura m�nima','es_AR');
insert into public.traducao values ('Entre o m�nimo e o m�ximo','Entre el m�nimo y el m�ximo','es_AR');
insert into public.traducao values ('Acima temp m�ximo','Por encima de la temperatura m�xima','es_AR');
insert into public.traducao values ('Falha','Falla','es_AR');
insert into public.traducao values ('Carga','Carga','es_AR');
insert into public.traducao values ('Em uso','En uso','es_AR');
insert into public.traducao values ('Alimenta��o OK','Alimentaci�n OK','es_AR');
insert into public.traducao values ('Sobre Tens�o','Sobre presi�n','es_AR');
insert into public.traducao values ('Sob tens�o','Sobre presi�n','es_AR');
insert into public.traducao values ('Verifica Urbano','Verifica urbano','es_AR');
insert into public.traducao values ('Verifica Rodovi�rio','verificar ruta','es_AR');
insert into public.traducao values ('Verifica Desligado','Verificar apagado','es_AR');
insert into public.traducao values ('Verifica Ligado','verificar encendidp','es_AR');
insert into public.traducao values ('Verifica Invers�o de Estado','verificar revision de estado','es_AR');
insert into public.traducao values ('Analisa se est� dentro','Analizar si est� dentro','es_AR');
insert into public.traducao values ('Analisa se entrou','Analizar si ingres�','es_AR');
insert into public.traducao values ('Analisa se saiu','Analiza si sali�','es_AR');
insert into public.traducao values ('Analisa se n�o est� em nenhuma �rea','Analiza si no est�s en ninguna �rea','es_AR');
insert into public.traducao values ('Analisa se est� em qualquer �rea','Analiza si est�s en alguna �rea','es_AR');
insert into public.traducao values ('Analisa se n�o est� em nenhum ponto','Analiza si no est�s en ning�n punto','es_AR');
insert into public.traducao values ('Analisa se est� em qualquer ponto','Analiza si est�s en algun punto','es_AR');
insert into public.traducao values ('minutos','minutos','es_AR');
insert into public.traducao values ('segundos','segundos','es_AR');
insert into public.traducao values ('KM','KM','es_AR');
insert into public.traducao values ('Analisa em modo seguro','Analizar en modo seguro','es_AR');
insert into public.traducao values ('Analisa fora de modo seguro','Analizar fuera de forma segura','es_AR');
insert into public.traducao values ('Analisa mudan�a de modo','Analizar cambio de modo','es_AR');
insert into public.traducao values ('Desligado','Apagado','es_AR');
insert into public.traducao values ('Ligado','Encendido','es_AR');
insert into public.traducao values ('Inverte Estado','Estado invertido','es_AR');
insert into public.traducao values ('In�cio de viagem','Inicio de viaje','es_AR');
insert into public.traducao values ('Fim de viagem','Fin de viaje','es_AR');
insert into public.traducao values ('Ba� destravado','Ba�l desbloqueado','es_AR');
insert into public.traducao values ('Ba� travado','Ba�l bloqueado','es_AR');
insert into public.traducao values ('Carreta desengatada','Semirremolque desenganchado','es_AR');
insert into public.traducao values ('Carreta engatada','Semirremolque enganchado','es_AR');
insert into public.traducao values ('Entrada �rea de risco','Entrada en �rea peligrosa','es_AR');
insert into public.traducao values ('Local autorizado','Lugar autorizado','es_AR');
insert into public.traducao values ('Local n�o autorizado','Lugar no autorizado','es_AR');
insert into public.traducao values ('Mens. armazenada em mem�ria','Mensaje almacenado en la memoria','es_AR');
insert into public.traducao values ('Mens. enviada com sucesso','Mensaje enviado con �xito','es_AR');
insert into public.traducao values ('Portas abertas','Puertas abiertas','es_AR');
insert into public.traducao values ('Porta carona aberta','Puerta acompa�ante abierta','es_AR');
insert into public.traducao values ('Porta motorista aberta','Puerta del conductor abierta','es_AR');
insert into public.traducao values ('Nova coleta verifique mensagem','Nueva solicitud, verifique el mensaje','es_AR');
insert into public.traducao values ('5a. roda liberada por 2 minutos','Quinta rueda liberada por 2 minutos','es_AR');
insert into public.traducao values ('Necess�rio identica��o do motorista','Identificaci�n del chofer necesaria','es_AR');
insert into public.traducao values ('Parada indevida','parada no autorizada','es_AR');
insert into public.traducao values ('Sa�da �rea de risco','Salida �rea de riesgo','es_AR');
insert into public.traducao values ('Desvio de rota','Desv�o de ruta','es_AR');
insert into public.traducao values ('Sa�da de rota','Salida de ruta','es_AR');
insert into public.traducao values ('Informe o motivo da parada','Informe el motivo de la parada','es_AR');
insert into public.traducao values ('Movimento indevido','Movimiento indebido','es_AR');
insert into public.traducao values ('Entrar em contato com a central','Contactar a la central','es_AR');
insert into public.traducao values ('Entrar em contato com a gerenciadora','Contactar a la gestora de riesgo','es_AR');
insert into public.traducao values ('Freada brusca','Frenada brusca','es_AR');
insert into public.traducao values ('Modo rodoviario selecionado','modo ruta seleccionado','es_AR');
insert into public.traducao values ('Modo seguro ativado','modo seguro activo','es_AR');
insert into public.traducao values ('Modo seguro desativado','Modo seguro desabilitado','es_AR');
insert into public.traducao values ('Modo urbano selecionado','Modo urbano seleccionado','es_AR');
insert into public.traducao values ('RPM auto','RPM auto','es_AR');
insert into public.traducao values ('Verificar press�o do �leo','Verificar la presi�n del aceite','es_AR');
insert into public.traducao values ('Verificar temperatura ba�','Verificar la temperatura del�ba�l','es_AR');
insert into public.traducao values ('Verificar temperatura motor','Verificar la temperatura del motor','es_AR');
insert into public.traducao values ('Beep1','Beep1','es_AR');
insert into public.traducao values ('Beep2','Beep2','es_AR');
insert into public.traducao values ('Excesso de tempo parado','Exceso de tiempo parado','es_AR');
insert into public.traducao values ('Reduza a velocidade','Reduzca la velocidad','es_AR');
insert into public.traducao values ('Mensagem nova','Nuevo mensaje','es_AR');
insert into public.traducao values ('Tirar Foto e Gravar','Tomar foto y grabar','es_AR');
insert into public.traducao values ('Tirar Foto, Gravar e enviar foto','Tomar foto, grabar y subir foto','es_AR');
insert into public.traducao values ('Todas as Cameras','Todas las C�maras','es_AR');
insert into public.traducao values ('Camera 1','C�mara 1','es_AR');
insert into public.traducao values ('Camera 2','C�mara 2','es_AR');
insert into public.traducao values ('Camera 3','C�mara 3','es_AR');
insert into public.traducao values ('Camera 4','C�mara 4','es_AR');
insert into public.traducao values ('(Km/h)','(Km/h)','es_AR');
insert into public.traducao values ('M�xima Urbana','Velocidad maxima zona urbana','es_AR');
insert into public.traducao values ('M�xima Rodovi�ria','Velocidad maxima en ruta','es_AR');
insert into public.traducao values ('M�ximo Urbano Chuva','Velocidad maxima en zona urbana con lluvia','es_AR');
insert into public.traducao values ('M�ximo Rodovi�rio Chuva','Velocidad Maxima con lluvia','es_AR');
insert into public.traducao values ('(s)','(s)','es_AR');
insert into public.traducao values ('Igni��o ligada gprs','Ignici�n encendida GPRS','es_AR');
insert into public.traducao values ('Igni��o deligada gprs','Ignici�n apagada GPRS','es_AR');
insert into public.traducao values ('Igni��o ligada satelital','Ignici�n satelital encendida','es_AR');
insert into public.traducao values ('Igni��o desligada satelital','Ignici�n satelital apagado','es_AR');
insert into public.traducao values ('Verificar','Verificar','es_AR');
insert into public.traducao values ('Desativa','deshabilita','es_AR');
insert into public.traducao values ('Ativa','activo','es_AR');
insert into public.traducao values ('Guarda posi��o','Guarda posici�n','es_AR');
insert into public.traducao values ('Sair do low power','Salir del low power','es_AR');
insert into public.traducao values ('Envio por GPRS ou satelital','Env�o GPRS o satelital','es_AR');
insert into public.traducao values ('Aciona','Accionar','es_AR');
insert into public.traducao values ('Inicia','Inicio','es_AR');
insert into public.traducao values ('Fecha','fecha','es_AR');
insert into public.traducao values ('Inicia e Fecha','Incio y fecha','es_AR');
insert into public.traducao values ('Rodovi�rio','ruta','es_AR');
insert into public.traducao values ('Urbano','Urbano','es_AR');
insert into public.traducao values ('Fora de Modo Seguro','Fuera del modo seguro','es_AR');
insert into public.traducao values ('Em Modo Seguro','En modo seguro','es_AR');
insert into public.traducao values ('Mudan�a de Modo','Cambio de modo','es_AR');
insert into public.traducao values ('segundo(s)','segundo(s)','es_AR');

----------------------------------------------------------------------------------------
--- Drop dos procedures antigos
----------------------------------------------------------------------------------------

DROP FUNCTION public.relatorio_sequenciamento_macros(integer);
DROP FUNCTION public.traducao_acao_embarcada(text,text,text);

----------------------------------------------------------------------------------------
--- procedure relatorio_sequenciamento_macros
----------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION public.relatorio_sequenciamento_macros(integer, text default 'pt_BR')
 RETURNS integer
 LANGUAGE pltcl
AS $function$
# $1 veioid
# $2 idioma

set traidioma $2

set veioid $1
spi_exec "create temp table  sequenciamento_macro_relatorio (sqmnome text, sqmdescricao text, sqmcriacao_embarque
timestamp without time zone, sqmcadastro timestamp without time zone, mttdoid integer, mttdnome text, mttdconteudo text,  ameoid integer,condicao text, acao text)"
spi_exec -array sequenciamento_macro "select sqmnome, sqmdescricao, sqmcriacao_embarque,sqmcadastro from sequenciamento_macros_virtual where sqmveioid = $veioid" {
    set sqmnome $sequenciamento_macro(sqmnome)
    set sqmdescricao $sequenciamento_macro(sqmdescricao)
    set sqmcriacao_embarque $sequenciamento_macro(sqmcriacao_embarque)
    set sqmcadastro $sequenciamento_macro(sqmcadastro)
}

spi_exec -array macro "select mttdoid, mttdnome, mttdconteudo from macro_teclado_td50_virtual where veioid = $veioid" {
    set mttdoid $macro(mttdoid)
    set mttdnome $macro(mttdnome)
    set mttdconteudo $macro(mttdconteudo)
    spi_exec -array macro_detalhe "select dttdhidden2 from detalhe_macro_teclado_td50_virtual where veioid = $veioid and dttdtipo = 258 and dttdmttdoid = $mttdoid " {
        set dttdhidden2 $macro_detalhe(dttdhidden2)
        foreach {ameoid} $dttdhidden2 {
            elog NOTICE "select * from acao_embarcada_mtc600_virtual where aemoid = $ameoid and veioid = $veioid"
            spi_exec -array acao_embarcada "select * from acao_embarcada_mtc600_virtual where aemoid = $ameoid and veioid = $veioid and aemdt_exclusao is null" {
                set condicao ""
                set acao ""
                set aemcondicao_tratada $acao_embarcada(aemcondicao_tratada)
                set aemacao_tratada $acao_embarcada(aemacao_tratada)
                set virgula false
                foreach {atgoid grupo status obrigatorio} $aemcondicao_tratada {
                    if { $grupo == 21 } {
                        set queryCondicao "select traducao_acao_embarcada('condicao','$atgoid $grupo $status $obrigatorio','NULL','$traidioma') as condicao";
                    } else {
                        set queryCondicao "select traducao_acao_embarcada('condicao','$atgoid $grupo $status','NULL','$traidioma') as condicao";
                    }
                    spi_exec -array aemacondicao "$queryCondicao" {
                        set condicao_aux "[lindex $aemacondicao(condicao) 0] [lindex $aemacondicao(condicao) 1] [lindex $aemacondicao(condicao) 2]"
                        if { [lindex $aemacondicao(condicao) 0] != "" } {
                            if { $virgula == true } {
                                append condicao ", "
                            }
                            append condicao "$condicao_aux"
                            set virgula true
                        }
                    }
                }
                set virgula false
                foreach {atgoid grupo status obrigatorio} $aemacao_tratada {
                    spi_exec -array aemacao "select traducao_acao_embarcada('acao','NULL','$atgoid $grupo $status $obrigatorio','$traidioma') as acao" {
                        set acao_aux "[lindex $aemacao(acao) 0] [lindex $aemacao(acao) 1] [lindex $aemacao(acao) 2]"
                        if { [lindex $aemacao(acao) 0] != "" } {
                            if { $virgula == true } {
                                append acao ", "
                            }
                            append acao "$acao_aux"
                            set virgula true
                        }
                    }
                }

    spi_exec "insert into sequenciamento_macro_relatorio values('$sqmnome', '$sqmdescricao', '$sqmcriacao_embarque', '$sqmcadastro', $mttdoid, '$mttdnome', '$mttdconteudo',  $ameoid,'$condicao', '$acao')"
            }
        }
    }
}
$function$
;

----------------------------------------------------------------------------------------
--- procedure traducao_acao_embarcada
----------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION public.traducao_acao_embarcada(text, text, text, text default 'pt_BR')
 RETURNS text
 LANGUAGE pltcl
AS $function$

set TIPO $1
set CONDICAO $2
set ACAO $3
set IDIOMA $4

set atgdescricao ""
set status_t ""
set obrigatorio_t ""
set valor_status ""
set valor_obrig ""
set sufixo ""

if { $TIPO == "condicao" } {
    foreach {atgoid grupo status obrigatorio} $CONDICAO {
        
        spi_exec -array atgdesc "select atgdescricao from atuador_grupo  where atgoid = $atgoid" {
            set atgdescricao $atgdesc(atgdescricao)
        }

        switch $grupo {
            "1" - "2" - "6" - "7" - "9" - "53" {
                # 1: Sensor, 2: Igni��o, 6: Panico, 7: Sa�da, 9: Tempo parado, 53: Bloqueio
                switch $status {
                    "0" { set status_t "Desativado" }
                    "1" { set status_t "Ativado" }
                    "2" { set status_t "Invers�o de Estado" }
                }
                if { $grupo != 9 } {
                    switch $obrigatorio {
                        "0" { set obrigatorio_t "N�o Obrigat�rio" }
                        "1" { set obrigatorio_t "Obrigat�rio" }
                    }
                }
            }
            "3" { # gps
                switch $status {
                    "1" { set status_t "V�lido" }
                    "2" { set status_t "Inv�lido" }
                    "3" { set status_t "Falha GPS" }
                }
            }
            "4" { # GPRS
                switch $status {
                    "1" { set status_t "Conectado" }
                    "2" { set status_t "Desconectou" }
                }
            }
            "5" - "25" - "26" - "27" - "28" - "29" - "37" - "38" - "43" - "44" - "45" - "46" - "47" - "48" - "49" {
                # 5: Velocidade maxima, 25: Login, 26: Logoff, 27: Manobra, 28: Gestor, 29: Coa��o
                # 45: Marcha lenta, 46: Excesso de velocidade, 47: Excesso de rota��o
                # 48: Falha de temperatura no liquido de arrefecimento, 49: Tens�o do alternador
                switch $status {
                    "1" { set status_t "Verifica" }
                }
            }
            "8" { # teclado
                switch $status {
                    "0" { set status_t "N�o Verifica Falha" }
                    "1" { set status_t "Verifica Falha" }
                }
            }
            "10" { # macro td50 
                # TODO: implementar - a implementacao foi comentada por estar com erro
                # select pelo nome da macro na tabela  macro_teclado_td50 virtual
                # pegar nome e imprimir no nome do status olhar documenta��o para query pag 3
                # spi_exec -array macro "select mttdnome from macro_teclado_td50_virtual where mttdoid =$status and veioid = $TIPO" {
                #    set valor_status $macro(mttdnome)
                # }
            }
            "11" { # satelital
                switch $status {
                    "1" { set status_t "Modo Satelital" }
                    "2" { set status_t "Falha de comunica��o da antena" }
                    "3" { set status_t "Falta de sinal Satelital" }
                }
            }
            "12" { # opera��o
                switch $status {
                    "1" { set status_t "Entrar em opera��o" }
                    "2" { set status_t "Sair da opera��o" }
                    "3" { set status_t "Estar em opera��o" }
                }
            }
            "13" - "14" - "15" { # 13: Temperatura 1, 14: Temperatura 2, 15: Temperatura 3
                switch $status {
                    "1" { set status_t "Abaixo da temp m�nimo" }
                    "2" { set status_t "Entre o m�nimo e o m�ximo" }
                    "3" { set status_t "Acima temp m�ximo" }
                }
                switch $obrigatorio {
                    "0" { set obrigatorio_t "N�o obrigat�rio" }
                    "1" { set obrigatorio_t "Obrigat�rio" }
                }
            }
            "16" - "17" { # 16: Bateria interna, 17: Bateria externa
                switch $status {
                    "1" { set status_t "Falha" }
                    "2" { set status_t "Carga" }
                    "3" { set status_t "Em uso" }
                }
            }
            "18" { # alimenta��o de ene
                switch $status {
                    "1" { set status_t "Alimenta��o OK" }
                    "2" { set status_t "Sobre Tens�o" }
                    "3" { set status_t "Sob tens�o" }
                }
            }
            "19" { # Urbano / Rodoviario
                switch $status {
                    "1" { set status_t "Verifica Urbano" }
                    "2" { set status_t "Verifica Rodovi�rio" }
                }
            }
            "20" {
                switch $status {
                    "1" { set status_t "Verifica Desligado" }
                    "2" { set status_t "Verifica Ligado" }
                    "3" { set status_t "Verifica Invers�o de Estado" }
                }
            }
            "21" { # �rea embarcada
                switch $status {
                    "1" { set status_t "Analisa se est� dentro" }
                    "2" { set status_t "Analisa se entrou" }
                    "3" { set status_t "Analisa se saiu" }
                    "4" { set status_t "Analisa se n�o est� em nenhuma �rea" }
                    "7" { set status_t "Analisa se est� em qualquer �rea" }
                }
                # procurar na query onde o id da a na var
                spi_exec -array area "select areavdnome from area_avd where areavdoid = $obrigatorio" {
                    set valor_obrig $area(areavdnome)
                }
            }
            "22" - "23" { # 22: Ponto, 23: Grupo de ponto
                switch $status {
                    "1" { set status_t "Analisa se est� dentro" }
                    "2" { set status_t "Analisa se entrou" }
                    "3" { set status_t "Analisa se saiu" }
                    "4" { set status_t "Analisa se n�o est� em nenhum ponto" }
                    "7" { set status_t "Analisa se est� em qualquer ponto" }
                }
            }
            "24" { # motorista
                # no status vem o oid do motorista na tabela motorista pegar o nome do motorista e colocar no status_t
                spi_exec -array motorista "select motonome from motorista where motooid = $status" {
                    set valor_status $motorista(motonome)
                }
            }
            "30" - "31" { # 30: Hora inicio, 31: Hora fim
                set valor_status $status
                set sufixo "minutos"
            }
            "32" { 
                set valor_status $status
                set sufixo "segundos"
            }
            "33" { # hodometro
                set valor_status $status
                set sufixo "KM"
            }
            "34" { } # controle de rota TODO: implementar
            "35" - "36" - "52" {# 35: seguran�a de entrada, 36: seguran�a de saida, 52: Seguran�a da igni��o
                switch $status {
                    "1" { set status_t "Analisa em modo seguro" }
                    "2" { set status_t "Analisa fora de modo seguro" }
                    "3" { set status_t "Analisa mudan�a de modo" }
                }
            }
            "39" - "40" - "41" - "42" - "50" {
                # 39: limpador, 40: caixa marcha, 41: freio motor, 42: estado de sa�da, 50: Motor funcionando
                switch $status {
                    "1" { set status_t "Desligado" }
                    "2" { set status_t "Ligado" }
                    "3" { set status_t "Invers�o de estado" }
                }
            }
            "51" { set valor_status $status } # delta
        }
    }
}

if { $TIPO == "acao" } {
    foreach {atgoid_a grupo_a status_a obrigatorio_a} $ACAO {
        
        spi_exec -array atgdesc "select atgdescricao from atuador_grupo where atgoid = $atgoid_a" {
            set atgdescricao $atgdesc(atgdescricao)
        }

        switch $grupo_a {
            "5" { # Macro mtc600
                spi_exec -array macro "select mttdnome from macro_teclado_td50_virtual where mttdoid =$status_a and veioid = $TIPO" {
                    set valor_status $macro(mttdnome)
                }
            }
            "1" - "4" { # 1: Atuador, 4: Bloqueio
                switch $status_a {
                    "0" { set status_t "Desativado" }
                    "1" { set status_t "Ativado" }
                    "2" { set status_t "Inverte Estado"
                    }
                }
            }
            "6" { # audio mtc600
                switch $status_a {
                    "1"     { set status_t "In�cio de viagem" }
                    "2"     { set status_t "Fim de viagem" }
                    "3"     { set status_t "Ba� destravado" }
                    "4"     { set status_t "Ba� travado" }
                    "5"     { set status_t "Carreta desengatada" }
                    "6"     { set status_t "Carreta engatada" }
                    "7"     { set status_t "Entrada �rea de risco" }
                    "8"     { set status_t "Local autorizado" }
                    "9"     { set status_t "Local n�o autorizado" }
                    "10"    { set status_t "Mens. armazenada em mem�ria" }
                    "11"    { set status_t "Mens. enviada com sucesso" }
                    "12"    { set status_t "Portas abertas" }
                    "13"    { set status_t "Porta carona aberta" }
                    "14"    { set status_t "Porta motorista aberta" }
                    "15"    { set status_t "Nova coleta verifique mensagem" }
                    "16"    { set status_t "5a. roda liberada por 2 minutos" }
                    "17"    { set status_t "Necess�rio identica��o do motorista" }
                    "18"    { set status_t "Parada indevida" }
                    "19"    { set status_t "Sa�da �rea de risco" }
                    "20"    { set status_t "Desvio de rota" }
                    "21"    { set status_t "Sa�da de rota" }
                    "22"    { set status_t "Informe o motivo da parada" }
                    "23"    { set status_t "Movimento indevido" }
                    "24"    { set status_t "Entrar em contato com a central" }
                    "25"    { set status_t "Entrar em contato com a gerenciadora" }
                    "27"    { set status_t "Freada brusca" }
                    "28"    { set status_t "Modo rodoviario selecionado" }
                    "29"    { set status_t "Modo seguro ativado" }
                    "30"    { set status_t "Modo seguro desativado" }
                    "31"    { set status_t "Modo urbano selecionado" }
                    "32"    { set status_t "RPM auto" }
                    "33"    { set status_t "Verificar press�o do �leo" }
                    "34"    { set status_t "Verificar temperatura ba�" }
                    "35"    { set status_t "Verificar temperatura motor" }
                    "37"    { set status_t "Beep1" }
                    "38"    { set status_t "Beep2" }
                    "65532" { set status_t "Excesso de tempo parado" }
                    "65533" { set status_t "Reduza a velocidade" }
                    "65534" { set status_t "Mensagem nova" }
                }
            }
            "8" { # foto
                switch $status_a {
                    "1" { set status_t "Tirar Foto e Gravar" }
                    "2" { set status_t "Tirar Foto, Gravar e enviar foto" }
                }
                switch $obrigatorio_a {
                    "0" { set obrigatorio_t "Todas as Cameras" }
                    "1" { set obrigatorio_t "Camera 1" }
                    "2" { set obrigatorio_t "Camera 2" }
                    "3" { set obrigatorio_t "Camera 3" }
                    "4" { set obrigatorio_t "Camera 4" }
                }
            }
            "9" { # velocidade
                set valor_status $status_a
                set sufixo "(Km/h)"
                switch $obrigatorio_a {
                    "1" { set obrigatorio_t "M�xima Urbana" }
                    "2" { set obrigatorio_t "M�xima Rodovi�ria" }
                    "3" { set obrigatorio_t "M�ximo Urbano Chuva" }
                    "4" { set obrigatorio_t "M�ximo Rodovi�rio Chuva" }
                }
            }
            "10" { # tempo posicao
                set valor_status $status_a
                set sufixo "(s)"
                switch $obrigatorio_a {
                    "1" { set obrigatorio_t "Igni��o ligada gprs" }
                    "2" { set obrigatorio_t "Igni��o deligada gprs" }
                    "3" { set obrigatorio_t "Igni��o ligada satelital" }
                    "4" { set obrigatorio_t "Igni��o desligada satelital" }
                }
            }
            "11" { # logoff
                switch $status_a {
                    "1" { set status_t "Verificar" }
                }
            }
            "12" { # acao Cliente
                switch $status_a {
                    "1" { set status_t "Desativa" }
                    "2" { set status_t "Ativa" }
                }
            }
            "13" { # posicao
                switch $status_a {
                    "0" { set status_t "Guarda posi��o" }
                    "1" { set status_t "Sair do low power" }
                    "2" { set status_t "Envio por GPRS ou satelital" }
                }
            }
            "14" - "15" { # 14: zerar a�oes, 15: acoes final
                switch $status_a {
                    "1" { set status_t "Aciona" }
                }
            }
            "16" { # delta da telemetria
                switch $status_a {
                    "1" { set status_t "Inicia" }
                    "2" { set status_t "Fecha" }
                    "3" { set status_t "Inicia e Fecha" }
                }
            }
            "17" { # urbano Rodoviario
                switch $status_a {
                    "1" { set status_t "Rodovi�rio" }
                    "2" { set status_t "Urbano" }
                }
            }
            "18" - "19" - "22" { # 18: segentrada, # 19: segsaida
                switch $status_a {
                    "1" { set status_t "Fora de Modo Seguro" }
                    "2" { set status_t "Em Modo Seguro" }
                    "3" { set status_t "Mudan�a de Modo" }
                }
            }
            "20" { 
                set valor_status $status_a
                set sufixo "segundo(s)"
            }
            "21" { set valor_status $status_a }
            "2" { } # panico            TODO: implementar
            "3" { } # ignicao_desligada TODO: implementar
            "7" { } # texto_medio       TODO: implementar
        }
    }
}

set trad_atg ""
set trad_status ""
set trad_obrig ""

# Busca a tradu��o e insere em trad_atg se existir
if { $atgdescricao != "" } {
    set trad_atg "$atgdescricao*"
    spi_exec -array result "select tratraducao from traducao where traidioma='$IDIOMA' and tratag = '$atgdescricao'" {
        set trad_atg $result(tratraducao)
    }
}

# Se o status for um valor, traduza apenas o sufixo, se existir. Sen�o, busque a traducao se existir
if { $valor_status != "" } {
    set trad_status $valor_status
    if { $sufixo != "" } {
        set trad_sufixo "$sufixo*"
        spi_exec -array result "select tratraducao from traducao where traidioma='$IDIOMA' and tratag = '$sufixo'" {
            set trad_sufixo $result(tratraducao)
        }
        append trad_status " $trad_sufixo"
    }
} else {
    if { $status_t != "" } {
        set trad_status "$status_t*"
        spi_exec -array result "select tratraducao from traducao where traidioma='$IDIOMA' and tratag = '$status_t'" {
            set trad_status $result(tratraducao)
        }
    }
}

if { $valor_obrig != "" } {
    set trad_obrig $valor_obrig
} else {
    if { $obrigatorio_t != "" } {
        set trad_obrig "$obrigatorio_t*"
        spi_exec -array result "select tratraducao from traducao where traidioma='$IDIOMA' and tratag = '$obrigatorio_t'" {
            set trad_obrig $result(tratraducao)
        }
    }
}

set retorno [list $trad_atg $trad_status $trad_obrig]
return $retorno
$function$
;

COMMENT ON FUNCTION public.traducao_acao_embarcada(text,text,text,text) IS 'Traduz a acao embarcada de acordo com o idioma';
