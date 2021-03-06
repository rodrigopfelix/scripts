/**
  * Histórias: PRDSEG-2961 (teste) e PRDSEG-2960 (config)
  * Base: Intranet
  * Cliente: BRF
  *
  * PRDSEG-2961: Scripts para adaptação do portal do instalador para aceitar o teste do sensor serial de temperatura e umidade
  * PRDSEG-2960: Scripts para envio do novo comando de configuração do sensor serial
  *
  **/

-- HISTORIA: PRDSEG-2961

-- Correção da abreviação do freio estacionário de FREIO para FREIO_ES
update atuador_grupo set atgabreviacao = 'FREIO_ES' where atgoid = 198;

-- Cria um novo grupo de testes
INSERT INTO public.equipamento_projeto_grupo_teste_planejado (epgtpoid, epgtpdescricao, epgtpdt_cadastro, epgtpusuoid_cadastro, epgtpordem)
VALUES(8, 'Testes De Sensor Serial', NOW(), 2750, 9);

-- Cadastra o novo web service
INSERT INTO public.parametros_configuracoes_sistemas_itens (pcsipcsoid, pcsioid, pcsidescricao, pcsidt_cadastro, pcsiusoid_cadastro)
VALUES('WS-PORTAL', '228', '228', NOW(), 2750);

-- Cadastra a nova coluna de umidade serial do Oracle
INSERT INTO public.origem_ultima_posicao (oupoid, oupordem, oupnomecampo, oupnomealias, oupexiste_binario)
VALUES(27, 27, 'UPOSUMIDADE_SERIAL', 'umiserial', false);

-- Cadastra a nova coluna de temperatura serial do Oracle
INSERT INTO public.origem_ultima_posicao(oupoid, oupordem, oupnomecampo, oupnomealias, oupexiste_binario)
VALUES(28, 28, 'UPOSTEMPERATURA_SERIAL', 'tempserial', false);

-- Criação das colunas onde serão salvos as entradas de umidade e temperatura pelo instalador no portal do instalador
ALTER TABLE contrato_teste_instalacao ADD COLUMN cntiumidade_serial numeric(10,4);
ALTER TABLE contrato_teste_instalacao ADD COLUMN cntitemperatura_serial numeric(10,4);

COMMENT ON COLUMN contrato_teste_instalacao.cntiumidade_serial IS 'Valor da umidade informada pelo instalador na hora do teste de sensor serial';
COMMENT ON COLUMN contrato_teste_instalacao.cntitemperatura_serial IS 'Valor da temperatura informada pelo instalador na hora do teste de sensor serial';

	
-- HISTORIA: PRDSEG-2960

-- Criação do grupo de comando
insert into atendimento_operacao(ateooid, ateonome) values (549, 'CALAMP GPRS Configurar portal serial');

-- Criação do comando de configuração da porta serial
INSERT INTO public.comandos (cmdoid, cmdateooid, cmdcomando, cmdnome, cmddescricao, cmddt_cadastro, cmdmeio)
VALUES(613, 549, 'SET_FUNCAO_SERIAL_SASMDT', 'Configura uso da porta serial (Satelital ou UmidadeTemperatura)', 'GPRS Configura Porta Serial', NOW(), 'GPRS');

-- Criação dos parametros do comando
INSERT INTO comandos_parametros (cmpcmdoid, cmppmtoid, cmpvl_min, cmpvl_max, cmpvl_default, cmpordem) VALUES(613, 7, 0, 0, '0', 0) returning cmpoid;
INSERT INTO comandos_parametros (cmpcmdoid, cmppmtoid, cmpvl_min, cmpvl_max, cmpvl_default, cmpordem) VALUES(613, 7, 0, 0, '0', 1) returning cmpoid;

