drop database dbLojaABC;

create database dbLojaABC;

use dbLojaABC;

create table tbFuncionarios(
  codFunc int,
  nomeFunc varchar(100),
  email varchar(50),
  cpf char(14),
  endereco varchar(100),
  cep char(9),
  numero char(10),
  bairro varchar(100),
  cidade varchar(100),
  estado char(2),
  telefone char(10),
  dataNasc date,
  salario decimal(9,2)
);

insert into tbFuncionarios(codFunc,nomeFunc,email,cpf,endereco,cep,numero,bairro,cidade,estado,telefone,dataNasc, salario) values(1,'edu','edu@gmail.com','458.586.987-81','Rua Dr. Antonio Bento','04750-500','255','Santo Amaro','São Paulo','SP','93737-3737','2000/10/11',1500.50);

desc tbFuncionarios;