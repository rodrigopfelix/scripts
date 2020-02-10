/** -----------------------------------------------------------------
  *    SCRIPT DE ROLLBACK
  * -----------------------------------------------------------------
  * 
  * História: PRDSEG-2136
  * Base: Intranet, Gerenciadora
  *
  **/

delete from atuador_grupo where atgoid in (198, 208, 209);
