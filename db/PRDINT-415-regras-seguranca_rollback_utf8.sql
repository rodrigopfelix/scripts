/**
  * História: PRDINT-415
  * Base: gerenciadora
  *
  * Script de rollback
  *
  */

----------------------------------------------------------------------------------------
--- Exclusão das novas traduções
----------------------------------------------------------------------------------------

delete from traducao where tratag = 'Desativado';
delete from traducao where tratag = 'Ativado';
delete from traducao where tratag = 'Inversão de Estado';
delete from traducao where tratag = 'Não Obrigatório';
delete from traducao where tratag = 'Obrigatório';
delete from traducao where tratag = 'Válido';
delete from traducao where tratag = 'Inválido';
delete from traducao where tratag = 'Falha GPS';
delete from traducao where tratag = 'Conectado';
delete from traducao where tratag = 'Desconectou';
delete from traducao where tratag = 'Verifica';
delete from traducao where tratag = 'Não Verifica Falha';
delete from traducao where tratag = 'Verifica Falha';
delete from traducao where tratag = 'Modo Satelital';
delete from traducao where tratag = 'Falha de comunicação da antena';
delete from traducao where tratag = 'Falta de sinal Satelital';
delete from traducao where tratag = 'Entrar em operação';
delete from traducao where tratag = 'Sair da operação';
delete from traducao where tratag = 'Estar em operação';
delete from traducao where tratag = 'Abaixo da temp mínimo';
delete from traducao where tratag = 'Entre o mínimo e o máximo';
delete from traducao where tratag = 'Acima temp máximo';
delete from traducao where tratag = 'Falha';
delete from traducao where tratag = 'Carga';
delete from traducao where tratag = 'Em uso';
delete from traducao where tratag = 'Alimentação OK';
delete from traducao where tratag = 'Sobre Tensão';
delete from traducao where tratag = 'Sob tensão';
delete from traducao where tratag = 'Verifica Urbano';
delete from traducao where tratag = 'Verifica Rodoviário';
delete from traducao where tratag = 'Verifica Desligado';
delete from traducao where tratag = 'Verifica Ligado';
delete from traducao where tratag = 'Verifica Inversão de Estado';
delete from traducao where tratag = 'Analisa se está dentro';
delete from traducao where tratag = 'Analisa se entrou';
delete from traducao where tratag = 'Analisa se saiu';
delete from traducao where tratag = 'Analisa se não está em nenhuma área';
delete from traducao where tratag = 'Analisa se está em qualquer área';
delete from traducao where tratag = 'Analisa se não está em nenhum ponto';
delete from traducao where tratag = 'Analisa se está em qualquer ponto';
delete from traducao where tratag = 'minutos';
delete from traducao where tratag = 'segundos';
delete from traducao where tratag = 'KM';
delete from traducao where tratag = 'Analisa em modo seguro';
delete from traducao where tratag = 'Analisa fora de modo seguro';
delete from traducao where tratag = 'Analisa mudança de modo';
delete from traducao where tratag = 'Desligado';
delete from traducao where tratag = 'Ligado';
delete from traducao where tratag = 'Inverte Estado';
delete from traducao where tratag = 'Início de viagem';
delete from traducao where tratag = 'Fim de viagem';
delete from traducao where tratag = 'Baú destravado';
delete from traducao where tratag = 'Baú travado';
delete from traducao where tratag = 'Carreta desengatada';
delete from traducao where tratag = 'Carreta engatada';
delete from traducao where tratag = 'Entrada área de risco';
delete from traducao where tratag = 'Local autorizado';
delete from traducao where tratag = 'Local não autorizado';
delete from traducao where tratag = 'Mens. armazenada em memória';
delete from traducao where tratag = 'Mens. enviada com sucesso';
delete from traducao where tratag = 'Portas abertas';
delete from traducao where tratag = 'Porta carona aberta';
delete from traducao where tratag = 'Porta motorista aberta';
delete from traducao where tratag = 'Nova coleta verifique mensagem';
delete from traducao where tratag = '5a. roda liberada por 2 minutos';
delete from traducao where tratag = 'Necessário identicação do motorista';
delete from traducao where tratag = 'Parada indevida';
delete from traducao where tratag = 'Saída área de risco';
delete from traducao where tratag = 'Desvio de rota';
delete from traducao where tratag = 'Saída de rota';
delete from traducao where tratag = 'Informe o motivo da parada';
delete from traducao where tratag = 'Movimento indevido';
delete from traducao where tratag = 'Entrar em contato com a central';
delete from traducao where tratag = 'Entrar em contato com a gerenciadora';
delete from traducao where tratag = 'Freada brusca';
delete from traducao where tratag = 'Modo rodoviario selecionado';
delete from traducao where tratag = 'Modo seguro ativado';
delete from traducao where tratag = 'Modo seguro desativado';
delete from traducao where tratag = 'Modo urbano selecionado';
delete from traducao where tratag = 'RPM auto';
delete from traducao where tratag = 'Verificar pressão do óleo';
delete from traducao where tratag = 'Verificar temperatura baú';
delete from traducao where tratag = 'Verificar temperatura motor';
delete from traducao where tratag = 'Beep1';
delete from traducao where tratag = 'Beep2';
delete from traducao where tratag = 'Excesso de tempo parado';
delete from traducao where tratag = 'Reduza a velocidade';
delete from traducao where tratag = 'Mensagem nova';
delete from traducao where tratag = 'Tirar Foto e Gravar';
delete from traducao where tratag = 'Tirar Foto, Gravar e enviar foto';
delete from traducao where tratag = 'Todas as Cameras';
delete from traducao where tratag = 'Camera 1';
delete from traducao where tratag = 'Camera 2';
delete from traducao where tratag = 'Camera 3';
delete from traducao where tratag = 'Camera 4';
delete from traducao where tratag = '(Km/h)';
delete from traducao where tratag = 'Máxima Urbana';
delete from traducao where tratag = 'Máxima Rodoviária';
delete from traducao where tratag = 'Máximo Urbano Chuva';
delete from traducao where tratag = 'Máximo Rodoviário Chuva';
delete from traducao where tratag = '(s)';
delete from traducao where tratag = 'Ignição ligada gprs';
delete from traducao where tratag = 'Ignição deligada gprs';
delete from traducao where tratag = 'Ignição ligada satelital';
delete from traducao where tratag = 'Ignição desligada satelital';
delete from traducao where tratag = 'Verificar';
delete from traducao where tratag = 'Desativa';
delete from traducao where tratag = 'Ativa';
delete from traducao where tratag = 'Guarda posição';
delete from traducao where tratag = 'Sair do low power';
delete from traducao where tratag = 'Envio por GPRS ou satelital';
delete from traducao where tratag = 'Aciona';
delete from traducao where tratag = 'Inicia';
delete from traducao where tratag = 'Fecha';
delete from traducao where tratag = 'Inicia e Fecha';
delete from traducao where tratag = 'Rodoviário';
delete from traducao where tratag = 'Urbano';
delete from traducao where tratag = 'Fora de Modo Seguro';
delete from traducao where tratag = 'Em Modo Seguro';
delete from traducao where tratag = 'Mudança de Modo';
delete from traducao where tratag = 'segundo(s)';
delete from traducao where tratag = 'Sensor Freio Estacionario';
delete from traducao where tratag = 'Affere 2.0';
delete from traducao where tratag = 'Antena Satelital';
delete from traducao where tratag = 'IBUTTON';
delete from traducao where tratag = 'Pânico';
delete from traducao where tratag = 'Ignição Ligada';
delete from traducao where tratag = 'Ignição Desligada';

----------------------------------------------------------------------------------------
--- Drop dos novos procedures
----------------------------------------------------------------------------------------

DROP FUNCTION public.traducao_acao_embarcada(text, text, text, text);
DROP FUNCTION public.relatorio_sequenciamento_macros(integer, text);

----------------------------------------------------------------------------------------
--- procedure relatorio_sequenciamento_macros
----------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION public.relatorio_sequenciamento_macros(integer)
 RETURNS integer
 LANGUAGE pltcl
AS $function$
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
						set queryCondicao "select traducao_acao_embarcada('condicao','$atgoid $grupo $status $obrigatorio','NULL') as condicao";
					} else {
						set queryCondicao "select traducao_acao_embarcada('condicao','$atgoid $grupo $status','NULL') as condicao";
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
					spi_exec -array aemacao "select traducao_acao_embarcada('acao','NULL','$atgoid $grupo $status $obrigatorio') as acao" {
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

CREATE OR REPLACE FUNCTION public.traducao_acao_embarcada(text, text, text)
 RETURNS text
 LANGUAGE pltcl
AS $function$
#$1 tipo
#$2 condicao
#$3 acao
 
set atgdescricao ""
set status_t ""
set obrigatorio_t ""
if { $1 == "condicao" } {
	foreach {atgoid grupo status obrigatorio} $2 {
		spi_exec -array atgdesc "select atgdescricao from atuador_grupo  where atgoid = $atgoid" {
			set atgdescricao $atgdesc(atgdescricao)
		}
		switch  $grupo {
			"1" { #Sensor
				switch  $status {
					"0" { 
						set status_t "Desativado"
					}
					"1" { 
						set status_t "Ativado"
					}
					"2" { 
						set status_t "Inversão de Estado"
					}
				}
				switch  $obrigatorio {
					"0" { 
						set obrigatorio_t "Não Obrigatório"
					}
					"1" { 
						set obrigatorio_t "Obrigatório"
					}
				}
			}
			"2" { #ignição
				switch  $status {
					"0" { 
						set status_t "Desativado"
					}
					"1" { 
						set status_t "Ativado"
					}
					"2" { 
						set status_t "Inversão de Estado"
					}
				}
				switch  $obrigatorio {
					"0" { 
						set obrigatorio_t "Não Obrigatório"
					}
					"1" { 
						set obrigatorio_t "Obrigatório"
					}
				}
			}
			"3" { #gps
				switch  $status {
					"1" {
						set status_t "Válido"
					}
					"2" {
						set status_t "Inválido"
					}
					"3" {
						set status_t "Falha GPS"
					}
				}
				set obrigatorio_t ""
			}
			"4" { #GPRS
				switch  $status {
					"1" {
						set status_t "Conectado"
					}
					"2" { 
						set status_t "Desconectou"
					}
				}
				set obrigatorio_t ""
			}
			"5" { #velocidade maxima
				switch  $status {
					"1" {
						set status_t "Verifica"
					}
					default {
						set status_t ""
					}
				}
				set obrigatorio_t ""
			}
			"6" { #panico
				switch  $status {
					"0" {
						set status_t "Desativado"
					}
					"1" {
						set status_t "Ativado"
					}
					"2" {
						set status_t "Inversão de Estado"
					}
				}
				switch  $obrigatorio {
					"0" {
						set obrigatorio_t "Não Obrigatório"
					}
					"1" {
						set obrigatorio_t "Obrigatório"
					}
				}
			}
			"7" { #saída
				switch  $status {
					"0" {
						set status_t "Desativado"
					}
					"1" {
						set status_t "Ativado"
					}
					"2" {
						set status_t "Inversão de Estado"
					}
				}
				switch  $obrigatorio {
					"0" {
						set obrigatorio_t "Não Obrigatório"
					}
					"1" {
						set obrigatorio_t "Obrigatório"
					}
				}
			}
			"8" { #teclado
				switch  $status {
					"0" {
						set status_t "Não Verifica Falha"
					}
					"1" {
						set status_t "Verifica Falha"
					}
				}
				set obrigatorio_t ""
			}
			"9" { #tempo parado
				switch  $status {
					"0" { 
						set status_t "Desativado"
					}
					"1" { 
						set status_t "Ativado"
					}
					"2" {
						set status_t "Inversão de Estado"
					}
				}
				set obrigatorio_t ""
			}
			"10" { #macro td50
				#select pelo nome da macro na tabela  macro_teclado_td50 virtual;
				#pegar nome e imprimir no nome do status olhar documentação para query; pag 3
				spi_exec -array macro "select mttdnome from macro_teclado_td50_virtual where mttdoid =$status and veioid = $1" {
					set status_t $macro(mttdnome)
				}
				set obrigatorio_t ""
			}
			"11" { #satelital
				switch  $status {
					"1" {
						set status_t "Modo Satelital"
					}
					"2" {
						set status_t "Falha de comunicação da antena"
					}
					"3" {
						set status_t "Falta de sinal Satelital"
					}
				}
				set obrigatorio_t ""
			}
			"12" { #operação
				switch  $status {
					"1" {
						set status_t "Entrar em operação"
					}
					"2" {
						set status_t "Sair da operação"
					}
					"3" {
						set status_t "Estar em operação"
					}
				}
				set obrigatorio_t ""
			}
			"13" { #temperatura 1
				switch  $status {
					"1" {
						set status_t "Abaixo da temp Mínimo"
					}
					"2" {
						set status_t "Entre o mínimo e o máximo"
					}
					"3" {
						set status_t "Acima temp máximo"
					}
				}
				switch  $obrigatorio {
					"0" {
						set obrigatorio_t "Não obrigatório"
					}
					"1" {
						set obrigatorio_t "Obrigatório"
					}
				}
			}
			"14" { #temperatura 2
				switch  $status {
					"1" {
						set status_t "Abaixo da temp Mínimo"
					}
					"2" {
						set status_t "Entre o mínimo e o máximo"
					}
					"3" {
						set status_t "Acima temp máximo"
					}
				}
				switch  $obrigatorio {
					"0" {
						set obrigatorio_t "Não obrigatório"
					}
					"1" {
						set obrigatorio_t "Obrigatório"
					}
				}
			}
			"15" { #temperatura 3
				switch  $status {
					"1" {
						set status_t "Abaixo da temp Mínimo"
					}
					"2" {
						set status_t "Entre o mínimo e o máximo"
					}
					"3" {
						set status_t "Acima temp máximo"
					}
				}
				switch  $obrigatorio {
					"0" {
						set obrigatorio_t "Não obrigatório"
					}
					"1" {
						set obrigatorio_t "Obrigatório"
					}
				}
			}
			"16" { #Bateria interna
				switch  $status {
					"1" {
						set status_t "Falha "
					}
					"2" {
						set status_t "Carga"
					}
					"3" {
						set status_t "Em uso"
					}
				}
				set obrigatorio_t ""
			}
			"17" { #Bateria externa
				switch  $status {
					"1" { 
						set status_t "Falha "
					}
					"2" { 
						set status_t "Carga" 
					}
					"3" { 
						set status_t "Em uso"
					}
				}
				set obrigatorio_t ""
			}
			"18" { #alimentação de ene
				switch  $status {
					"1" { 
						set status_t "Alimentação OK"
					}
					"2" { 
						set status_t "Sobre Tensão"
					}
					"3" { 
						set status_t "Sob tensão"
					}
				}
				set obrigatorio_t ""
			}
			"19" { #Urbano / Rodoviario
				switch  $status {
					"1" { 
						set status_t "Verifica Urbano"
					}
					"2" { 
						set status_t "Verifica Rodoviário"
					}
				}
				set obrigatorio_t ""
			}
			"20" { #
				switch  $status {
					"1" { 
						set status_t "Verifica Desligado"
					}
					"2" { 
						set status_t "Verifica Ligado"
					}
					"3" { 
						set status_t "Verifica Inversão de Estado"
					}
				}
				set obrigatorio_t "&nbsp"
			}
			"21" { #área embarcada
				switch  $status {
					"1" { 
						set status_t "Analisa se está dentro"
					}
					"2" { 
						set status_t "Analisa se entrou"
					}
					"3" {
						set status_t "Analisa se saiu"
					}
					"4" { 
						set status_t "Analisa se não está em nenhuma área"
					}
					"7" { 
						set status_t "Analisa se está em qualquer área"
					}
				}
				#procurar na query onde o id da a
				#na var
				spi_exec -array area "select areavdnome from area_avd where areavdoid = $obrigatorio" {
					set obrigatorio_t $area(areavdnome)
				}
			}
			"22" { #ponto
				switch  $status {
					"1" { 
						set status_t "Analisa se está dentro"
					}
					"2" { 
						set status_t "Analisa se entrou"
					}
					"3" { 
						set status_t "Analisa se saiu"
					}
					"4" { 
						set status_t "Analisa se não está em nenhum ponto"
					}
					"7" { 
						set status_t "Analisa se está em qualquer ponto"
					}
				}
				#marcio tem que lembrar como faz
			}
			"23" { #grupo de ponto
				switch  $status {
					"1" { 
						set status_t "Analisa se está dentro"
					}
					"2" {
						set status_t "Analisa se entrou"
					}
					"3" { 
						set status_t "Analisa se saiu"
					}
					"4" { 
						set status_t "Analisa se não está em nenhum ponto"
					}
					"7" { 
						set status_t "Analisa se está em qualquer ponto"
					}
				}
				#marcio tem que lembrar como faz
			}
			"24" { #motorista
				#no status vem o oid do motorista na tabela motorista pegar o nome do motorista e colocar no status_t
				spi_exec -array motorista "select motonome from motorista where motooid = $status" {
				set status_t $motorista(motonome)
				}
				set obrigatorio_t ""
			}
			"25" {#login 
				switch  $status {
					"1" { 
						set status_t "Verifica"
					}
					default {
						set status_t ""
					}
				}
				set obrigatorio_t ""
			}
			"26" { #logof
				switch  $status {
					"1" { 
						set status_t "Verifica"
					}
					default {
						set status_t ""
					}
				}
				set obrigatorio_t ""
			}
			"27" { # Manobra
				switch  $status {
					"1" { 
						set status_t "Verifica"
					}
					default {
						set status_t ""
					}
				}
				set obrigatorio_t ""
			}
			"28" { #Gestor
				switch  $status {
					"1" { 
						set status_t "Verifica"
					}
					default {
					set status_t ""
					}
				}
				set obrigatorio_t ""
			}
			"29" { #Coação
				switch  $status {
					"1" { 
						set status_t "Verifica"
					}
					default {
						set status_t ""
					}
				}
				set obrigatorio_t ""
			}
			"30" { #Hora inicio
				set status_t "$status minutos"
				set obrigatorio_t ""
			}
			"31" { #hora fim
				set status_t "$status minutos"
				set obrigatorio_t ""
			}
			"32" {
				set status_t "$status segundos"
				set obrigatorio_t ""
			}
			"33" { #hodometro
				set status_t "$status KM"
				set obrigatorio_t ""
			}
			"34" { #controle de rota
				#não foi implementado
			}
			"35" { #segurança de entrada
				switch  $status {
					"1" { 
						set status_t "Analisa em modo seguro"
					}
					"2" { 
						set status_t "Analisa fora de modo seguro"
					}
					"3" { 
						set status_t "Analisa mudança de modo"
					}
				}
				set obrigatorio_t ""
			}
			"36" { #segurança de saida
				switch  $status {
					"1" { 
						set status_t "Analisa em modo seguro"
					}
					"2" { 
						set status_t "Analisa fora de modo seguro"
					}
					"3" { 
						set status_t "Analisa mudança de modo"
					}
				}
				set obrigatorio_t ""
			}
			"37" { #falha de pressão de oleo
				switch  $status {
					"1" { 
						set status_t "Verifica"
					}
					default {
						set status_t ""
					}
				}
				set obrigatorio_t ""
			}
			"38" { #embreagem
				switch  $status {
					"1" { 
						set status_t "Verifica"
					}
					default {
						set status_t ""
					}
				}
				set obrigatorio_t ""
			}
			"39" { #limpador
				switch  $status {
					"1" { 
						set status_t "Desligado"
					}
					"2" { 
						set status_t "Ligado"
					}
					"3" { 
						set status_t "Inversão de estado"
					}
				}
				set obrigatorio_t ""
			}
			"40" { #caixa marcha
				switch  $status {
					"1" { 
						set status_t "Desligado"
					}
					"2" { 
						set status_t "Ligado"
					}
					"3" { 
						set status_t "Inversão de estado"
					}
				}
				set obrigatorio_t ""
			}
			"41" { #freio motor
				switch  $status {
					"1" { 
						set status_t "Desligado"
					}
					"2" { 
						set status_t "Ligado"
					}
					"3" { 
						set status_t "Inversão de estado"
					}
				}
				set obrigatorio_t "" 
			}
			"42" { #estado de saída
				switch  $status {
					"1" { 
						set status_t  "Desligado"
					}
					"2" { 
						set status_t  "Ligado"
					}
					"3" { 
						set status_t "Inversão de estado"
					}
				}
				set obrigatorio_t ""
			}
			"43" { #Banguela
				switch  $status {
					"1" { 
						set status_t "Verifica"
					}
					default {
						set status_t ""
					}
				}
				set obrigatorio_t ""
			}
			"44" { #ignição sem giro
				switch  $status {
					"1" { 
						set status_t "Verifica"
					}
					default {
						set status_t ""
					}
				}
				set obrigatorio_t ""
			}
			"45" { #Marcha lenta
				switch  $status {
					"1" { 
						set status_t "Verifica"
					}
					default {
						set status_t ""
					}
				}
				set obrigatorio_t ""
			}
			"46" { # excesso de velocidade
				switch  $status {
					"1" { 
						set status_t "Verifica"
					}
					default {
						set status_t ""
					}
				}
				set obrigatorio_t ""
			}
			"47" { #excesso de rotação
				switch  $status {
					"1" { 
						set status_t "Verifica"
					}
					default {
						set status_t ""
					}
				}
				set obrigatorio_t ""
			}
			"48" { #Falha de temperatura no liquido de arrefecimento
				switch  $status {
					"1" { 
						set status_t "Verifica"
					}
					default {
						set status_t ""
					}
				}
				set obrigatorio_t ""
			}
			"49" { #tensão do alternador
				switch  $status {
					"1" { 
						set status_t "Verifica"
					}
					default {
						set status_t ""
					}
				}
				set obrigatorio_t ""
			}
			"50" { #Motor funcionando
				switch  $status {
					"1" { 
						set status_t "Desligado"
					}
					"2" { 
						set status_t "Ligado"
					}
					"3" { 
						set status_t "Inversão de estado"
					}
				}
				set obrigatorio_t "" 
			}
			"51" { #delta
				set status_t "$status"
				set obrigatorio_t "" 
			}
			"52" { #Segurança da ignição
				switch  $status {
					"1" { 
						set status_t "Analisa em modo seguro"
					}
					"2" { 
						set status_t "Analisa fora de modo seguro"
					}
					"3" { 
						set status_t "Analisa mudança de modo"
					}
				}
				set obrigatorio_t ""
			}
			"53" { #Bloqueio
				switch  $status {
					"0" { 
						set status_t "Desativado"
					}
					"1" { 
						set status_t "Ativado"
					}
					"2" { 
						set status_t "Inversão de Estado"
					}
				}
				switch  $obrigatorio {
					"0" { 
						set obrigatorio_t "Não Obrigatório"
					}
					"1" { 
						set obrigatorio_t "Obrigatório"
					}
				}
			}
		}

	}
}
if { $1 == "acao" } {
	foreach {atgoid_a grupo_a status_a obrigatorio_a} $3 {
	spi_exec -array atgdesc "select atgdescricao from atuador_grupo  where atgoid = $atgoid_a" {
			set atgdescricao $atgdesc(atgdescricao)
		}
		switch  $grupo_a {
      			"1" { #atuador
           			switch  $status_a {
					"0" { 
                         			set status_t "Desativado"
                      			}
                     			"1" {
                          			set status_t "Ativado"
                      			}
					"2" {
						set status_t "Inverte Estado"
					}


                   			

            			}
            			switch  $obrigatorio_a {
                    			"1" { 
                         			set obrigatorio_t ""     
                    			}
            			}
			}

			"2" { #panico
				set status_t ""
				set obrigatorio_t ""
				#a implementar
			}
			"3" { #ignicao_desligada
				set status_t ""
				set obrigatorio_t ""
				#há implementar
			}
			"4" { #bloqueio
				switch  $status_a {
					"0" { 
						set status_t "Desativado"
					}
					"1" { 
						set status_t "Ativado"
					}
					"2" {
						set status_t "Inverte Estado"
					}					


				}
				switch  $obrigatorio_a {
					"1" { 
						set obrigatorio_t ""
					}
				}
			}
			"5" { #Macro mtc600
				spi_exec -array macro "select mttdnome from macro_teclado_td50_virtual where mttdoid =$status_a and veioid = $1" {
					set status_t $macro(mttdnome)
				}
				set obrigatorio_t ""
			}
			"6" { #audio mtc600
				switch  $status_a {
					"1" { 
						set status_t "Início de viagem"
					}
					"2" { 
						set status_t "Fim de viagem"
					}
					"3" { 
						set status_t "Baú destravado"
					}
					"4" { 
						set status_t "Baú travado"
					}
					"5" { 
						set status_t "Carreta desengatada"
					}
					"6" { 
						set status_t "Carreta engatada"
					}
					"7" { 
						set status_t "Entrada área de risco"
					}
					"8" { 
						set status_t "Local autorizado"
					}
					"9" { 
						set status_t "Local não autorizado"
					}
					"10" { 
						set status_t "Mens. armazenada em memória"
					}
					"11" {
						set status_t "Mens. enviada com sucesso"
					}
					"12" { 
						set status_t "Portas abertas"
					}
					"13" { 
						set status_t "Porta carona aberta"
					}
					"14" { 
						set status_t "Porta motorista aberta"     
					}
					"15" { 
						set status_t "Nova coleta verifique mensagem"     
					}
					"16" { 
						set status_t "5a. roda liberada por 2 minutos"     
					}
					"17" { 
						set status_t "Necessário identicação do motorista"     
					}
					"18" { 
						set status_t "Parada indevida"     
					}
					"19" { 
						set status_t "Saída área de risco"     
					}
					"20" { 
						set status_t "Desvio de rota"     
					}
					"21" { 
						set status_t "Saída de rota"     
					}
					"22" { 
						set status_t "Informe o motivo da parada"     
					}
					"23" { 
						set status_t "Movimento indevido"     
					}
					"24" { 
						set status_t "Entrar em contato com a central"     
					}
					"25" { 
						set status_t "Entrar em contato com a gerenciadora"     
					}
					"27" { 
						set status_t "Freada brusca"     
					}
					"28" { 
						set status_t "Modo rodoviario selecionado"     
					}
					"29" { 
						set status_t "Modo seguro ativado"     
					}
					"30" { 
						set status_t "Modo seguro desativado"     
					}
					"31" { 
						set status_t "Modo urbano selecionado"     
					}
					"32" { 
						set status_t "RPM auto"     
					}
					"33" { 
						set status_t "Verificar pressão do óleo"     
					}
					"34" { 
						set status_t "Verificar temperatura baú"     
					}
					"35" { 
						set status_t "Verificar temperatura motor"     
					}
					"36" { 
						set status_t "Banguela"
					}
					"37" { 
						set status_t "Beep1"     
					}
					"38" { 
						set status_t "Beep2"     
					}
					"65532" { 
						set status_t "Excesso de tempo parado"     
					}
					"65533" { 
						set status_t "Reduza a velocidade"     
					}
					"65534" { 
						set status_t "Mensagem nova"
					}
				}
				set obrigatorio_t ""
			}
			"7" { #texto_medio
				set status_t ""
				set obrigatorio_t ""
			}
			"8" { #foto
				switch  $status_a {
					"1" { 
						set status_t "Tirar Foto e Gravar"     
					}
					"2" { 
						set status_t "Tirar Foto, Gravar e enviar foto"     
					}
				}
				switch  $obrigatorio_a {
					"0" { 
						set obrigatorio_t "Todas as Cameras "
					}
					"1" { 
						set obrigatorio_t "Camera 1"     
					}
					"2" { 
						set obrigatorio_t "Camera 2"     
					}
					"3" { 
						set obrigatorio_t "Camera 3"     
					}
					"4" { 
						set obrigatorio_t "Camera 4"     
					}
				}    
			}
			"9" { #velocidade
				set status_t "$status_a"
				append status_t " (Km/h)"

				set obrigatorio_t ""
				switch  $obrigatorio_a {
					"1" { 
						set obrigatorio_t "Máxima Urbana"
					}
					"2" { 
						set obrigatorio_t "Máxima Rodoviária"
					}
					"3" { 
						set obrigatorio_t "Máximo Urbano Chuva"
					}
					"4" { 
						set obrigatorio_t "Máximo Rodoviário Chuva"
					}
				}
			}
			"10" { #tempo posicao
				set status_t "$status_a"
				append status_t " (s)"
				set obrigatorio_t ""
				switch $obrigatorio_a {
					"1" { 
						set obrigatorio_t "Ignição ligada gprs"     
					}
					"2" { 
						set obrigatorio_t "Ignição deligada gprs"     
					}
					"3" { 
						set obrigatorio_t "Ignição ligada satelital"     
					}
					"4" { 
						set obrigatorio_t "Ignição desligada satelital"     
					}
				}
			}
			"11" { #logoff
				switch  $status_a {
					"1" { 
						set status_t "Verificar"
					}
				}
				set obrigatorio_t ""
			}
			"12" { #acao Cliente
				switch  $status_a {
					"1" { 
						set status_t "Desativa"
					}
					"2" { 
						set status_t "Ativa"
					}
				}
				set obrigatorio_t ""
			}
			"13" { #posicao
				switch  $status_a {
					"0" { 
						set status_t "Guarda posição"
					}
					"1" { 
						set status_t "Sair do low power"     
					}
					"2" { 
						set status_t "Envio por GPRS ou satelital"     
					}
				}
				set obrigatorio_t ""    
			}
			"14" { #zerar açoes
				switch  $status_a {
					"1" { 
						set status_t "Aciona" 
					}
				}
				set obrigatorio_t ""
			}
			"15" { #acoes final
				switch  $status_a {
					"1" { 
						set status_t "Aciona"
					}
				}
				set obrigatorio_t ""   
			}
			"16" { #delta da telemetria
				switch  $status_a {
					"1" { 
						set status_t "Inicia" 
					}
					"2" { 
						set status_t "Fecha"
					}
					"3" { 
						set status_t "Inicia e Fecha"
					}
				}
				set obrigatorio_t ""
			}
			"17" { #urbano Rodoviario
				switch  $status_a {
					"1" { 
						set status_t "Rodoviário"
					}
					"2" { 
						set status_t "Urbano"
					}
				}
				set obrigatorio_t ""
			}
			"18" { #segentrada
				switch  $status_a {
					"1" { 
						set status_t "Fora de Modo Seguro"
					}
					"2" { 
						set status_t "Em Modo Seguro"
					}
					"3" { 
						set status_t "Mudança de Modo"
					}
				}
				set obrigatorio_t ""
			}
			"19" { #segsaida
				switch  $status_a {
					"1" { 
						set status_t "Fora de Modo Seguro"
					}
					"2" { 
						set status_t "Em Modo Seguro"
					}
					"3" { 
						set status_t "Mudança de Modo"
					}
				}
				set obrigatorio_t ""
			}
			"20" { 
				set status_t "$status_a segundo(s)"
				set obrigatorio_t ""
			}
			"21" { 
				set status_t "$status_a"
				set obrigatorio_t ""
			}
			"22" { 
				switch  $status_a {
					"1" { 
						set status_t "Fora de Modo Seguro"
					}
					"2" { 
						set status_t "Em Modo Seguro"
					}
					"3" { 
						set status_t "Mudança de Modo"
					}
				}
				set obrigatorio_t "" 
			}
		}
	}
   }
set l [list $atgdescricao $status_t $obrigatorio_t]
return $l
$function$
;

COMMENT ON FUNCTION public.traducao_acao_embarcada(text,text,text) IS 'traduz acao embarcada';
