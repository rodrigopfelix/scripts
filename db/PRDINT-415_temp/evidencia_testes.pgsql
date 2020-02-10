select 
    traducao_acao_embarcada('condicao', '249 35 2 0', '', 'es_AR') as teste1,
    traducao_acao_embarcada('condicao', '249 52 2 0', '', 'es_AR') as teste2,
    traducao_acao_embarcada('acao', '', '249 2 1 1', 'es_AR') as teste3,
    traducao_acao_embarcada('condicao', '249 30 25 0', '', 'es_AR') as teste4,
    traducao_acao_embarcada('condicao', '250 25 2 0', '', 'es_AR') as teste5,
    traducao_acao_embarcada('condicao', '250 25 1 0', '', 'es_AR') as teste6,
    traducao_acao_embarcada('condicao', '250 24 64 0', '', 'es_AR') as teste7,
    traducao_acao_embarcada('condicao', '250 21 4 38289', '', 'es_AR') as teste8,
    traducao_acao_embarcada('condicao', '250 1 1 1', '', 'es_AR') as teste9,
    traducao_acao_embarcada('condicao', '204 14 2 0', '', 'es_AR') as teste10,
    traducao_acao_embarcada('acao', '', '209 1 2 0', 'es_AR') as teste11,
    traducao_acao_embarcada('acao', '', '209 6 10 0', 'es_AR') as teste12,
    traducao_acao_embarcada('acao', '', '209 9 160 4', 'es_AR') as teste13,
    traducao_acao_embarcada('acao', '', '209 10 4 1', 'es_AR') as teste14,
    traducao_acao_embarcada('acao', '', '209 21 88 1', 'es_AR') as teste15;

select 
    traducao_acao_embarcada('condicao', '249 35 2 0', '') as teste1,
    traducao_acao_embarcada('condicao', '249 52 2 0', '') as teste2,
    traducao_acao_embarcada('acao', '', '249 2 1 1') as teste3,
    traducao_acao_embarcada('condicao', '249 30 25 0', '') as teste4,
    traducao_acao_embarcada('condicao', '250 25 2 0', '') as teste5,
    traducao_acao_embarcada('condicao', '250 25 1 0', '') as teste6,
    traducao_acao_embarcada('condicao', '250 24 64 0', '') as teste7,
    traducao_acao_embarcada('condicao', '250 21 4 38289', '') as teste8,
    traducao_acao_embarcada('condicao', '250 1 1 1', '') as teste9,
    traducao_acao_embarcada('condicao', '204 14 2 0', '') as teste10,
    traducao_acao_embarcada('acao', '', '209 1 2 0') as teste11,
    traducao_acao_embarcada('acao', '', '209 6 10 0') as teste12,
    traducao_acao_embarcada('acao', '', '209 9 160 4') as teste13,
    traducao_acao_embarcada('acao', '', '209 10 4 1') as teste14,
    traducao_acao_embarcada('acao', '', '209 21 88 1') as teste15;

select 
    traducao_acao_embarcada('condicao', '249 35 2 0', '', 'pt_BR') as teste1,
    traducao_acao_embarcada('condicao', '249 52 2 0', '', 'pt_BR') as teste2,
    traducao_acao_embarcada('acao', '', '249 2 1 1', 'pt_BR') as teste3,
    traducao_acao_embarcada('condicao', '249 30 25 0', '', 'pt_BR') as teste4,
    traducao_acao_embarcada('condicao', '250 25 2 0', '', 'pt_BR') as teste5,
    traducao_acao_embarcada('condicao', '250 25 1 0', '', 'pt_BR') as teste6,
    traducao_acao_embarcada('condicao', '250 24 64 0', '', 'pt_BR') as teste7,
    traducao_acao_embarcada('condicao', '250 21 4 38289', '', 'pt_BR') as teste8,
    traducao_acao_embarcada('condicao', '250 1 1 1', '', 'pt_BR') as teste9,
    traducao_acao_embarcada('condicao', '204 14 2 0', '', 'pt_BR') as teste10,
    traducao_acao_embarcada('acao', '', '209 1 2 0', 'pt_BR') as teste11,
    traducao_acao_embarcada('acao', '', '209 6 10 0', 'pt_BR') as teste12,
    traducao_acao_embarcada('acao', '', '209 9 160 4', 'pt_BR') as teste13,
    traducao_acao_embarcada('acao', '', '209 10 4 1', 'pt_BR') as teste14,
    traducao_acao_embarcada('acao', '', '209 21 88 1', 'pt_BR') as teste15;

-- --TESTExRESULTADO ANTES
-- [
--   {
--     "teste1": "{Sensor Bau} {Analisa fora de modo seguro} {}",
--     "teste2": "{Sensor Bau} {Analisa fora de modo seguro} {}",
--     "teste3": "{Sensor Bau} {} {}",
--     "teste4": "{Sensor Bau} {25 minutos} {}",
--     "teste5": "{Sensor Bau Lateral} {} {}",
--     "teste6": "{Sensor Bau Lateral} Verifica {}",
--     "teste7": "{Sensor Bau Lateral} {Andre Camargo Filho} {}",
--     "teste8": "{Sensor Bau Lateral} {Analisa se não está em nenhuma área} {PLANTA TOYOTA ZARATE}",
--     "teste9": "{Sensor Bau Lateral} Ativado Obrigatório",
--     "teste10": "{Sensor Umidade e Temperatura} {Entre o mínimo e o máximo} {Não obrigatório}",
--     "teste11": "{Sensor Caracol} {Inverte Estado} {}",
--     "teste12": "{Sensor Caracol} {Mens. armazenada em memória} {}",
--     "teste13": "{Sensor Caracol} {160 (Km/h)} {Máximo Rodoviário Chuva}",
--     "teste14": "{Sensor Caracol} {4 (s)} {Ignição ligada gprs}",
--     "teste15": "{Sensor Caracol} 88 {}"
--   }
-- ]

-- --TESTExRESULTADO DEPOIS pt_BR 3 param
-- [
--   {
--     "teste1": "{Sensor Bau} {Analisa fora de modo seguro} {}",
--     "teste2": "{Sensor Bau} {Analisa fora de modo seguro} {}",
--     "teste3": "{Sensor Bau} {} {}",
--     "teste4": "{Sensor Bau} {25 minutos} {}",
--     "teste5": "{Sensor Bau Lateral} {} {}",
--     "teste6": "{Sensor Bau Lateral} Verifica {}",
--     "teste7": "{Sensor Bau Lateral} {Andre Camargo Filho} {}",
--     "teste8": "{Sensor Bau Lateral} {Analisa se não está em nenhuma área} {PLANTA TOYOTA ZARATE}",
--     "teste9": "{Sensor Bau Lateral} Ativado Obrigatório",
--     "teste10": "{Sensor Umidade e Temperatura} {Entre o mínimo e o máximo} {Não obrigatório}",
--     "teste11": "{Sensor Caracol} {Inverte Estado} {}",
--     "teste12": "{Sensor Caracol} {Mens. armazenada em memória} {}",
--     "teste13": "{Sensor Caracol} {160 (Km/h)} {Máximo Rodoviário Chuva}",
--     "teste14": "{Sensor Caracol} {4 (s)} {Ignição ligada gprs}",
--     "teste15": "{Sensor Caracol} 88 {}"
--   }
-- ]

-- --TESTExRESULTADO DEPOIS pt_BR 4 param
-- [
--   {
--     "teste1": "{Sensor Bau} {Analisa fora de modo seguro} {}",
--     "teste2": "{Sensor Bau} {Analisa fora de modo seguro} {}",
--     "teste3": "{Sensor Bau} {} {}",
--     "teste4": "{Sensor Bau} {25 minutos} {}",
--     "teste5": "{Sensor Bau Lateral} {} {}",
--     "teste6": "{Sensor Bau Lateral} Verifica {}",
--     "teste7": "{Sensor Bau Lateral} {Andre Camargo Filho} {}",
--     "teste8": "{Sensor Bau Lateral} {Analisa se não está em nenhuma área} {PLANTA TOYOTA ZARATE}",
--     "teste9": "{Sensor Bau Lateral} Ativado Obrigatório",
--     "teste10": "{Sensor Umidade e Temperatura} {Entre o mínimo e o máximo} {Não obrigatório}",
--     "teste11": "{Sensor Caracol} {Inverte Estado} {}",
--     "teste12": "{Sensor Caracol} {Mens. armazenada em memória} {}",
--     "teste13": "{Sensor Caracol} {160 (Km/h)} {Máximo Rodoviário Chuva}",
--     "teste14": "{Sensor Caracol} {4 (s)} {Ignição ligada gprs}",
--     "teste15": "{Sensor Caracol} 88 {}"
--   }
-- ]

-- --TESTExRESULTADO DEPOIS es_AR
-- [
--   {
--     "teste1": "{Sensor Baúl} X {}",
--     "teste2": "{Sensor Baúl} X {}",
--     "teste3": "{Sensor Baúl} {} {}",
--     "teste4": "{Sensor Baúl} {25 minutos} {}",
--     "teste5": "{Sensor Baúl Lateral} {} {}",
--     "teste6": "{Sensor Baúl Lateral} X {}",
--     "teste7": "{Sensor Baúl Lateral} {Andre Camargo Filho} {}",
--     "teste8": "{Sensor Baúl Lateral} X {PLANTA TOYOTA ZARATE}",
--     "teste9": "{Sensor Baúl Lateral} Activado X",
--     "teste10": "{Sensor de humedad y temperatura} X {Não obrigatório*}",
--     "teste11": "{Sensor Caracol} X {}",
--     "teste12": "{Sensor Caracol} {Mensaje almacenado em la memoria} {}",
--     "teste13": "{Sensor Caracol} {160 X} X",
--     "teste14": "{Sensor Caracol} {4 X} X",
--     "teste15": "{Sensor Caracol} 88 {}"
--   }
-- ]

-- DROP FUNCTION public.traducao_acao_embarcada(text,text,text);

DROP FUNCTION public.traducao_acao_embarcada(text, text, text, text);
DROP FUNCTION public.relatorio_sequenciamento_macros(text, text, text, text);


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
				# 1: Sensor, 2: Ignição, 6: Panico, 7: Saída, 9: Tempo parado, 53: Bloqueio
				switch $status {
					"0" { set status_t "Desativado" }
					"1" { set status_t "Ativado" }
					"2" { set status_t "Inversão de Estado" }
				}
				if { $grupo != 9 } {
					switch $obrigatorio {
						"0" { set obrigatorio_t "Não Obrigatório" }
						"1" { set obrigatorio_t "Obrigatório" }
					}
				}
			}
			"3" { # gps
				switch $status {
					"1" { set status_t "Válido" }
					"2" { set status_t "Inválido" }
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
				# 5: Velocidade maxima, 25: Login, 26: Logoff, 27: Manobra, 28: Gestor, 29: Coação
				# 37: Falha de pressão de oleo, 38: Embreagem, 43: Banguela, 44: Ignição sem giro
				# 45: Marcha lenta, 46: Excesso de velocidade, 47: Excesso de rotação
				# 48: Falha de temperatura no liquido de arrefecimento, 49: Tensão do alternador
				switch $status {
					"1" { set status_t "Verifica" }
				}
			}
			"8" { # teclado
				switch $status {
					"0" { set status_t "Não Verifica Falha" }
					"1" { set status_t "Verifica Falha" }
				}
			}
			"10" { # macro td50 
				# TODO: implementar - a implementacao foi comentada por estar com erro
				# select pelo nome da macro na tabela  macro_teclado_td50 virtual
				# pegar nome e imprimir no nome do status olhar documentação para query pag 3
				# spi_exec -array macro "select mttdnome from macro_teclado_td50_virtual where mttdoid =$status and veioid = $TIPO" {
				#	set valor_status $macro(mttdnome)
				# }
			}
			"11" { # satelital
				switch $status {
					"1" { set status_t "Modo Satelital" }
					"2" { set status_t "Falha de comunicação da antena" }
					"3" { set status_t "Falta de sinal Satelital" }
				}
			}
			"12" { # operação
				switch $status {
					"1" { set status_t "Entrar em operação" }
					"2" { set status_t "Sair da operação" }
					"3" { set status_t "Estar em operação" }
				}
			}
			"13" - "14" - "15" { # 13: Temperatura 1, 14: Temperatura 2, 15: Temperatura 3
				switch $status {
					"1" { set status_t "Abaixo da temp mínimo" }
					"2" { set status_t "Entre o mínimo e o máximo" }
					"3" { set status_t "Acima temp máximo" }
				}
				switch $obrigatorio {
					"0" { set obrigatorio_t "Não obrigatório" }
					"1" { set obrigatorio_t "Obrigatório" }
				}
			}
			"16" - "17" { # 16: Bateria interna, 17: Bateria externa
				switch $status {
					"1" { set status_t "Falha" }
					"2" { set status_t "Carga" }
					"3" { set status_t "Em uso" }
				}
			}
			"18" { # alimentação de ene
				switch $status {
					"1" { set status_t "Alimentação OK" }
					"2" { set status_t "Sobre Tensão" }
					"3" { set status_t "Sob tensão" }
				}
			}
			"19" { # Urbano / Rodoviario
				switch $status {
					"1" { set status_t "Verifica Urbano" }
					"2" { set status_t "Verifica Rodoviário" }
				}
			}
			"20" {
				switch $status {
					"1" { set status_t "Verifica Desligado" }
					"2" { set status_t "Verifica Ligado" }
					"3" { set status_t "Verifica Inversão de Estado" }
				}
			}
			"21" { # área embarcada
				switch $status {
					"1" { set status_t "Analisa se está dentro" }
					"2" { set status_t "Analisa se entrou" }
					"3" { set status_t "Analisa se saiu" }
					"4" { set status_t "Analisa se não está em nenhuma área" }
					"7" { set status_t "Analisa se está em qualquer área" }
				}
				# procurar na query onde o id da a na var
				spi_exec -array area "select areavdnome from area_avd where areavdoid = $obrigatorio" {
					set valor_obrig $area(areavdnome)
				}
			}
			"22" - "23" { # 22: Ponto, 23: Grupo de ponto
				switch $status {
					"1" { set status_t "Analisa se está dentro" }
					"2" { set status_t "Analisa se entrou" }
					"3" { set status_t "Analisa se saiu" }
					"4" { set status_t "Analisa se não está em nenhum ponto" }
					"7" { set status_t "Analisa se está em qualquer ponto" }
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
			"35" - "36" - "52" {# 35: segurança de entrada, 36: segurança de saida, 52: Segurança da ignição
				switch $status {
					"1" { set status_t "Analisa em modo seguro" }
					"2" { set status_t "Analisa fora de modo seguro" }
					"3" { set status_t "Analisa mudança de modo" }
				}
			}
			"39" - "40" - "41" - "42" - "50" {
				# 39: limpador, 40: caixa marcha, 41: freio motor, 42: estado de saída, 50: Motor funcionando
				switch $status {
					"1" { set status_t "Desligado" }
					"2" { set status_t "Ligado" }
					"3" { set status_t "Inversão de estado" }
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
					"1"     { set status_t "Início de viagem" }
					"2"     { set status_t "Fim de viagem" }
					"3"     { set status_t "Baú destravado" }
					"4"     { set status_t "Baú travado" }
					"5"     { set status_t "Carreta desengatada" }
					"6"     { set status_t "Carreta engatada" }
					"7"     { set status_t "Entrada área de risco" }
					"8"     { set status_t "Local autorizado" }
					"9"     { set status_t "Local não autorizado" }
					"10"    { set status_t "Mens. armazenada em memória" }
					"11"    { set status_t "Mens. enviada com sucesso" }
					"12"    { set status_t "Portas abertas" }
					"13"    { set status_t "Porta carona aberta" }
					"14"    { set status_t "Porta motorista aberta" }
					"15"    { set status_t "Nova coleta verifique mensagem" }
					"16"    { set status_t "5a. roda liberada por 2 minutos" }
					"17"    { set status_t "Necessário identicação do motorista" }
					"18"    { set status_t "Parada indevida" }
					"19"    { set status_t "Saída área de risco" }
					"20"    { set status_t "Desvio de rota" }
					"21"    { set status_t "Saída de rota" }
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
					"33"    { set status_t "Verificar pressão do óleo" }
					"34"    { set status_t "Verificar temperatura baú" }
					"35"    { set status_t "Verificar temperatura motor" }
					"36"    { set status_t "Banguela" }
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
					"1" { set obrigatorio_t "Máxima Urbana" }
					"2" { set obrigatorio_t "Máxima Rodoviária" }
					"3" { set obrigatorio_t "Máximo Urbano Chuva" }
					"4" { set obrigatorio_t "Máximo Rodoviário Chuva" }
				}
			}
			"10" { # tempo posicao
				set valor_status $status_a
				set sufixo "(s)"
				switch $obrigatorio_a {
					"1" { set obrigatorio_t "Ignição ligada gprs" }
					"2" { set obrigatorio_t "Ignição deligada gprs" }
					"3" { set obrigatorio_t "Ignição ligada satelital" }
					"4" { set obrigatorio_t "Ignição desligada satelital" }
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
					"0" { set status_t "Guarda posição" }
					"1" { set status_t "Sair do low power" }
					"2" { set status_t "Envio por GPRS ou satelital" }
				}
			}
			"14" - "15" { # 14: zerar açoes, 15: acoes final
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
					"1" { set status_t "Rodoviário" }
					"2" { set status_t "Urbano" }
				}
			}
			"18" - "19" - "22" { # 18: segentrada, # 19: segsaida
				switch $status_a {
					"1" { set status_t "Fora de Modo Seguro" }
					"2" { set status_t "Em Modo Seguro" }
					"3" { set status_t "Mudança de Modo" }
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

set trad_atg "$atgdescricao*"
set trad_status ""
set trad_obrig ""

# Busca a tradução e insere em trad_atg se existir
spi_exec -array result "select tratraducao from traducao where traidioma='$IDIOMA' and tratag = '$atgdescricao'" {
	set trad_atg $result(tratraducao)
}

# Se o status for um valor, traduza apenas o sufixo, se existir. Senão, busque a traducao se existir
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





select traducao_acao_embarcada('condicao', '249 1 1 1', '', 'pt_BR') as teste1;


----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


select condicao, * from sequenciamento_macro_relatorio;
drop table sequenciamento_macro_relatorio;
select relatorio_sequenciamento_macros(914935);
select a.aemcondicao_tratada, a.aemcondicao, * from acao_embarcada_mtc600_virtual a where a.veioid = 914935 and a.aemdt_exclusao is null and aemoid >=513 and aemoid <=576;
select traducao_acao_embarcada('condicao','5000 55 1 1','NULL') as condicao;