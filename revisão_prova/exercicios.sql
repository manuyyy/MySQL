# 1) 

delimiter //

create function nome_funcao (IN receber_idCurso int) 
returns decimal (7,2);
begin

	declare V_vagas int;
    declare V_matriculados int;

	select vagas,matriculados into V_vagas, V_matriculados
    from cursos where cursos.idcurso = receber_idCurso;
    
    if(V_vagas - V_matriculados = 0) then
		return 0;
    else
		return(vagas_utilizadas/total_vagas) * 100;
	

end //

delimiter ;

# 3 
# Crie uma VIEW (Visão) para mostrar os cursos que ainda tem vagas disponíveis.

create view vw_vagasDisponiveis
as select idcurso, nome, vagas - matriculados
from cursos
where vagas - matriculados > 0;

select *
from vw_vagasDisponiveis;

drop view vw_vagasDisponiveis;
