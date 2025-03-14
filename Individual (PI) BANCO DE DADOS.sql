create database ProjetoPI;
use ProjetoPI;

create table Empresa(
idEmpresa int primary key auto_increment,
nomeEmp varchar(40) not null,
nomeResp varchar(40) not null,
cnpj char(14) not null unique,
email varchar(40) not null unique,
cep char(9) not null,
contratação datetime default current_timestamp,
telefone char (11)
);

select * from Empresa;
insert into Empresa (nomeEmp, nomeResp, cnpj, email, cep, telefone) values
('fruta', 'banana', '50484729000159', 'banana@loveu.com', '06524-240', '1138994862'),
('animal', 'tubarao', '83120439000185', 'tubaraoo@morde.com', '02995-900', '1136706300'),
('objeto', 'dado', '83120447852185', 'dadinho@joga.com', '02442-560', '11542689567');

select*from Empresa;
select cep from Empresa where cep like '%2%';
select telefone from empresa order by telefone desc;
update empresa set telefone = "491028922" where idEmpresa= 4;
update empresa set cep = '46525-601' where idEmpresa= 5;
update empresa set email = 'dados@joga.com' where idEmpresa = 6;
alter table empresa add column jogo varchar(30);
alter table empresa add constraint chkJogo check(jogo in ('sim', 'não'));
alter table empresa drop column jogo;
delete from empresa where idempresa = 4;
delete from empresa where idempresa = 5;
select*from empresa;
select cnpj as nomeResp from empresa;


create table Sensor (
idSensor int primary key auto_increment,
empresa varchar(40) not null,
dtInstalacao datetime default current_timestamp,
statusMq2 varchar(20) not null,
constraint chkStt 
	check(statusMq2 in ('ativo', 'inativo', 'manutenção'))
);

select*from sensor;
insert into Sensor (empresa, statusMq2) values
('fruta', 'ativo'),
('animal', 'inativo'),
('objeto', 'manutenção');

select*from Sensor;
select statusMq2 from Sensor where statusMq2 like '%e%';
select empresa from sensor order by empresa desc;
update Sensor set empresa = "animal marinho" where idSensor= 2;
update Sensor set statusMq2 = 'ativo' where idSensor= 3;
update Sensor set empresa = 'frutas' where idSensor = 1;
alter table Sensor add column locall varchar(30);
alter table Sensor add constraint chkLocall check(Locall in ('longe', 'perto'));
alter table Sensor drop column Locall;
delete from Sensor where idsensor = 1;
select*from Sensor;
truncate sensor;



create table Leitura (
idLeitura int primary key auto_increment,
dia datetime default current_timestamp,
atualizacao datetime default current_timestamp,
ppm float,
porcentagem float,
nivel varchar(30),
setor varchar(40),
constraint chkNv
	check(nivel in ('baixo', 'médio', 'alto'))
);

select*from Leitura;
insert into Leitura (porcentagem, nivel, setor) values
(15, 'medio', 'fruta'),
(02, 'baixo', 'animal'),
(29, 'alto', 'objeto');

alter table Leitura drop column ppm;
select*from Leitura;
select porcentagem from Leitura where porcentagem like '1%';
select nivel from Leitura order by nivel desc;
update Leitura set setor = "cavalo" where idLeitura= 1;
update Leitura set porcentagem = '25' where idLeitura= 2;
update Leitura set setor = 'frutas' where idLeitura = 3;
alter table Leitura add column amonia varchar(30);
alter table Leitura add constraint chkamonia check(amonia in ('longe', 'perto'));
alter table Leitura drop column amonia;
delete from Leitura where idleitura = 3;
select*from Leitura;
truncate Leitura;


create table Manutencao (
idManutencao int primary key auto_increment,
nomeResp varchar(40) not null,
dataHora datetime default current_timestamp,
setor varchar(40)
);

insert into Manutencao (nomeResp, setor) values
('willian', 'fruta'),
('thalita', 'animal'),
('julia', 'objeto');

select*from Manutencao;
select nomeResp from Manutencao where nomeResp like 'j%';
select setor from Manutencao order by setor desc;
update Manutencao set setor = "urubu" where idManutencao= 2;
update Manutencao set nomeResp = 'nicolly' where idManutencao= 1;
update Manutencao set nomeResp = 'sandro' where idManutencao = 3;
alter table Manutencao add column sensor varchar(30);
alter table Manutencao add constraint chksensor check(sensor in ('tem', 'ligado'));
alter table Manutencao drop column sensor;
delete from Manutencao where idManutencao = 3;
select*from Manutencao;
truncate Manutencao;