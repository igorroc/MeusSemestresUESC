-- Renomeia a tabela professor
alter table professor rename to docente;

-- Renomeia a tabela aluno
alter table aluno rename to discente;

-- Cria e mostra variáveis
declare @nome varchar(50), @idade int;
set @nome = 'Igor Rocha'
set @idade = 21
select @nome as Nome, @idade as Idade;

-- Cria seleções e salva na variável
declare @professor varchar(50);
select @professor = nome from professor where id=1;
select @professor as 'Nome do Professor'
