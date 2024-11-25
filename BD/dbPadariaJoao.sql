drop database dbJoaoPadoca;

create database dbJoaoPadoca;

use dbJoaoPadoca;

create table tbFornecedores(
  codForm int not null auto_increment primary key,
  nome varchar(50),
  email varchar(50),
  telefone char(14),
  cnpj char(18) not null unique
);
 
create table tbClientes(
  codCli int not null auto_increment primary key,
  nome varchar(50),
  cpf char(15) not null unique,
  sexo char(1) default 'M' check(sexo in ('F', 'M'))
);

create table tbEstoque(
  codEst int not null auto_increment primary key,
  codForm int not null,
  nome varchar(50),
  lote char(12),
  quantProd int default 0 check(quantProd >= 5),
  validade date not null,
  dataEntr date,
  horaEntr time,
  preco decimal(9,2),
  foreign key(codForm) references tbFornecedores(codForm) 
);


create table tbFuncionarios(
  codFunc int not null auto_increment primary key,
  nome varchar(50),
  cpf char(15) not null unique,
  rg char(14) unique,
  logradouro varchar(50),
  bairro varchar(50),
  cep char(9),
  funcao varchar(20)
);

create table tbVendedores(
  codVendedor int not null auto_increment primary key,
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
  codVend int not null auto_increment primary key,
  codCli int not null, 
  codVendedor int not null,
  produto varchar(100),
  quantidade int,
  valor decimal(9,2),
  formaPg char (3) check(formaPg in ('Crd', 'Deb', 'Pix', 'Din')),
  foreign key(codCli) references tbClientes(codCli),
  foreign key(codVendedor) references tbVendedores(codVendedor)
);

create table tbCartao(
  codCart int not null auto_increment primary key,
  codCli int not null,
  codVend int not null,
  nome varchar(50),
  cpf char(15) not null unique,
  rg char(14) unique,
  logradouro varchar(50),
  bairro varchar(50),
  cep char(9),
  foreign key(codCli) references tbClientes(codCli),
  foreign key(codVend) references tbVendas(codVend)
);

--inserts 
insert into tbFornecedores(nome,email,telefone,cnpj) values
('Pão Quente Ltda', 'contato@panquente.com.br', '(11) 91234-5678', '12.345.678/0001-90'),
('Delícias da Padaria S.A.', 'vendas@deliciaspadaria.com.br', '(21) 98876-5432', '98.765.432/0001-01'),
('Fornos e Sabores Ltda', 'orcamento@fornose sabores.com.br', '(41) 91111-2222', '22.333.444/0001-23'),
('Bolos e Doces S.A.', 'sac@bolose doces.com.br', '(51) 92222-3333', '33.444.555/0001-34'),
('Serviços de Panificação Pro', 'atendimento@panificacao.com.br', '(31) 99987-6543', '11.222.333/0001-12');

select * from tbFornecedores;

insert into tbClientes(nome,cpf,sexo) values
('Ana Maria da Silva','123.456.789-85','F'),
('Carlos Eduardo Santos','987.684.321-51','M'),
('Fernanda Oliveira','456.789.123-54','F'),
('João Pedro Almeida','321.654.987-12','M'),
('Maria Luiza Souza','654.321.098-76','F');

select * from tbClientes;

insert into tbEstoque(codForm,nome,lote,quantProd,validade,dataEntr,horaEntr,preco) values
(1, 'Pão Francês', '001', 100, '2024-12-01', '2023-10-01', '08:54:32', 0.50),
(2, 'Bolo de Chocolate', '002', 50, '2024-01-15', '2023-10-01','09:00:00', 15.00),
(3, 'Biscoito de Polvilho', '003', 200,'2025-05-02', '2023-10-01', '10:00:00', 2.00),
(4, 'Trota de Maçã', '004',30, '2024-02-10', '2023-10-01','11:00:00', 12.00),
(5, 'Pão de Queijo', '005',150, '2025-06-30',' 2023-10-01','12:00:00',1.50);

select * from tbEstoque;

insert into tbFuncionarios(nome,cpf,rg,logradouro,bairro,cep,funcao)values
('João Silva', '12345678901', '123456789', 'Rua das Flores, 123', 'Centro', '12345000', 'Gerente'),
('Maria Oliveira', '98765432100', '987654321', 'Avenida Brasil, 456', 'Jardim América', '54321000', 'Vendedor'),
('Carlos Pereira', '11122233344', '111333555', 'Travessa do Sol, 789', 'São José', '67890123', 'Padeiro'),
('Ana Souza', '22233344455', '444555666', 'Praça das Palmeiras, 10', 'Vila Nova', '56789123', 'Vendedor'),
('Rafael Santos', '33344455566', '777888999', 'Alameda das Acácias, 45', 'Bela Vista', '78901234', 'Entregador'),('Beatriz Almeida', '44455566677', '333444555', 'Rua das Margaridas, 321', 'Centro', '11222333', 'Vendedor'),
('Lucas Fernandes', '55566677788', '443555666', 'Avenida Rio Branco, 890', 'Boa Vista', '33444555', 'Supervisor'),
('Juliana Costa', '66677788899', '555666777', 'Travessa do Bosque, 45', 'Jardim Europa', '55666777', 'Recepcionista'),
('Pedro Henrique', '77788899900', '666777888', 'Rua São João, 76', 'Santa Luzia', '77888999', 'Vendedor'),
('Camila Santos', '88899900011', '7867888999', 'Avenida Primavera, 123', 'Parque das Flores', '88999000', 'vendedor');

select * from tbFuncionarios;

insert into tbVendedores(codFunc,nome,cpf,rg,logradouro,bairro,cep) values
(2,'Maria Oliveira', '98765432100', '987654321', 'Avenida Brasil, 456', 'Jardim América', '54321000'),
(4,'Ana Souza', '22233344455', '444555666', 'Praça das Palmeiras, 10', 'Vila Nova', '56789123'),
(6,'Beatriz Almeida', '44455566677', '333444555', 'Rua das Margaridas, 321', 'Centro', '11222333'),
(9,'Pedro Henrique', '77788899900', '666777888', 'Rua São João, 76', 'Santa Luzia', '77888999'),
(10, 'Camila Santos', '88899900011', '7867888999', 'Avenida Primavera, 123', 'Parque das Flores', '88999000');

select * from tbVendedores;

insert into tbVendas(codCli,codVendedor,produto,quantidade,valor,formaPg) values
(1, 3,'Pão Francês e Torta de Maçã', 3, 13.00, 'Crd'),
(2, 5, 'Pão de Queijo, Bolo de Chocolate e Biscoito de Polvinho', 5, 21.50, 'Deb'),
(3, 2, 'Pão Francês e Bolo de Chocolate', 7, 18.00, 'Pix'),
(4, 4, 'Pão de Queijo e Biscoito de Polvilho', 8, 13.50, 'Din'),
(5, 1, 'Pão Francês, Bolo de Chocolate e Torta de Maçã', 9, 24.00, 'Crd');

insert into tbCartao(codCli,codVend,nome,cpf,rg,logradouro,bairro,cep) values 
(1, 1, 'Ana Maria da Silva', '123.456.789-85', '12.345.678', 'Rua das Flores, 123', 'Centro', '12345-000'),
(2, 2, 'Carlos Eduardo Santos', '987.684.321-51', '98.765.432', 'Avenida Brasil, 456', 'Jardim Paulista', '54321-000'),
(3, 3, 'Fernanda Oliveira', '456.789.123-54', '45.678.912', 'Travessa Bela Vista, 789', 'Boa Vista', '67890-123'),
(4, 4, 'João Pedro Almeida', '321.654.987-00', '32.165.498', 'Rua São João, 76', 'Santa Luzia', '77888-999'),
(5, 5, 'Maria Luiza Souza', '654.321.098-76', '65.432.109', 'Avenida Primavera, 123', 'Parque das Flores', '88999-000');