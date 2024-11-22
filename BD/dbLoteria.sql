-- apagar o banco de dados
drop database dbLoterica;
-- criar o banco de dados
create database dbLoterica;
-- acessar o banco de dados
use dbLoterica;
-- criar as tabelas
create table tbFuncionarios(
codFunc int,
nome varchar(100),
email varchar(100),
telefone char(9),
cpf char(14));
 
-- inserindo registros nas tabelas
insert into tbFuncionarios(codFunc,nome,email,telefone,cpf)
	values(1,'Paulo Antunes da Silva',
		'paulo.asilva@hotmail.com','94521-7852',
		'253.254.258-77');
		
insert into tbFuncionarios(codFunc,nome,email,telefone,cpf)
	values(1,'Paulo Antunes da Silva',
		'andre@hotmail.com','94521-7852',
		'253.254.258-77');

insert into tbFuncionarios(codFunc,nome,email,telefone,cpf)
	values(1,'Paulo Antunes da Silva',
		'eduardo@hotmail.com','94521-7852',
		'253.254.258-77');

insert into tbFuncionarios(codFunc,nome,email,telefone,cpf)
	values(1,'Paulo Antunes da Silva',
		'silveira@hotmail.com','94521-7852',
		'253.254.258-77');
-- visualizando os registros das tabelas
select * from tbFuncionarios;