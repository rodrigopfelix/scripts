/**
  * Script rollback
  *
  * Histórias: PRDSEG-2961 e PRDSEG-2960
  *
  **/

-- HISTORIA: PRDSEG-2961

ALTER TABLE contrato_teste_instalacao DROP COLUMN cntitemperatura_serial;
ALTER TABLE contrato_teste_instalacao DROP COLUMN cntiumidade_serial;

DELETE FROM origem_ultima_posicao WHERE oupoid = 27 OR oupoid = 28;
DELETE FROM parametros_configuracoes_sistemas_itens WHERE pcsioid =  '228';
DELETE FROM equipamento_projeto_grupo_teste_planejado WHERE epgtpoid = 8;
UPDATE atuador_grupo SET atgabreviacao = 'FREIO' WHERE atgoid = 198;


-- HISTORIA: PRDSEG-2960

DELETE FROM comandos_parametros WHERE cmpcmdoid = 613;
DELETE FROM comandos WHERE cmdoid = 613;
DELETE FROM atendimento_operacao WHERE ateooid = 549;

