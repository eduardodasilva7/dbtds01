drop database dbEscola;

create database dbEscola;

use dbEscola;

create table tbProfessores(
  idProfessor int primary key,
  nome varchar(45),
  email varchar(45),
  cpf int,
  endereco varchar(45),
  numero int,
  complemento varchar(45),
  cidade varchar(45),
  estado varchar(45)
);

create table tbAlunos(
  idAluno int primary key,
  nome varchar(45),
  email varchar(45),
  cpf int,
  endereco varchar(45),
  numero int,
  complemento varchar(45),
  cidade varchar(45),
  estado varchar(45)
);


create table tbCursos(
  idCurso int primary key,
  idProfessor int,
  nome varchar(45),
  foreign key (idPRofessor) references tbProfessores(idProfessor)
);

create table tbCursoAlunos(
  idCurso int,
  idAluno int,
  foreign key (idCurso) references tbCursos(idCurso),
  foreign key (idAluno) references tbAlunos(idAluno)
);
desc tbProfessores;
desc tbAlunos;
desc tbCursoAlunos;
desc tbCursos;
