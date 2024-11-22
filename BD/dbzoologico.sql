--Crie uma database chamada ZOOLOGICO.

drop database dbZoologico;

create database dbZoologico;

use dbZoologico;

--Na database ZOOLOGICO, crei uma tabela chamada ANIMAIS com os seguintes
create table tbAnimais(
  codigo int primary key,
  tipo char(15),
  nome char(30),
  idade int,
  valor decimal(10,2),
  procedencia varchar(25)
);

insert into tbAnimais (codigo, tipo, nome, idade, valor) values(1, 'cachorro', 'Djudi', 3, 300.00);
insert into tbAnimais (codigo, tipo, nome, idade, valor) values(2, 'cachorro', 'Sula', 5, 300.00);
insert into tbAnimais (codigo, tipo, nome, idade, valor) values(3, 'cachorro', 'Sarina', 7, 300.00);
insert into tbAnimais (codigo, tipo, nome, idade, valor) values(4, 'gato', 'Pipa', 2, 500.00);
insert into tbAnimais (codigo, tipo, nome, idade, valor) values(5, 'gato', 'Sarangue', 2, 500.00);
insert into tbAnimais (codigo, tipo, nome, idade, valor) values(6, 'gato', 'Clarences', 1, 500.00);
insert into tbAnimais (codigo, tipo, nome, idade, valor) values(7, 'coruja', 'Agnes', 0, 700.00);
insert into tbAnimais (codigo, tipo, nome, idade, valor) values(8, 'coruja', 'Arabela', 1, 700.00);
insert into tbAnimais (codigo, tipo, nome, idade, valor) values(9, 'sapo', 'Quash', 1, 100.00);
insert into tbAnimais (codigo, tipo, nome, idade, valor) values(10, 'peixe', 'Fish', 0, 100.00);



desc tbAnimais;

-- Escreva um comando que exiba todas as colunas e todas as linhas da tabela ANIMAIS.
select * from tbAnimais;

--Escreva um comando que exiba apenas as colunas TIPO e NOME da tabela ANIMAIS, apresentando todos os registros da tabela.

select distinct tipo,nome from tbAnimais;

--Escreva um comando que exiba apenas as colunas TIPO, NOME e IDADE da tabela ANIMAIS, apresentado todos os registros.

select distinct tipo,nome,idade from tbAnimais;

--Escreva um comando que exiba apenas as colunas TIPO e NOME da tabela ANIMAIS apresentando todos os registros. Apresente a legenda da coluna TIPO com o alias [Tipo de Animal] e a coluna nome com o alias [Nome do Animal].

select distinct tipo as 'Tipo de Animal', nome as 'Nome do animal' from tbAnimais;

--Escreva um comando que exiba apenas as colunas TIPO, NOME e IDADE da tabela ANIMAIS apresentando todos os registros. Apresente a legenda da coluna TIPO com o alias [Tipo de Animal], da coluna nome com o alias [Nome do Animal] e da coluna IDADE com o alias [Tempo de Vida].

select distinct tipo as 'Tipo de animal', nome as 'Nome do animal', idade as 'Tempo de vida' from tbAnimais;

--8. Escreva um comando que apresente os dados da tabela ANIMAIS da seguinte forma
update tbAnimais set procedencia = 'Animal Doméstico'; 

select distinct procedencia as 'Procedência', tipo as 'Tipo', nome as 'Nome', idade as 'Tempo de vida' from tbAnimais;

--9. Escreva um comando que apresente os dados da tabela ANIMAIS da seguinte forma

select distinct tipo as 'Tipo', nome as 'Nome', idade as 'Idade', valor as 'Valor Original', valor * 1.1 as 'Valor de venda' from tbAnimais;

--10. Escreva um comando que apresente os dados da tabela ANIMAIS como vemos a seguir, apresentando uma vez os dados repetidos.

select distinct tipo as 'Tipo', valor as 'Valor Original', valor * 1.1 as 'Valor de venda' from tbAnimais ;
