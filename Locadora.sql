create database Locadora;

use Locadora;


create table carros (
idcarro int primary key auto_increment,
placa varchar(45),
ano varchar(45),
cor varchar(45) 
);

create table clientes (
idclientes int primary key auto_increment,
nome varchar(45),
CPF varchar(45),
datanasci DATE 
);

create table aluguel (
idCarros int ,
idClientes int,
dataaluguel varchar(45),
datafinal DATE 
foreign key (idClientes) references clientes(idclientes),
foreign key (idCarros) references carros(idCarro)
);

create table telefones (
idtelefone int primary key auto_increment,
numero varchar(45),
idClientes int,
foreign key (idClientes) references clientes(idclientes)

);



alter table carros
modify placa varchar(12) not null unique;

alter table carros
add modeleo varchar(45);

alter table carros
modify ano year;


alter table carros
drop column modeleo;


alter table aluguel
modify dataaluguel DATE not null;

alter table aluguel
add valor double;

alter table clientes
modify CPF varchar(11) unique;

alter table clientes
change datanasci DATADENASCIMENTO DATE;

alter table clientes

add column CNH varchar (45) ;

alter table telefones
add  column DDD int ;

insert into carros(placa,ano,cor)
values('ABC1234', 2018, 'Preto'),
('XYZ5678', 2020, 'Branco'),
('JKL1111', 2019, 'Azul'),
('MNO2222', 2021, 'Cinza'),
('PQR3333', 2017, 'Vermelho'),
('STU4444', 2022, 'Branco'),
('VWX5555', 2016, 'Preto'),
('YZA6666', 2018, 'Prata'),
('BCD7777', 2023, 'Azul'),
('EFG8888', 2020, 'Preto');

insert into clientes(nome,CPF,DATADENASCIMENTO,CNH)
values('João Silva', '11111111111', '1980-03-12', '1234567890'),
('Maria Souza', '22222222222', '1992-07-25', '2233445566'),
('Pedro Lima', '33333333333', '1975-09-09', '9876543210'),
('Ana Costa', '44444444444', '1985-02-15', '4455667788'),
('Lucas Pinto', '55555555555', '1990-05-20', '6677889900'),
('Clara Reis', '66666666666', '2000-01-10', '5566778899');

insert into telefones(numero,DDD,idClientes)
values ('912345678', '11', 1), ('998765432', '11', 1),
('934567890', '21', 2), ('987654321', '21', 2),
('945678901', '31', 3), ('956789012', '31', 3),
('967890123', '41', 4), ('978901234', '41', 4),
('989012345', '51', 5), ('990123456', '51', 5),
('901234567', '61', 6), ('912345678', '61', 6);

insert into aluguel (idCarros,idClientes,dataaluguel,datafinal,valor)
values (1, 1, '2021-01-10', '2021-01-15', 300.00),
(2, 2, '2021-02-12', '2021-02-20', 450.00),
(3, 3, '2021-03-05', '2021-03-10', 250.00),
(4, 4, '2021-04-01', '2021-04-07', 400.00),
(5, 5, '2021-05-10', '2021-05-15', 350.00),
(6, 6, '2021-06-18', '2021-06-25', 500.00),
(7, 1, '2021-07-10', '2021-07-12', 200.00),
(8, 2, '2021-08-15', '2021-08-20', 300.00),
(9, 3, '2021-09-05', '2021-09-12', 600.00),
(10, 4, '2021-10-01', '2021-10-05', 280.00);
-- delete apaga dados e drop apaga a estrutura 

delete from telefones

where idtelefone= 12;


-- forma dois 

delete from telefones

order by idtelefone desc limit 1 ; 


update aluguel 

set dataaluguel = '2021-06-30'

where idCarros = 9 and idClientes= 3;


update clientes

set nome ='josé Lima'

where idclientes=3;

insert into aluguel(idCarros,idClientes,dataaluguel,datafinal,valor)
values (1, 6,curdate(),curdate(), 200.00);



delete from telefones 
where idtelefone = 1;

insert into clientes (nome,CPF,DATADENASCIMENTO,CNH)
values('joao','2112331','1980-03-12','545644'),
('joao','21123','1980-03-12','545644');


select * from clientes

order by nome asc;

select cor,count(*) as total_carros
from carros
group by cor;


select nome from clientes
where idclientes not in (select idclientes from aluguel);

select nome,DATADENASCIMENTO from clientes
order by DATADENASCIMENTO limit 3;


