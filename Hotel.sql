create database Hotel;

use Hotel;

create table Quartos (
idquartos int primary key not null,
numero int,
andar int,
tipo varchar(45),
valor Double 
);

create table Hospedes (
idhospedes int primary key not null,
nome varchar(45),
cpf varchar(45),
datanasci DATE 
);

create table Reservas (
id_quartos int,
id_hospedes int,
dataentrada varchar(45),
datasaida DATE,
foreign key (id_quartos) references Quartos (idquartos),
foreign key (id_hospedes) references Hospedes (idhospedes) 
);

create table Telefones (
idtelefones int primary key not null,
numero varchar(45),
id_hospedes int,
foreign key (id_hospedes) references Hospedes(idhospedes) 
);

alter table Quartos
modify numero varchar(10) not null unique;

alter table Quartos
add column descricao varchar(100);

alter table Quartos
modify andar smallint;

alter table Quartos
drop  column descricao;

alter table Reservas
modify dataentrada DATE not null;

alter table Reservas 
add column valortotal double;

alter table Hospedes
modify cpf varchar(11) unique;

alter table Hospedes
change datanasci datanascimentocliente date;

alter table Hospedes
add column email varchar(100);

alter table Telefones
add column ddd int;


INSERT INTO Quartos(idquartos, numero, andar, tipo, valor)
VALUES
(1, 101, 1, 'Simples', 100.00),
(2, 102, 1, 'Duplo', 150.00),
(3, 103, 1, 'Luxo', 250.00),
(4, 104, 2, 'Presidencial', 500.00);

insert into Hospedes(idhospedes, nome, CPF, datanascimentocliente, email)
VALUES
(1, 'Carlos', '11111111111', '1980-05-10', 'carlos@email.com'),
(2, 'Maria', '22222222222', '1975-08-20', 'maria@email.com'),
(3, 'Joao', '33333333333', '1990-03-15', 'joao@email.com'),
(4, 'Pedro', '44444444444', '2000-11-25', 'pedro@email.com'),
(5, 'Ana', '55555555555', '1985-02-18', 'ana@email.com'),
(6, 'Lucas', '66666666666', '1995-07-30', 'lucas@email.com');

INSERT INTO Telefones
(idtelefones, numero, id_hospedes, ddd)
VALUES
(1, '999991111', 1, 71),
(2, '999992222', 1, 71),
(3, '999993333', 2, 71),
(4, '999994444', 2, 71),
(5, '999995555', 3, 71),
(6, '999996666', 3, 71),
(7, '999997777', 4, 71),
(8, '999998888', 4, 71),
(9, '999999999', 5, 71),
(10, '988881111', 5, 71),
(11, '988882222', 6, 71),
(12, '988883333', 6, 71);


INSERT INTO Reservas
(id_quartos, id_hospedes, dataentrada, datasaida, valortotal)
VALUES
(1, 1, '2026-01-10', '2026-01-12', 200.00),
(2, 2, '2026-01-15', '2026-01-18', 450.00),
(3, 3, '2026-02-01', '2026-02-03', 500.00),
(4, 4, '2026-02-05', '2026-02-07', 200.00);


delete from Telefones 
where idtelefones =12;


update Reservas

set dataentrada ='2026-08-15'

where id_hospedes =3 and id_quartos = 3;


update Hospedes 

set nome = 'inalia'

where idhospedes = 3;

select * from Hospedes
order by nome asc;

select nome, datanascimentocliente from Hospedes
order by datanascimentocliente limit 3;