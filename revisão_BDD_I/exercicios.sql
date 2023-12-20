-- 1. Listar nome e sobrenome ordenado por sobrenome

SELECT nome,sobrenome FROM empregado ORDER BY sobrenome;

-- 2. Listar todos os campos de funcionários ordenados por cidade

SELECT * FROM empregado ORDER BY cidade;

-- 3. Liste os funcionários que têm salário superior a R$ 1.000,00 ordenados pelo nome completo

SELECT * FROM empregado WHERE salario > 1.000 ORDER BY nome,segundo_nome,sobrenome;

-- 4. Liste a data de nascimento e o primeiro nome dos funcionários ordenados do mais novo para o mais velho

SELECT datanasc,nome FROM empregado order by datanasc DESC;

-- 5. Liste os funcionários como uma listagem telefônica (sobrenome, primeiro nome, nome do meio)

select concat(sobrenome, ', ', nome, ' ', ifnull(segundo_nome,'')) as nome_completo
from empregado
order by sobrenome, nome, segundo_nome;

-- 6. Liste o total da folha de pagamento

SELECT SUM(salario) AS totalFolhaPagamento from empregado;

-- 7. Liste o nome, sobrenome, o nome do departamento

select concat(empregado.nome, ' ', sobrenome) as nomecompleto, departamento.nome
from empregado
inner join departamento
on empregado.cod_depto = departamento.cod_depto;

-- 8. Liste o nome, nome do meio, sobrenome, o nome do departamento e a função de todos os funcionários nos projetos 

select e.nome, e.segundo_nome, e.sobrenome, d.nome, ep.papel_emp
from empregado as e
join departamento as d
on e.cod_depto = d.cod_depto
join emp_proj as ep
on e.cod_emp = ep.cod_emp;

-- 9. Liste todos os departamentos com seus respectivos gerentes

select concat(empregado.nome, ' ', ifnull(segundo_nome, '') , ' ' , sobrenome) as nomecompleto,
empregado.cod_depto, departamento.nome
from empregado
inner join departamento
on empregado.cod_depto = departamento.cod_depto
where gerente = 'Sim';

-- 10. Liste o valor da folha de pagamento de cada departamento (nome)

select departamento.nome, sum(salario) as Total
from departamento
inner join empregado
on departamento.cod_depto = empregado.cod_depto
group by departamento.nome;

-- 11. Liste os departamentos dos funcionários que têm a função de “Desenvolvedor” nos Projetos

select concat(empregado.nome, ' ', ifnull(segundo_nome, '') , ' ' , sobrenome) as nomecompleto, 
       departamento.nome, emp_proj.papel_emp
from empregado
inner join departamento
on empregado.cod_depto = departamento.cod_depto
inner join emp_proj
on empregado.cod_emp = emp_proj.cod_emp
where emp_proj.papel_emp = 'Desenvolvedor';

-- 12. Liste a quantidade de funcionários desta empresa

SELECT count(*) as qtde_funcionarios from empregado;

-- 13. Liste o salário médio pago pela empresa

select AVg(salario) as mediaSalario from empregado;

-- 14. Liste o menor salário pago pela empresa em cada departamento e seu funcionário

select departamento.nome, min(salario) as Total
from departamento
inner join empregado
on departamento.cod_depto = empregado.cod_depto
group by departamento.nome;

-- 15. Liste o nome completo de todos os funcionários que não tenham segundo nome

select concat(nome, ' ', sobrenome) as nome from empregado
where segundo_nome is null;

-- 16. Liste o nome do departamento e do funcionário ordenados por departamento e funcionário

SELECT d.nome, e.nome,e.sobrenome
from empregado as e
inner join departamento as d
on e.cod_depto = d.cod_depto
order by d.nome;

-- 17. Liste os nomes dos funcionários que moram em Guarulhos e que exerçam a função de “Analista”

select e.nome,e.cidade,ep.papel_emp
from empregado as e
join emp_proj as ep
on e.cod_emp = ep.cod_emp
where e.cidade = 'Guarulhos'
and ep.papel_emp = 'Analista';

-- 18. Liste os nomes dos funcionários que trabalham no departamento Recursos Humanos

SELECT e.nome,e.sobrenome,d.nome
from empregado as e
inner join departamento as d
on e.cod_depto = d.cod_depto
where d.nome = 'Recursos Humanos';

-- 19. Liste o nome e o departamento de todos os funcionários que ganham mais do que algum gerente

select concat(empregado.nome, ' ', ifnull(segundo_nome, '') , ' ' , sobrenome) as nomecompleto,
       departamento.nome
from empregado
inner join departamento
on empregado.cod_depto = departamento.cod_depto
where salario > (select min(salario) from empregado where gerente = 'Sim');

select cod_emp, salario from empregado where gerente = 'Sim';

select min(salario) from empregado where gerente = 'Sim';
