/**
  * História: PRDINT-1159
  * Base: gerenciadora e gerenciadora2
  *
  * Script de rollback
  *
  **/

DROP VIEW public.v_rel048;

CREATE OR REPLACE VIEW public.v_rel048
AS SELECT log.data AS __datacriacao,
    log.data AS "Data gravação",
    log.loggclioid AS __clioid,
    log.logggeroid AS __geroid,
    ((('Análise condição ação embarcada: '::text ||
        CASE
            WHEN log.condicao_acao[1]::text::integer = 1 THEN 'Desativado'::text
            ELSE 'Ativado'::text
        END) || '; Análise ação ação embarcada:'::text) ||
        CASE
            WHEN log.acao_acao[1]::text::integer = 1 THEN 'Desativado'::text
            ELSE 'Ativado'::text
        END) || ';'::text AS "Descrição"
   FROM ( SELECT log_gerenciadora.loggdt_criacao AS data,
            log_gerenciadora.loggclioid,
            log_gerenciadora.logggeroid,
            xpath('/main/log/condicao_acao/text()'::text, log_gerenciadora.loggdepois) AS condicao_acao,
            xpath('/main/log/acao_acao/text()'::text, log_gerenciadora.loggdepois) AS acao_acao
           FROM log_gerenciadora
          WHERE (log_gerenciadora.loggloggstoid IN ( SELECT log_gerenciadora_subtipo.loggstoid
                   FROM log_gerenciadora_subtipo
                  WHERE log_gerenciadora_subtipo.loggstloggtoid = 4))
          ORDER BY log_gerenciadora.loggdt_criacao DESC) log;