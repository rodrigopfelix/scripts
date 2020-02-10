-- Cria um novo grupo atuador para o sensor de umidade e temperatura serial que será utilizado pela BRF
-- Deve ser executado na base da intranet e na base gerenciadora

INSERT INTO atuador_grupo (atgoid, atgdescricao, atgporta, atgtpequipamento) VALUES(204, 'Sensor Umidade e Temperatura', 'L', 3);
