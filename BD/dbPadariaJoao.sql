drop database dbJoaoPadoca;

create database dbJoaoPadoca;

use dbJoaoPadoca;

create table tbFornecedores(
  codForm int not null primary key,
  nome varchar(50),
  email varchar(50),
  telefone char(12),
  cnpj char(18) not null unique
);
 
create table tbClientes(
  codCli int not null primary key,
  nome varchar(50),
  cpf char(15) not null unique,
  sexo char(1) default 'M' check(sexo in ('F', 'M'))
);

create table tbEstoque(
  codEst int not null primary key,
  codForm int not null,
  nome varchar(50),
  lote char(12),
  quatProd int default 0 check(quatProd <= 5),
  validade date not null,
  dataEntr date,
  horaEntr time,
  preco decimal(9,2),
  foreign key(codForm) references tbFornecedores(codForm) 
);

create table tbFuncionarios(
  codFunc int not null primary key,
  nome varchar(50),
  cpf char(15) not null unique,
  rg char(14) unique,
  logradouro varchar(50),
  bairro varchar(50),
  cep char(9),
  funcao varchar(20 )
);

create table tbCartao(
  codCart int not null primary key,
  codCli int not null,
  nome varchar(50),
  cpf char(15) not null unique,
  rg char(14) unique,
  logradouro varchar(50),
  bairro varchar(50),
  cep char(9),
  formaPg varchar(20),
  foreign key(codCli) references tbClientes(codCli)
);

create table tbVendedores(
  codVendedor int not null primary key,
  codFunc int not null,
  nome varchar(50),
  cpf char(15) not null unique,
  rg char(14) unique,
  logradouro varchar(50),
  bairro varchar(50),
  cep char(9),
  foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbVendas(
  codVend int not null primary key,
  codEst int not null,
  codCli int not null, 
  codVendedor int not null,
  produto varchar(50),
  quantidade int,
  valor decimal(9,2),
  formaPg varchar (20),
  foreign key(codEst) references tbEstoque(codEst),
  foreign key(codCli) references tbClientes(codCli),
  foreign key(codVendedor) references tbVendedores(codVendedor)
); 