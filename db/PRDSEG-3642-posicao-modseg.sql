/**
  * História: PRDSEG-3642
  * Base: Sascar (Oracle)
  *
  * No dia 21/out foi aplicado em produção uma demanda que começou a salvar informações na coluna
  * POSMODO_SEGURO da tabela POSICAO do Oracle. Porém, varíos rastreadores não estavam atualizados, 
  * enviando lixo de memória que foram salvos nestas colunas e gerarão "falsos positivos" nos
  * relatórios do SasGC.
  *
  * Este script altera os registros de posição após o dia 20/out que contém lixo para null, em lotes
  * de 1 milhão.
  *
  * Devido ao fato do script apagar lixo de memória, não será criado um script de rollback,
  *
  **/

declare
    CURSOR posicao_c is 
    SELECT
        POSVEIOID
        , POSDATAHORA
        , POSMODO_SEGURO
    FROM SASCAR.POSICAO
    WHERE 1 = 1
    AND POSMODO_SEGURO IS NOT NULL
    AND POSDATAHORA > '20-OUT-19'
    AND POSDATAHORA < '10-DEZ-19';
    TYPE posveioid_type     IS TABLE OF SASCAR.POSICAO.posveioid%TYPE         INDEX BY BINARY_INTEGER;
    TYPE posdatahora_type   IS TABLE OF SASCAR.POSICAO.posdatahora%TYPE       INDEX BY BINARY_INTEGER;
    TYPE posmodo_seg_type   IS TABLE OF SASCAR.POSICAO.posmodo_seguro%TYPE    INDEX BY BINARY_INTEGER;
  
    posveioid_v     posveioid_type;
    posdatahora_v   posdatahora_type;
    posmodo_seg_v   posmodo_seg_type;
begin
    
    open posicao_c;
    loop
        fetch posicao_c bulk collect into posveioid_v, posdatahora_v, posmodo_seg_v limit 1000000;    
    
            if posveioid_v.count > 0 then
          
            forall vnContador in 1 .. posveioid_v.count
            
                UPDATE SASCAR.POSICAO
                    SET POSMODO_SEGURO = NULL 
                    WHERE POSVEIOID = posveioid_v(vnContador)
                    AND POSDATAHORA = posdatahora_v(vnContador);
    
            commit; -- commit a cada N registros
    
            end if;
    exit when posicao_c%notfound;
    end loop;
    close posicao_c;
    
end;
