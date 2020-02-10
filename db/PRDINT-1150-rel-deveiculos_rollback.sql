/**
  * História: PRDINT-1150
  * Base: gerenciadora e gerenciadora2
  *
  * Script de rollback
  *
  **/

------------------------------------------------------------------------
--- VIEW GERENCIADORA
------------------------------------------------------------------------

DROP VIEW public.v_rel004_gerenciadora;

CREATE OR REPLACE VIEW public.v_rel004_gerenciadora
AS SELECT veiculo.veigerenciadora1 AS __geroid1,
    veiculo.veigerenciadora2 AS __geroid2,
    veiculo.veigerenciadora3 AS __geroid3,
    replace(cliente.clinome, '&'::text, 'e'::text) AS "Cliente",
    veiculo.veiplaca AS "Placa",
    veiculo.veimodmarca AS "Marca/Modelo",
    veiculo.veicor AS "Cor",
    (
        CASE
            WHEN se0.atgdescricao IS NULL THEN ''::text
            ELSE se0.atgdescricao || '    '::text
        END ||
        CASE
            WHEN se1.atgdescricao IS NULL THEN ''::text
            ELSE se1.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN veiculo.veisatelital > 0 THEN 'Satelital'::text || '  '::text
            ELSE ''::text
        END AS "Acessórios",
    ((((((
        CASE
            WHEN s1.atgdescricao IS NULL THEN ''::text
            ELSE s1.atgdescricao || '    '::text
        END ||
        CASE
            WHEN s2.atgdescricao IS NULL THEN ''::text
            ELSE s2.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN s3.atgdescricao IS NULL THEN ''::text
            ELSE s3.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN s4.atgdescricao IS NULL THEN ''::text
            ELSE s4.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN s5.atgdescricao IS NULL THEN ''::text
            ELSE s5.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN s6.atgdescricao IS NULL THEN ''::text
            ELSE s6.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN s7.atgdescricao IS NULL THEN ''::text
            ELSE s7.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN s8.atgdescricao IS NULL THEN ''::text
            ELSE s8.atgdescricao || '    '::text
        END AS "Sensores",
    ((((((
        CASE
            WHEN a1.atgdescricao IS NULL THEN ''::text
            ELSE a1.atgdescricao || '    '::text
        END ||
        CASE
            WHEN a2.atgdescricao IS NULL THEN ''::text
            ELSE a2.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN a3.atgdescricao IS NULL THEN ''::text
            ELSE a3.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN a4.atgdescricao IS NULL THEN ''::text
            ELSE a4.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN a5.atgdescricao IS NULL THEN ''::text
            ELSE a5.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN a6.atgdescricao IS NULL THEN ''::text
            ELSE a6.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN a7.atgdescricao IS NULL THEN ''::text
            ELSE a7.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN a8.atgdescricao IS NULL THEN ''::text
            ELSE a8.atgdescricao || '    '::text
        END AS "Atuadores"
   FROM veiculo
     LEFT JOIN atuador_grupo se0 ON veiculo.veiserial0 = se0.atgoid
     LEFT JOIN atuador_grupo se1 ON veiculo.veiserial1 = se1.atgoid
     LEFT JOIN atuador_grupo s1 ON veiculo.veicod_sensor1 = s1.atgoid
     LEFT JOIN atuador_grupo s2 ON veiculo.veicod_sensor2 = s2.atgoid
     LEFT JOIN atuador_grupo s3 ON veiculo.veicod_sensor3 = s3.atgoid
     LEFT JOIN atuador_grupo s4 ON veiculo.veicod_sensor4 = s4.atgoid
     LEFT JOIN atuador_grupo s5 ON veiculo.veicod_sensor5 = s5.atgoid
     LEFT JOIN atuador_grupo s6 ON veiculo.veicod_sensor6 = s6.atgoid
     LEFT JOIN atuador_grupo s7 ON veiculo.veicod_sensor7 = s7.atgoid
     LEFT JOIN atuador_grupo s8 ON veiculo.veicod_sensor8 = s8.atgoid
     LEFT JOIN atuador_grupo a1 ON veiculo.veicod_atuador1 = a1.atgoid
     LEFT JOIN atuador_grupo a2 ON veiculo.veicod_atuador2 = a2.atgoid
     LEFT JOIN atuador_grupo a3 ON veiculo.veicod_atuador3 = a3.atgoid
     LEFT JOIN atuador_grupo a4 ON veiculo.veicod_atuador4 = a4.atgoid
     LEFT JOIN atuador_grupo a5 ON veiculo.veicod_atuador5 = a5.atgoid
     LEFT JOIN atuador_grupo a6 ON veiculo.veicod_atuador6 = a6.atgoid
     LEFT JOIN atuador_grupo a7 ON veiculo.veicod_atuador7 = a7.atgoid
     LEFT JOIN atuador_grupo a8 ON veiculo.veicod_atuador8 = a8.atgoid
     JOIN cliente ON veiculo.veiclioid = cliente.clioid
  ORDER BY cliente.clinome, veiculo.veiplaca;

------------------------------------------------------------------------
-- VIEW CLIENTE
------------------------------------------------------------------------

DROP VIEW public.v_rel004_cliente;

CREATE OR REPLACE VIEW public.v_rel004_cliente
AS SELECT veiculo.veiclioid AS __clioid,
    replace(cliente.clinome, '&'::text, 'e'::text) AS "Cliente",
    veiculo.veiplaca AS "Placa",
    veiculo.veimodmarca AS "Marca/Modelo",
    veiculo.veicor AS "Cor",
    (
        CASE
            WHEN se0.atgdescricao IS NULL THEN ''::text
            ELSE se0.atgdescricao || '    '::text
        END ||
        CASE
            WHEN se1.atgdescricao IS NULL THEN ''::text
            ELSE se1.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN veiculo.veisatelital > 0 THEN 'Satelital '::text
            ELSE ''::text
        END AS "Acessórios",
    ((((((
        CASE
            WHEN s1.atgdescricao IS NULL THEN ''::text
            ELSE s1.atgdescricao || '    '::text
        END ||
        CASE
            WHEN s2.atgdescricao IS NULL THEN ''::text
            ELSE s2.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN s3.atgdescricao IS NULL THEN ''::text
            ELSE s3.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN s4.atgdescricao IS NULL THEN ''::text
            ELSE s4.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN s5.atgdescricao IS NULL THEN ''::text
            ELSE s5.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN s6.atgdescricao IS NULL THEN ''::text
            ELSE s6.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN s7.atgdescricao IS NULL THEN ''::text
            ELSE s7.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN s8.atgdescricao IS NULL THEN ''::text
            ELSE s8.atgdescricao || '    '::text
        END AS "Sensores",
    ((((((
        CASE
            WHEN a1.atgdescricao IS NULL THEN ''::text
            ELSE a1.atgdescricao || '    '::text
        END ||
        CASE
            WHEN a2.atgdescricao IS NULL THEN ''::text
            ELSE a2.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN a3.atgdescricao IS NULL THEN ''::text
            ELSE a3.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN a4.atgdescricao IS NULL THEN ''::text
            ELSE a4.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN a5.atgdescricao IS NULL THEN ''::text
            ELSE a5.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN a6.atgdescricao IS NULL THEN ''::text
            ELSE a6.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN a7.atgdescricao IS NULL THEN ''::text
            ELSE a7.atgdescricao || '    '::text
        END) ||
        CASE
            WHEN a8.atgdescricao IS NULL THEN ''::text
            ELSE a8.atgdescricao || '    '::text
        END AS "Atuadores"
   FROM veiculo
     LEFT JOIN atuador_grupo se0 ON veiculo.veiserial0 = se0.atgoid
     LEFT JOIN atuador_grupo se1 ON veiculo.veiserial1 = se1.atgoid
     LEFT JOIN atuador_grupo s1 ON veiculo.veicod_sensor1 = s1.atgoid
     LEFT JOIN atuador_grupo s2 ON veiculo.veicod_sensor2 = s2.atgoid
     LEFT JOIN atuador_grupo s3 ON veiculo.veicod_sensor3 = s3.atgoid
     LEFT JOIN atuador_grupo s4 ON veiculo.veicod_sensor4 = s4.atgoid
     LEFT JOIN atuador_grupo s5 ON veiculo.veicod_sensor5 = s5.atgoid
     LEFT JOIN atuador_grupo s6 ON veiculo.veicod_sensor6 = s6.atgoid
     LEFT JOIN atuador_grupo s7 ON veiculo.veicod_sensor7 = s7.atgoid
     LEFT JOIN atuador_grupo s8 ON veiculo.veicod_sensor8 = s8.atgoid
     LEFT JOIN atuador_grupo a1 ON veiculo.veicod_atuador1 = a1.atgoid
     LEFT JOIN atuador_grupo a2 ON veiculo.veicod_atuador2 = a2.atgoid
     LEFT JOIN atuador_grupo a3 ON veiculo.veicod_atuador3 = a3.atgoid
     LEFT JOIN atuador_grupo a4 ON veiculo.veicod_atuador4 = a4.atgoid
     LEFT JOIN atuador_grupo a5 ON veiculo.veicod_atuador5 = a5.atgoid
     LEFT JOIN atuador_grupo a6 ON veiculo.veicod_atuador6 = a6.atgoid
     LEFT JOIN atuador_grupo a7 ON veiculo.veicod_atuador7 = a7.atgoid
     LEFT JOIN atuador_grupo a8 ON veiculo.veicod_atuador8 = a8.atgoid
     JOIN cliente ON veiculo.veiclioid = cliente.clioid
  ORDER BY cliente.clinome, veiculo.veiplaca;