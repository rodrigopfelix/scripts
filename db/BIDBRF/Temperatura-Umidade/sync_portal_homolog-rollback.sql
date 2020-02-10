/* História: PRDSEG-3018 
BASE: intranet

Script de rollback
*/

UPDATE equipamento_projeto_teste_planejado SET eptpusuoid_exclusao=NULL, eptpdt_exclusao=NULL WHERE eptpoid=106;

update equipamento_comandos_testes set ecmteptpoid = 106 where ecmtoid = 8993;

delete from equipamento_projeto_teste_planejado where eptpoid = 141;