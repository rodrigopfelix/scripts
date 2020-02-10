/**
  * História: PRDINT-1166
  * Base: gerenciadora
  * Script de rollback
  *
  **/

DROP VIEW v_rel045;

CREATE OR REPLACE VIEW public.v_rel045
AS SELECT log.logoid AS __logoid,
    log.data AS __datacriacao,
    log.veioid AS __veioid,
    log.data AS "Data gravação",
    log.loggclioid AS __clioid,
    log.logggeroid AS __geroid,
    ((((((((('Veiculo '::text || log.veiplaca[1]) || ' '::text) || log.loggstdescricao) || ' ao login '::text) || log.login[1]) || ' por '::text) || log.loglogin[1]) || ' (IP Local '::text) || log.ipusuario[1]) || ')'::text AS "Descrição"
   FROM ( SELECT log_gerenciadora.logglogoid AS logoid,
            log_gerenciadora.loggdt_criacao AS data,
            log_gerenciadora.loggveioid AS veioid,
            log_gerenciadora.loggloggstoid,
            ( SELECT log_gerenciadora_subtipo.loggstdescricao
                   FROM log_gerenciadora_subtipo
                  WHERE log_gerenciadora.loggloggstoid = log_gerenciadora_subtipo.loggstoid) AS loggstdescricao,
            log_gerenciadora.loggclioid,
            log_gerenciadora.logggeroid,
            xpath('/main/conexao/loglogin/text()'::text, limpa(log_gerenciadora.loggdepois)) AS loglogin,
            xpath('/main/conexao/ipusuario/text()'::text, limpa(log_gerenciadora.loggdepois)) AS ipusuario,
            xpath('/main/log/veiplaca/text()'::text, limpa(log_gerenciadora.loggdepois)) AS veiplaca,
            xpath('/main/log/login/text()'::text, limpa(log_gerenciadora.loggdepois)) AS login
           FROM log_gerenciadora
          WHERE (log_gerenciadora.loggloggstoid IN ( SELECT log_gerenciadora_subtipo.loggstoid
                   FROM log_gerenciadora_subtipo
                  WHERE log_gerenciadora_subtipo.loggstloggtoid = 1))) log
  ORDER BY log.data DESC;