/* História: PRDSEG-3018
BASE: intranet

Script para sincronizar o id do teste de umidade e temperatura de produção para homolog

Esse script deve ser executado apenas em homolog
*/


INSERT INTO equipamento_projeto_teste_planejado (eptpoid, eptpeproid, eptpobrigatorio, eptpinstrucao, eptpdt_cadastro, eptpusuoid_cadastro, eptpusuoid_exclusao, eptpdt_exclusao, eptpepttoid, eptpmsg_teste_ok, eptpmsg_teste_nok, eptpepgtpoid, eptpdt_alteracao, eptpusuoid_alteracao, eptpmsg_teste, eptpostoid_teste_obrigatorio)
VALUES(141, NULL, true, 'Informe no campo abaixo os valores de umidade e temperatura respectivamente', NOW(), 7516, NULL, NULL, 87, 'Teste realizado com sucesso', 'Valores divergentes, verifique o sensor.', 8, NULL, NULL, '', '{1,2,4,9}');

update equipamento_comandos_testes set ecmteptpoid = 141 where ecmtoid = 8993;

UPDATE equipamento_projeto_teste_planejado SET eptpusuoid_exclusao=7516, eptpdt_exclusao=NOW() WHERE eptpoid=106;