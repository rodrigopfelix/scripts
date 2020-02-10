/**
  * História: PRDSEG-3779
  * Base: intranet
  *
  * Script de inserção do novo relatório 'Roaming Internacional'
  *
  * O script também concede permissão de acesso à esta página ao 
  *     departamento 206, 
  *     cargo 2520 
  *     através do usuário 7516
  *
  **/

WITH
    id_dpto AS (SELECT 206),
    id_cargo AS (SELECT 2520),
    id_user_insert AS (SELECT 7516),

    -- Inserção da página
    id_pagina AS (
        INSERT INTO pagina (pagdescricao, pagtitulo, pagurl, pagmenu, pagtipo_arq, pagfinalidade) 
        VALUES ('Relatorios -> Roaming Internacional', 'Roaming Internacional', 'rel_roaming.php', 'Relatorios', 'P',
                'Relatório que correlaciona os contratos e seus equipamentos com obrigação financeira de roaming internacional e sua ativação')
        RETURNING pagoid
    ),

    -- Permissão de acesso à pagina ao departamento 206
    id_perm_dpto AS (
        INSERT INTO pagina_permissao_depto (ppddepoid, ppdpagoid) 
        VALUES ((SELECT * FROM id_dpto), (SELECT * FROM id_pagina)) 
        RETURNING ppdoid
    ),

    -- Log de inserção da página
    id_hist AS (
        INSERT INTO pagina_permissao_historico (pphdepoid, pphpagoid, pphusuoid) 
        VALUES ((SELECT * FROM id_dpto), (SELECT * FROM id_pagina), (SELECT * FROM id_user_insert))
        RETURNING pphoid
    )

    -- Permissão para o cargo daquele departamento
    INSERT INTO pagina_permissao_cargo (ppccargooid, ppcppdoid, ppcpagoid) 
    VALUES ((SELECT * FROM id_cargo), (SELECT * FROM id_perm_dpto), (SELECT * FROM id_pagina))
    RETURNING ppcoid, (SELECT * FROM id_pagina) AS pagoid;
END;