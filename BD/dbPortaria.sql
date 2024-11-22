drop database dbPortaria;

create database dbPortaria;

use dbPortaria;

create table tbFuncionarios(
  codFunc int not null auto_increment,
  nome varchar(100) not null,
  rg char(14) unique,
  cpf char(15) not null unique,
  sexo char(1) default 'F' check(sexo in('F', 'M')),
  salario decimal(9,2) default 0 check(salario >= 0),
  primary key(codFunc)
);

create table tbClientes(
  codCli int not null auto_increment primary key,
  nome varchar(50),
  email varchar(50),
  telCel char(12)
);

create table tbFornecedores(
  codForm int not null  auto_increment primary key,
  nome varchar(100),
  email varchar(100),
  telefone char(12),
  cnpj char(18) not null unique
);

create table tbUsuarios(
  codUsu int not null auto_increment primary key,
  nome varchar(50) not null,
  senha varchar(20) not null,
  codFunc int not null,
  foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbProdutos(
  codProd int not null auto_increment primary key,
  descricao varchar(100) not null,
  lote char(12),
  validade date not null,
  dataEntr date,
  horaEntr time,
  quantidade int,
  preco decimal(9,2),
  codForm int not null,
  foreign key(codForm) references tbFornecedores(codForm)
);

create table tbVendas(
  codVend int not null auto_increment primary key,
  valor decimal(9,2),
  quantidade int,
  dataVend date,
  horaVend time,
  codUsu int not null,
  codProd int not null,
  codCli int not null,
  foreign key(codUsu) references tbUsuarios(codUsu),
  foreign key(codProd) references tbProdutos(codProd),
  foreign key(codCli) references tbClientes(codCli)
);

insert into tbFuncionarios (nome, rg, cpf, sexo, salario) 
values 
('João Silva', '12345678901234', '123.456.789-01', 'M', 2500.00),
('Maria Oliveira', '98765432109876', '987.654.321-00', 'F', 3000.00),
('Carlos Pereira', '45612378901234', '456.123.789-99', 'M', 1500.50);

insert into tbClientes(codCli,nome,email,telCel)values
(1,'João','joao@gmail.com','11999999999'),
(2,'Maria','maria@gmail.com','11999999999'),
(3,'Carlos','carlos@gmail.com','11999999999');

insert into tbFornecedores(nome,email,telefone,cnpj)values
('João Silva','joao@gmail.com','11999999999','43.846.214/0001-91'),
('Maria Oliveira','maria@gmail.com','11999999999','45.846.214/0001-91'),
('Carlos Pereira','carlos@gmail.com','11999999999','44.846.214/0001-91');

insert into tbUsuarios(nome,senha,codFunc)values 
('João Silva', 'password123', 1),
('Maria Oliveira', 'senha123', 2),
('Carlos Pereira', 'securepass456', 3);

insert into tbProdutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForm)values
('Coca-Cola', '123456', '2024-01-05','2022-12-31', '11:46:20',10,25.35,1),
('Pepsi', '654321', '2024-06-30', '2023-06-15', '10:30:00', 20, 22.50, 2),
('Guaraná Antarctica', '789123', '2024-11-15', '2023-07-20', '09:15:00', 15, 20.00, 3),
('Fanta Laranja', '987654', '2024-03-31', '2023-11-01', '08:45:00', 30, 24.00, 1),
('Sprite', '321789', '2024-12-31', '2023-08-12', '12:00:00', 25, 23.75, 2),
('Água Mineral', '456987', '2025-05-30', '2023-10-15', '14:20:00', 40, 18.00, 3);

insert into tbVendas(valor,quantidade,dataVend,horaVend,codUsu,codProd,codCli)values
(25, 5, '2024-11-21', '08:34:05', 1, 1, 2),
(50, 10, '2023-12-10', '05:40:50', 1, 2, 2),
(75, 15, '2023-11-20', '09:30:00', 1, 3, 3);



select * from tbClientes;
select * from tbFornecedores;
select * from tbFuncionarios;
select * from tbUsuarios;

-- inner join
select func.nome as 'Nome do Funcionário',usu.nome as 'Nome do Usuario' from tbUsuarios as usu inner join tbFuncionarios as func on usu.codFunc = func.codFunc where func.nome like '%s%';

select func.nome as 'Nome do funcionario',cli.nome as 'Nome do cliente',prod.descricao 'Nome do produto',vend.quantidade as 'Quantidade',vend.valor as 'Preço'
from tbVendas as vend
inner join tbFuncionarios
as func on func.codFunc = vend.codUsu
inner join tbClientes 
as cli on vend.codCli = cli.codCli
inner join
tbProdutos as prod on vend.codProd = prod.codProd;

-- Nome do fornecedor, lote do produto , validade do produto, 
-- email do fornecedor, quantidade de produto, 
-- cnpj do fornecedor, preço do produto.
 
-- A pergunta é para a tabela produtos.

select fornc.nome as 'Nome do fornecedor',prod.lote as 'Lote do produto',prod.validade as 'Validade do produto',fornc.email as 'Email do fornecedor',prod.quantidade as 'Quantidade de produto',fornc.cnpj 'CNPJ',prod.preco 'Preco'
from tbProdutos as prod
inner join tbFornecedores as fornc
on prod.codForm = prod.codForm;

--lote do produto, email do fornecedor , nome do cliente 

select prod.lote,fornc.email,cli.nome
from tbVendas as vend
inner join tbProdutos as prod
on vend.codProd = prod.codProd
inner join tbFornecedores as fornc
on fornc.codForm = vend.codProd
inner join tbClientes as cli
on vend.codCli = cli.codCli;