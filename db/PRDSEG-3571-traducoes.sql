/**
  * História: PRDSEG-3571
  * Base: Gerenciadora
  *
  * Tradução de sensores na base de dados - utilizado pelo SasGC Cliente
  *
  **/

-- Bloqueio Master 
INSERT INTO public.traducao (tratag, tratraducao, traidioma) VALUES('Bloqueio Master', 'Bloqueio Master', 'pt_BR');
INSERT INTO public.traducao (tratag, tratraducao, traidioma) VALUES('Bloqueio Master', 'Bloqueo Máster', 'es_AR');

-- Sensor Gaiola
INSERT INTO public.traducao (tratag, tratraducao, traidioma) VALUES('Sensor Gaiola', 'Sensor Gaiola', 'pt_BR');
INSERT INTO public.traducao (tratag, tratraducao, traidioma) VALUES('Sensor Gaiola', 'Sensor Jaula', 'es_AR');

-- Sensor Caracol
INSERT INTO public.traducao (tratag, tratraducao, traidioma) VALUES('Sensor Caracol', 'Sensor Caracol', 'pt_BR');
INSERT INTO public.traducao (tratag, tratraducao, traidioma) VALUES('Sensor Caracol', 'Sensor Caracol', 'es_AR');

-- Sensor Umidade e Temperatura
INSERT INTO public.traducao (tratag, tratraducao, traidioma) VALUES('Sensor Umidade e Temperatura', 'Sensor Umidade e Temperatura', 'pt_BR');
INSERT INTO public.traducao (tratag, tratraducao, traidioma) VALUES('Sensor Umidade e Temperatura', 'Sensor de humedad y temperatura', 'es_AR');
