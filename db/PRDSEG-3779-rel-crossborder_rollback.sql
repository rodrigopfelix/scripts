/**
  * História: PRDSEG-3779
  * Base: intranet
  *
  * Script de rollback
  *
  **/

DELETE FROM pagina
WHERE
    pagdescricao = 'Relatorios -> Cross Border' AND
    pagtitulo = 'Cross Border' AND
    pagurl = 'rel_crossborder.php' AND
    pagmenu = 'Relatorios' AND
    pagtipo_arq = 'P' AND
    pagfinalidade ilike '%que correlaciona os contratos e seus equipamentos com%';