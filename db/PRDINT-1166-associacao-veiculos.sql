/**
  * Hist�ria: PRDINT-1166
  * Base: gerenciadora
  *
  * Altera a view do relat�rio "de associa��o de ve�culos" para suporte � nova vers�o com tradu��o
  *
  **/

DROP VIEW v_rel045;

CREATE OR REPLACE VIEW public.v_rel045
AS SELECT log_gerenciadora.logglogoid AS logoid,
          log_gerenciadora.loggdt_criacao AS data,
          log_gerenciadora.loggveioid AS veioid,
          log_gerenciadora.loggloggstoid,
          ( SELECT log_gerenciadora_subtipo.loggstdescricao
              FROM log_gerenciadora_subtipo
             WHERE log_gerenciadora.loggloggstoid = log_gerenciadora_subtipo.loggstoid)::text AS loggstdescricao,
          log_gerenciadora.loggclioid as clioid,
          log_gerenciadora.logggeroid as geroid,
          (xpath('/main/conexao/loglogin/text()'::text, limpa(log_gerenciadora.loggdepois)))[1]::text AS loglogin,
          (xpath('/main/conexao/ipusuario/text()'::text, limpa(log_gerenciadora.loggdepois)))[1]::text AS ipusuario,
          (xpath('/main/log/veiplaca/text()'::text, limpa(log_gerenciadora.loggdepois)))[1]::text AS veiplaca,
          (xpath('/main/log/login/text()'::text, limpa(log_gerenciadora.loggdepois)))[1]::text AS login
     FROM log_gerenciadora
    WHERE log_gerenciadora.loggloggstoid IN ( SELECT log_gerenciadora_subtipo.loggstoid
                                              FROM log_gerenciadora_subtipo
                                              WHERE log_gerenciadora_subtipo.loggstloggtoid = 1)
 ORDER BY data DESC;