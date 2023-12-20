drop database if exists db_empregados;
create database db_empregados;
use db_empregados;

CREATE TABLE cidade (
cod_cidade varchar(5) PRIMARY KEY,
nome Varchar(50) NOT NULL,
estado char(2) NOT NULL
);

CREATE TABLE departamento (
cod_depto varchar(5) PRIMARY KEY,
nome Varchar(50) NOT NULL,
cod_cidade Varchar(5) NOT NULL,
cod_gerente varchar(5),
data_inicio_gerencia date,
constraint fk_depto_cidade  FOREIGN KEY(cod_cidade) REFERENCES cidade(cod_cidade)
);

CREATE TABLE projeto(
cod_proj varchar(5) PRIMARY KEY,
nome Varchar(50) NOT NULL,
data_ini date,
data_fim date,
cod_depto varchar(5),
constraint fk_Proj_depto  FOREIGN KEY(cod_depto) REFERENCES departamento(cod_depto) 
);

CREATE TABLE empregado (
cod_emp varchar(5) PRIMARY KEY,
cod_depto varchar(5) NOT NULL,
nome Varchar(30) NOT NULL,
segundo_nome varchar(20),
sobrenome Varchar(20) NOT NULL,
salario float NOT NULL,
datanasc date NOT NULL,
telefone  Varchar(20) NOT NULL,
cod_empregado_superior varchar(5),
CONSTRAINT fk_depto FOREIGN KEY ( cod_depto ) REFERENCES departamento (cod_depto));

alter table departamento add constraint fk_depto_empregado  FOREIGN KEY(cod_gerente) REFERENCES empregado(cod_emp);

CREATE TABLE endereco_empregado (
cod_emp varchar(5) PRIMARY KEY,
logradouro Varchar(50) NOT NULL,
bairro Varchar(50) ,
numero Varchar(50) NOT NULL,
cod_cidade Varchar(5) NOT NULL,
cep  Varchar(8) NOT NULL,
constraint fk_end_empregado  FOREIGN KEY(cod_emp) REFERENCES empregado(cod_emp),
constraint fk_end_cidade  FOREIGN KEY(cod_cidade) REFERENCES cidade(cod_cidade));


CREATE TABLE emp_proj (
cod_emp varchar(5),
cod_proj varchar(5),
papel_emp Varchar(50),
CONSTRAINT PK_projemp PRIMARY KEY (cod_proj, cod_emp),
constraint fk_projemp  FOREIGN KEY(cod_proj) REFERENCES projeto(cod_proj),
constraint fk_projemp2 FOREIGN KEY(cod_emp) REFERENCES empregado(cod_emp) 
);


insert into cidade values ('C01', 'São Paulo','SP');
insert into cidade values ('C02', 'São José dos Campos','SP');
insert into cidade values ('C03', 'Rio de Janeiro','RJ');
insert into cidade values ('C04', 'Campinas','SP');
insert into cidade values ('C05', 'Vitória','ES');
insert into cidade values ('C06', 'Belo Horizonte','MG');
insert into cidade values ('C07', 'Uberlândia','MG');
insert into cidade values ('C08', 'São Carlos','SP');
insert into cidade values ('C09', 'Santo André','SP');


insert into departamento values ('RH', 'Recursos Humanos','C05',null,null);
insert into departamento values ('TI', 'Tecnologia','C04',null,null);
insert into departamento values ('RP', 'Relações Públicas','C01',null,null);


insert into projeto values ('P1','Projeto 1','2020-01-01','2020-03-01','TI');
insert into projeto values ('P2','Projeto Alfa','2019-12-31','2020-02-28','TI');
insert into projeto values ('P4','Projeto Beta','2019-04-01','2019-05-01','RP');
insert into projeto values ('P5','Projeto Gama','2019-04-01','2019-05-01','RP');
insert into projeto values ('P6','Projeto X','2020-04-01',null,'RP');
insert into projeto values ('P3','Projeto Final','2019-04-01','2019-05-01','TI');
insert into projeto values ('P7','Projeto da disciplina',Null, Null,'TI');


insert into empregado values ('E1','TI','João',null,'Silva',  1000.00, '1980-03-03', '11 2345 6789',null);
insert into empregado values ('E2','TI','João','Robson','Sousa',  2000.00, '1981-04-03',  '11 98765 4321','E1');
insert into empregado values ('E3','RP','Maria','Alice','Silva', 1500.00, '1965-05-10', '21 91234 5678',null);
insert into empregado values ('E4','RH','João','Roberto','Silva',  4000.00, '1970-12-03', '21 97531 2468',null);


insert into endereco_empregado values ('E1', 'Rua dos Passaros',null,'4','C03','12345789');
insert into endereco_empregado values ('E2', 'Av da Saudade','Jd Lucia','567','C09','13579246');
insert into endereco_empregado values ('E3', 'Av Brasil','Jd America','8','C07','24567890');
insert into endereco_empregado values ('E4', 'Av Brasil',null,'40','C07','23235678');

update departamento set cod_gerente = 'E1', data_inicio_gerencia = '2023-03-01' where  cod_depto = 'TI';
update departamento set cod_gerente = 'E3', data_inicio_gerencia = '2023-08-01' where  cod_depto = 'RP';
update departamento set cod_gerente = 'E4', data_inicio_gerencia = '2023-07-01' where  cod_depto = 'RH';

insert into emp_proj values ('E1','P1','Desenvolvedor');
insert into emp_proj values ('E2','P1','Desenvolvedor');
insert into emp_proj values ('E1','P4','Analista');
insert into emp_proj values ('E4','P6','Observador');
insert into emp_proj values ('E4','P5','Controlador de Processos');
insert into emp_proj values ('E1','P7','UX Design');
