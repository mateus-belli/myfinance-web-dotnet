CREATE DATABASE myfinance
use myfinance

create table planoconta(
id int identity(1,1) not null,
descricao varchar(50) not null,
tipo char(1) not null,
primary key (id)
);

create table transacao(
id int identity(1,1) not null,
data datetime not null,
valor decimal(9,2),
historico text,
planocontaid int not null,
primary key(id),
foreign key(planocontaid) references planoconta(id)
);

select * from planoconta

insert into planoconta(descricao, tipo)
values('Dividendo de Ações', 'R');

insert into planoconta(descricao, tipo)
values('Salário', 'R');

insert into planoconta(descricao, tipo)
values('Gasolina', 'D');

insert into planoconta(descricao, tipo)
values('Estacionamento', 'D');

insert into planoconta(descricao, tipo)
values('Aluguel', 'D');

insert into planoconta(descricao, tipo)
values('Educação', 'D');

insert into transacao(data, valor, historico, planocontaid)
values('20230214 21:47', 100, 'Gasolina', 4);

insert into transacao(data, valor, historico, planocontaid)
values('20230214 21:47', 1000, 'Aluguel', 5);

insert into transacao(data, valor, historico, planocontaid)
values('20230214 21:47', 8000, 'Salário', 2);

-- Todas as transações de Despesas em Janeiro
select * from transacao t
inner join planoconta p on t.planocontaid = p.id
where p.tipo = 'D' AND t.data >= '20230101' AND t.data <= '20230131'

-- Somatório de transações de receitas e despesas de todo o período
SELECT
	D.TOTAL_DESPESAS,
	R.TOTAL_RECEITAS
FROM 
	(SELECT SUM(VALOR) AS TOTAL_DESPESAS
		FROM TRANSACAO T JOIN planoconta P ON P.ID = T.planocontaid
	WHERE P.TIPO = 'D') AS D,
	(SELECT SUM(VALOR) AS TOTAL_RECEITAS
		FROM TRANSACAO T JOIN planoconta P ON P.ID = T.planocontaid
		WHERE P.TIPO = 'R') AS R

-- Média de transações por mês
select 
	avg(valor) as media,
	MONTH(data) as mes
from transacao
group by MONTH(data)

-- Transaçòes e seus itens de plano de contas
select t.id, t.data, t.valor, p.descricao, p.tipo
from transacao t join planoconta p
on t.planocontaid = p.id