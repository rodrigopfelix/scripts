-- Script de rollback
-- BASE: SasIntegraV3
delete from permissao_metodo where perm_met_id = 38 and perm_integradoraid = 50114;
delete from permissao_metodo where perm_met_id = 38 and perm_integradoraid = 1789;