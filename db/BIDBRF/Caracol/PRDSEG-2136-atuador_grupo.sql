/** 
  * História: PRDSEG-2136
  * Base: Intranet, Gerenciadora
  *
  * Cadastra 3 novos sensores que serão utilizados pela BRF: Sensor Freio Estacionario, Sensor Gaiola, Sensor Caracol
  *
  **/

INSERT INTO atuador_grupo (atgoid, atgdescricao, atgporta, atgtpequipamento, atggrupo, atgabreviacao) 
VALUES(198, 'Sensor Freio Estacionario', 'E', 3, NULL, 'FREIO');
INSERT INTO atuador_grupo (atgoid, atgdescricao, atgporta, atgtpequipamento, atggrupo, atgabreviacao) 
VALUES(208, 'Sensor Gaiola', 'E', 3, NULL, 'GAIOLA');
INSERT INTO atuador_grupo (atgoid, atgdescricao, atgporta, atgtpequipamento, atggrupo, atgabreviacao) 
VALUES(209, 'Sensor Caracol', 'E', 3, NULL, 'CARACOL');
