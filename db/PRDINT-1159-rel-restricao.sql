/**
  * História: PRDINT-1159
  * Base: gerenciadora e gerenciadora2
  *
  * Altera a view do relatório "configuração de restrição de condição e ação de alerta e ação embarcada"
  * para suporte à nova versão com tradução
  *
  **/

DROP VIEW public.v_rel048;

CREATE OR REPLACE VIEW public.v_rel048 AS
    SELECT 
        log.data AS datacriacao,
        log.data AS datagravacao,
        log.loggclioid AS clioid,
        log.logggeroid AS geroid,
        log.condicao_acao[1]::text::integer,
        log.acao_acao[1]::text::integer,
        log.condicao_alerta[1]::text::integer,
        log.acao_alerta[1]::text::integer
    FROM (
            /* As alertas estão sendo salvas em como acao e as ações como alerta */
            /* Foi decidido manter assim para evitar incosistencia na base */
            SELECT 
                log_gerenciadora.loggdt_criacao AS data,
                log_gerenciadora.loggclioid,
                log_gerenciadora.logggeroid,
                xpath('/main/log/condicao_acao/text()'::text, log_gerenciadora.loggdepois) AS condicao_alerta,
                xpath('/main/log/acao_acao/text()'::text, log_gerenciadora.loggdepois) AS acao_alerta,
                xpath('/main/log/condicao_alerta/text()'::text, log_gerenciadora.loggdepois) AS condicao_acao,
                xpath('/main/log/acao_alerta/text()'::text, log_gerenciadora.loggdepois) AS acao_acao
            FROM log_gerenciadora
            WHERE log_gerenciadora.loggloggstoid IN (
                    SELECT log_gerenciadora_subtipo.loggstoid
                    FROM log_gerenciadora_subtipo
                    WHERE log_gerenciadora_subtipo.loggstloggtoid = 4)
            ORDER BY log_gerenciadora.loggdt_criacao DESC
        ) log;
