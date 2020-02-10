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
  * História: PRDSEG-3966
  * 
  * Alterado script para usar parallel e fazer o update através do rowid da linha
  *
  **/

declare
    CURSOR posicao_c is 
    SELECT /*+ PARALLEL(32) */
        ROWID AS POSROWID
    FROM SASCAR.POSICAO
    WHERE 1 = 1
    AND POSMODO_SEGURO IS NOT NULL
    AND POSDATAHORA between TO_DATE('20/10/2019 00:00:00','DD/MM/YYYY HH24:MI:SS')
    AND TO_DATE('31/12/2019 23:59:59','DD/MM/YYYY HH24:MI:SS');
	
	type my_table is table of rowid;
       
    v_my_table my_table;
    
begin
    
    open posicao_c;
    loop
        fetch posicao_c bulk collect into v_my_table limit 1000000;    
    
            IF v_my_table.count < 1 then
				EXIT;
			END IF;
          
            forall i IN v_my_table.first .. v_my_table.last 
            
                UPDATE SASCAR.POSICAO POS
                    SET POS.POSMODO_SEGURO = NULL 
                    WHERE POS.ROWID = v_my_table(i);
    
            commit; -- commit a cada N registros
            
    end loop;
    close posicao_c;
    
end;
