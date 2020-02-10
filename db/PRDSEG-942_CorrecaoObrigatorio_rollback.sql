CREATE OR REPLACE FUNCTION public.relatorio_sequenciamento_macros(integer)
 RETURNS integer
 LANGUAGE pltcl
AS $function$
set veioid $1
spi_exec "create temp table  sequenciamento_macro_relatorio (sqmnome text, sqmdescricao text, sqmcriacao_embarque 
timestamp without time zone, sqmcadastro timestamp without time zone, mttdoid integer, mttdnome text, mttdconteudo text,  ameoid integer,condicao text, acao text)"
spi_exec -array sequenciamento_macro "select sqmnome, sqmdescricao, sqmcriacao_embarque,sqmcadastro from sequenciamento_macros_virtual where sqmveioid = $veioid" {
	set sqmnome $sequenciamento_macro(sqmnome)
	set sqmdescricao $sequenciamento_macro(sqmdescricao)
	set sqmcriacao_embarque $sequenciamento_macro(sqmcriacao_embarque)
	set sqmcadastro $sequenciamento_macro(sqmcadastro)
}

spi_exec -array macro "select mttdoid, mttdnome, mttdconteudo from macro_teclado_td50_virtual where veioid = $veioid" {
	set mttdoid $macro(mttdoid)
	set mttdnome $macro(mttdnome)
	set mttdconteudo $macro(mttdconteudo)
	spi_exec -array macro_detalhe "select dttdhidden2 from detalhe_macro_teclado_td50_virtual where veioid = $veioid and dttdtipo = 258 and dttdmttdoid = $mttdoid " {
		set dttdhidden2 $macro_detalhe(dttdhidden2)
		foreach {ameoid} $dttdhidden2 {
			elog NOTICE "select * from acao_embarcada_mtc600_virtual where aemoid = $ameoid and veioid = $veioid"
			spi_exec -array acao_embarcada "select * from acao_embarcada_mtc600_virtual where aemoid = $ameoid and veioid = $veioid and aemdt_exclusao is null" {
				set condicao ""
				set acao ""
				set aemcondicao_tratada $acao_embarcada(aemcondicao_tratada)
				set aemacao_tratada $acao_embarcada(aemacao_tratada)
				foreach {atgoid grupo status obrigatorio} $aemcondicao_tratada {
					spi_exec -array aemacondicao "select traducao_acao_embarcada('condicao','$atgoid $grupo $status $obrigatorio','NULL') as condicao" {
						set condicao_aux "[lindex $aemacondicao(condicao) 0] [lindex $aemacondicao(condicao) 1] [lindex $aemacondicao(condicao) 2]"
						if { [lindex $aemacondicao(condicao) 0] != "" } {
							append condicao "$condicao_aux, "
						}
						
					}
				}
				foreach {atgoid grupo status obrigatorio} $aemacao_tratada {
					spi_exec -array aemacao "select traducao_acao_embarcada('acao','NULL','$atgoid $grupo $status $obrigatorio') as acao" {
						set acao_aux "[lindex $aemacao(acao) 0] [lindex $aemacao(acao) 1] [lindex $aemacao(acao) 2]"
						if { [lindex $aemacao(acao) 0] != "" } {
							append acao "$acao_aux, "
						}
						
					}
				}

	spi_exec "insert into sequenciamento_macro_relatorio values('$sqmnome', '$sqmdescricao', '$sqmcriacao_embarque', '$sqmcadastro', $mttdoid, '$mttdnome', '$mttdconteudo',  $ameoid,'$condicao', '$acao')"
			}
		}
  
	}
}
$function$
