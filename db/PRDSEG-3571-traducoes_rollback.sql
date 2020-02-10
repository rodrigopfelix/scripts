/**
  * Script rollback
  *
  * História: PRDSEG-3571
  * Base: Gerenciadora
  *
  **/

DELETE FROM public.traducao WHERE tratag='Bloqueio Master' AND traidioma='pt_BR';
DELETE FROM public.traducao WHERE tratag='Bloqueio Master' AND traidioma='es_AR';
DELETE FROM public.traducao WHERE tratag='Sensor Gaiola' AND traidioma='pt_BR';
DELETE FROM public.traducao WHERE tratag='Sensor Gaiola' AND traidioma='es_AR';
DELETE FROM public.traducao WHERE tratag='Sensor Caracol' AND traidioma='pt_BR';
DELETE FROM public.traducao WHERE tratag='Sensor Caracol' AND traidioma='es_AR';
DELETE FROM public.traducao WHERE tratag='Sensor Umidade e Temperatura' AND traidioma='pt_BR';
DELETE FROM public.traducao WHERE tratag='Sensor Umidade e Temperatura' AND traidioma='es_AR';

