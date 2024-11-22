drop database dbEstacionamento;

create database dbEstacionamento;

use dbEstacionamento;

create table tbUsuario(
  codUsu int,
  nomeUsu varchar(50),
  senhaUsu varchar(12)
);

create table tbFuncionarios(
  codFunc int,
  nomeFunc varchar(100),
  email varchar(100),
  telefone char(10)
);

create table tbCarros(
  codCar int,
  nomeCar varchar(100),
  placa char(7),
  cor varchar(20)
);

create table tbDiarias(
  codDia int,
  dataEntrada date,
  horaEntrada time,
  dataSaida date,
  horaSaida time
);

desc tbUsuario;
desc tbFuncionarios;
desc tbCarros;
desc tbDiarias;


alter table tbFuncionarios 
add cpf char(14);

alter table tbFuncionarios
add salario decimal(9,2);

desc tbFuncionarios;