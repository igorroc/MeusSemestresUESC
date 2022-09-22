create table pessoa(
	id INT NOT NULL,
	nome VARCHAR(64),
	data_nascimento DATE,
	PRIMARY KEY(id)
);

insert into
	pessoa(id, nome, data_nascimento)
values
	(1, 'Igor Rocha', '07/04/2001'),
	(2, 'João Rupp', '31/03/2000'),
	(3, 'Isaac Lima', '05/11/2000');