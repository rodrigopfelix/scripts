/*
 * História: PRDSEG-3018
 * BASE: INTRANET
 *
 * Script para adicionar a permissão do usuário ADMIN.DESENV acessar o portal do instalador
 */

INSERT INTO public.atendente_perfil_representante
(aprusuoid_atendente, aprrepoid, aprusuoid_instalador, aprusuoid_cadastro, aprdt_fim_vinculo, aprmotivo)
VALUES(7516, 1714, 8107, 7516, '2030-12-31 23:59:59.000', 'Teste BRF');
