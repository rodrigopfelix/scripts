/**
  * História: PRDSEG-2135
  * Base: Gerenciadora, Gerenciadora2
  *
  * Adapta a função para lidar com os 3 novos sensores que serão utilizados pela BRF:
  *    Sensor Freio Estacionario,
  *    Sensor Gaiola,
  *    Sensor Caracol
  * Sem esta atualização, o MOcorrencias não gera alertas para os sensores novos
  *
  * Foi feita uma pequena refatoração, ordenando os indices dos sensores de forma sequencial
  *
  **/


CREATE OR REPLACE FUNCTION public.evento_conversao(text, character)
 RETURNS text
 LANGUAGE pltcl
AS $function$
# $1 -> evento original
# $2 ->  (R)esultado, (L)eventos

    set eventos $1
    set n [expr [llength $eventos] / 3]

    set pos 0
    set leventos ""
    set lresultado ""

    for { set i 0 } { $i < $n } { incr i } {
        set codigo [lindex $eventos $pos]
        incr pos
        set operacao [lindex $eventos $pos]
        incr pos
        set valor [lindex $eventos $pos]
        incr pos

        set funcao 0
        set complemento ""
        #elog NOTICE "$codigo $operacao"

        switch $codigo {
            198 {
            	# Freio Estacionario - E
            	set funcao 1
            }

            206 {
                #Sensor Tampa Combustivel
                set funcao 1
            }

            207 {
                #Sensor Janelas
                set funcao 1
            }

            208 {
            	# Sensor Gaiola - E
            	set funcao 1
            }

            209 {
            	# Sensor Caracol - E
            	set funcao 1
            }

            221 {
                if { $operacao == "<" } {
                    set funcao 4
                } else {
                    set funcao 5
                }
                set complemento @@@
            }

            222 {
                if { $operacao == "<" } {
                    set funcao 4
                } else {
                    set funcao 5
                }
                set complemento @@@

            }

            223 {
                if { $operacao == "<" } {
                    set funcao 4
                } else {
                    set funcao 5
                }
                set complemento @@@
            }

            231 {
                # Violacao de Painel - E
                set funcao 1
            }

            232 {
                # Buzzer - S
                set funcao 2
            }

            233 {
                # Pisca - S
                set funcao 2
            }

            234 {
                # Bloqueio
                set funcao 3
            }

            235 {
                # Teclado Numerico - L
            }

            236 {
                # Teclado Alfanumerico - L
            }

            237 {
                # Odometro - L
            }

            238 {
                # Teclado Mic Suporte Macro - L
            }
            239 {
                # Teclado - L
            }

            240 {
                # Sirene - S
                set funcao 2
            }

            241 {
                # Desengate - E
                set funcao 1
            }

            242 {
                # Capo - E
                set funcao 1
            }

            243 {
                # Braco Articulado Descarga - E
                set funcao 1
            }

            244 {
                # Acessorio - L
            }

            245 {
                # Trava 5 Roda - S
                set funcao 2
            }

            246 {
                # Sensor Portas - E
                set funcao 1
            }

            247 {
                # Sensor Porta Motorista - E
                set funcao 1
            }

            248 {
                # Sensor Porta Carona - E
                set funcao 1
            }

            249 {
                # Sensor Bau - E
                set funcao 1
            }

            250 {
                # Sensor Bau Lateral - E
                set funcao 1
            }

            251 {
                # Sensor Bau Traseiro - E
                set funcao 1
            }

            252 {
                # Trava Bau - S
                set funcao 2
            }

            253 {
                # Trava Bau Lateral - S
                set funcao 2
            }

            254 {
                # Trava Bau Traseiro - S
                set funcao 2
            }

            500 {
                # Ignicao - O
                set funcao 3
            }

            501 {
                # Alerta Interno - O
                set funcao 3
            }

            502 {
                # Velocidade
                if { $operacao == "<" } {
                    set funcao 4
                } else {
                    set funcao 5
                }
                set complemento @@@
            }

            503 {
                # Odometro - <
                if { $operacao == "<" } {
                    set funcao 4
                } else {
                    set funcao 5
                }
                set complemento @@@
            }

            504 {
                # RPM - <
                if { $operacao == "<" } {
                    set funcao 4
                } else {
                    set funcao 5
                }
                set complemento @@@
            }

            505 {
                # Temperatura Externa  - <
                if { $operacao == "<" } {
                    set funcao 4
                } else {
                    set funcao 5
                }
                set complemento @@@
            }

            506 {
                # Temperatura Externa 2 - <
                if { $operacao == "<" } {
                    set funcao 4
                } else {
                    set funcao 5
                }
                set complemento @@@
            }

            507 {
                # Texto Livre - %
            }

            508 {
                # Macro - M
                set funcao 3
            }

            509 {
                # Excesso de tempo parado
                set funcao 3
            }

            510 {
                # Sem sinal
            }

            511 {
                # Tensao
                if { $operacao == "<" } {
                    set funcao 4
                } else {
                    set funcao 5
                }
                set complemento @@@
            }

            512 {
                # Fuga de Rota
                set funcao 6
            }

            516 {
                # Horario
                if { $operacao == "<" } {
                    set funcao 4
                } else {
                    set funcao 5
                }
                set complemento @@@
            }

            517 {
                # Panico - E
                set funcao 3
            }

            521 {
                # Excesso de velocidade - Embarcado - O
                set funcao 3
            }

            531 {
                # Macro - TMCD
                set funcao 3
            }

            535 {
                # Em operacao - O
                set funcao 3
            }

            537 {
                # Macro TD50
                set funcao 3
            }

            553 {
                # Area de risco - r
                if { $operacao == "R" } {
                    # dentro
                    set funcao 4
                } else {
                    # fora
                    set funcao 5
                }
            }

            563 {
                #excesso de tempo parado
                set funcao 3
            }

            651 {
                # Mensagem de Teclado
                set funcao 3
            }

            652 {
                #Chegada Ponto
                set funcao 3
            }

            653 {
                #Saida Ponto
                set funcao 3
            }

            654 {
                # Velocidade
                if { $operacao == "<" } {
                    set funcao 4
                } else {
                    set funcao 5
                }
                set complemento @@@
            }

            665 {
                # Jamming - O
                set funcao 3
            }

            673 {
                # Teclado TMS3
                set funcao 3
            }

            674 {
                # Falha ao reativar trava de quinta roda
                set funcao 8
            }

            675 {
                # Tombamento da trava de quinta roda.
                set funcao 8
            }

            1000 {
                # Cerca - c
                set funcao 7
            }

            1001 {
                # Area de risco - r
                if { $operacao == "R" } {
                    # dentro
                    set funcao 4
                } else {
                    # fora
                    set funcao 5
                }
            }

            1002 {
                # Pontos de referencia - p
                if { $operacao == "P" } {
                    # dentro
                    set funcao 4
                } else {
                    # fora
                    set funcao 5
                }
            }

            1003 {
                # Ponto de Referencia em grupo alvo - c
                set funcao 3
            }

        }

        append leventos " $codigo $funcao $valor"
        #elog NOTICE "$codigo $funcao $valor $complemento"
        if { $complemento == "" } {
            append lresultado " $codigo $operacao $valor"
        } else {
            append lresultado " $codigo $operacao $valor$complemento"
        }
    }
    set leventos [string range $leventos 1 end]
    set lresultado [string range $lresultado 1 end]

    if { $2 == "R" } {
        return $lresultado
    } else {
        return $leventos
    }
$function$