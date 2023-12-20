-- Crie uma view denominada vw_DepCidade que liste o nome de cada departamento com o nome da cidade onde este departamento está localizado.

create view vw_DepCidade 
AS
	select dep.nome AS nome_dep, cid.nome AS nome_cidade
	from departamento as dep
	inner join cidade as cid
	on dep.cod_cidade = cid.cod_cidade
;

-- Listar todos os registros da view vw_DepCidade.

select * from vw_DepCidade;

-- Listar todos os registros da view vw_DepCidade ordenados pelo nome da cidade.

select * from vw_DepCidade
ORDER BY nome_cidade;

-- É possível criar uma view a partir do comando obtido no resultado anterior? Caso possível, crie essa view.

create view vw_DepCidade_OrderByCidade
AS
	select * from vw_DepCidade
	ORDER BY nome_cidade;
;

select * from vw_DepCidade_OrderByCidade;

-- Crie uma view denominada vw_DepCidadeU, a partir de vw_DepCidade que mostre somente os departamentos localizados em Uberlândia.

create view vw_DepCidadeU
AS
	SELECT c.nome AS "cidade"
	from cidade AS c
	where c.nome = "Uberlândia"
;

-- Listar todos os registros da view vw_DepCidadeU.

select * from vw_DepCidadeU;

-- Crie uma view denominada de vw_OpSalario, a qual lista a soma e média de todos os salários dos empregados.

create view vw_OpSalario
AS
	SELECT SUM(salario) as soma_salario, AVG(salario) AS media_salario
	from empregado
;

select * from vw_OpSalario;

-- Considere que você tem permissão para acessar somente a view vw_OpSalario. Execute uma consulta que retorne (calcule) o número de empregados existentes.

select soma_salario / media_salario from vw_OpSalario;
