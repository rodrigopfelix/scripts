/**
  * História: PRDSEG-3779
  * Base: intranet
  *
  * Script de inserção do novo relatório 'Cross Border'
  *
  **/

INSERT INTO pagina (pagdescricao, pagtitulo, pagurl, pagmenu, pagtipo_arq, pagfinalidade) 
VALUES (
    'Relatorios -> Cross Border',
    'Cross Border',
    'rel_crossborder.php',
    'Relatorios',
    'P',
    'Relatório que correlaciona os contratos e seus equipamentos com obrigação financeira de cross border e sua ativação'
);