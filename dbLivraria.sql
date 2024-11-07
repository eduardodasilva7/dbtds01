drop database dbLivraria;

create database dbLivraria;

use dbLivraria;

create table tbAlunos(
  raAluno int primary key,
  nome varchar(45),
  email varchar(45),
  telefone varchar(45)
);

create table tbColaboradores(
  idColaborador int primary key,
  cpf varchar(45),
  nome varchar(45),
  email varchar(45),
  cargo varchar(45)
);

create table tbLivros(
  ISBN int primary key,
  raAluno int,
  idColaborador int,
  nome varchar(45),
  autor varchar(45),
  paginas varchar(45),
  foreign key(raAluno) references tbALunos(raAluno),
  foreign key(idColaborador) references tbColaboradores(idColaborador)
);

create table tbEmprestimos(
  idEmpr int primary key,
  idColaborador int,
  dataEmprestimo date,
  dataDevolucao date,
  livroLSBN varchar(45),
  cpfColaborador varchar(45),
  foreign key(idColaborador) references tbColaboradores(idColaborador)
);



desc tbALunos;
desc tbColaboradores;
desc tbLivros;
desc tbEmprestimos;
