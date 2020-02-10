drop FUNCTION teste_procedure(text, text);
-- drop FUNCTION teste_procedure(text);

-- spi_exec -array count "SELECT count(*) from traducao where traidioma='$2'" {
--     set traidioma $count(count)
-- }

CREATE OR REPLACE FUNCTION public.teste_procedure(text, text default 'pt_BR')
 RETURNS text
 LANGUAGE pltcl
AS $function$


if { $2 == "" } {
    set traidioma "empty"
} else {
    set traidioma $2 
}



set ret "none"
set varadd " + ($traidioma)"

if { $1 != "a" } { set varadd " --- legall" }


switch $1 {
    "a" { set ret "A" }
    "b" -
    "c" { set ret "BC" }
    "d" { set ret "D" }
}

set IDIOMA "es_AR"
set atgdescricao "Sensor Umidade e Temperatura"
set atgtraducao ""

spi_exec -array result "select tratraducao from traducao where traidioma='$IDIOMA' and tratag ilike '$atgdescricao'" {
	set atgtraducao "tradução: $result(tratraducao)"
}

if { $atgtraducao == "" } {
    set atgtraducao "sem tradução"
}

append atgtraducao " | FIM"

return "$ret $varadd -- $atgtraducao"
$function$
;



-- select proname,prosrc from pg_proc where prosrc ilike '%traducao%';



SELECT * from teste_procedure('a');
-- SELECT * from teste_procedure('a', '');
-- SELECT * from teste_procedure('a', 'b');
-- SELECT * from teste_procedure('b');
-- SELECT * from teste_procedure('c');
-- SELECT * from teste_procedure('d');

--SELECT count(*) from traducao where traidioma='a';
