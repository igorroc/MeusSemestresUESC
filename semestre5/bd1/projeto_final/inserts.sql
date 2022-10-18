insert into
    departamento(id, nome, email, sigla)
values
    (0, 'Departamento de Ciências Exatas', 'dcet@uesc.br', 'DCET'),
    (1, 'Departamento de Biologia', 'dbio@uesc.br', 'DBIO'),
    (2, 'Departamento de Administração', 'dadm@uesc.br', 'DADM'),
    (3, 'Departamento de Direito', 'ddir@uesc.br', 'DDIR');

insert into
    colegiado(id, nome, email, id_departamento)
values
    (0, 'Colegiado de Computação', 'cic@uesc.br', 0),
    (1, 'Colegiado de Física', 'fis@uesc.br', 0),
    (2, 'Colegiado de Matemática', 'mat@uesc.br', 0),
    (3, 'Colegiado de Administração', 'adm@uesc.br', 2),
    (4, 'Colegiado de Direito', 'dir@uesc.br', 3);

insert into
    docente(id, nome, email, id_departamento)
values
    (0, 'Marcelo Ossamu Honda', 'mohonda@uesc.br', 0),
    (1, 'Hélder Almeida', 'hcalmeida@uesc.br', 0),
    (2, 'Edgar Alexandre', 'ealexandre@uesc.br', 0),
    (3, 'José Maria', 'jose@uesc.br', 1),
    (4, 'João Pedro', 'joao@uesc.br', 2);

insert into
    disciplina(id, nome, carga_horaria, creditos, codigo, semestre, id_colegiado)
values
    (0, 'Estrutura de Dados', 60, 4, 'CET000', 1, 0),
    (1, 'Algoritmos e Programação', 60, 4, 'CET001', 1, 0),
    (2, 'Cálculo I', 60, 4, 'CET002', 1, 0),
    (3, 'Cálculo II', 60, 5, 'CET003', 2, 0),
    (4, 'Cálculo III', 60, 6, 'CET004', 3, 0),
    (5, 'Cálculo IV', 60, 7, 'CET005', 4, 0),
    (6, 'Cálculo V', 60, 8, 'CET006', 5, 0),
    (7, 'Banco de Dados 1', 75, 3, 'CET200', 5, 0),
    (8, 'Banco de Dados 2', 60, 4, 'CET201', 5, 0),
    (9, 'Sistemas Operacionais', 60, 1, 'CET300', 5, 0);


insert into
    horarios(id, id_disciplina, id_docente, dia_semana, horario_inicio, horario_final, turma_disciplina)
values
    (0, 0, 0, 4, '07:30', '09:10', 'T01'),
    (1, 0, 1, 4, '07:30', '09:10', 'T02'),
    (2, 1, 0, 3, '10:50', '12:30', 'T01');

insert into
    indicacao_docente(id, nome, carga_horaria, creditos, codigo, semestre, id_colegiado)
values
    (0, 'Estrutura de Dados', 60, 4, 'CET000', 1, 0),
    (1, 'Algoritmos e Programação', 60, 4, 'CET001', 1, 0),