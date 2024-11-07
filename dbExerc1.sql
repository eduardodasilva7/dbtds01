drop database dbExerc1;

create database dbExerc1;

use dbExerc1;

create table tbEstados(
  codEst int primary key,
  sigla char(2)
);

create table tbCidades(
  codCid int primary key,
  codEst int,
  nome varchar(38),
  foreign key (codEst) references tbEstados(codEst)
);

create table tbBairros(
  codBairro int primary key,
  codCid int,
  nome varchar(100),
  foreign key (codCid) references tbCidades(codCid)
);

create table tbEnderecos(
  codEndereco int primary key,
  codBairro int,
  tipo_local varchar(15),
  logradouro varchar(128),
  numero int,
  complemento varchar(255),
  foreign key (codBairro) references tbBairros(codBairro)
);

create table tbSolicitantes(
  codSoli bigint primary key,
  codEndereco int,
  foreign key (codEndereco) references tbEnderecos(codEndereco)
);

create table tbServicos(
  codServico bigint primary key,
  codEndereco int,
  codSoli bigint,
  foreign key (codEndereco) references tbEnderecos(codEndereco),
  foreign key (codSoli) references tbSolicitantes(codSoli)
);

create table tbPontos(
  codPonto bigint primary key,
  codEndereco int,
  foreign key (codEndereco) references tbEnderecos(codEndereco)
);



desc tbEnderecos;
desc tbBairros;
desc tbCidades;
desc tbEstados;
desc tbServicos;
desc tbPontos;
desc tbSolicitantes;