insert into
    departamento (id, nome, sigla, data_inicio)
values
    (
        0,
        'Departamento Ciências Exatas e Tecnológicas',
        'DCET',
        to_date('10/10/2000', 'DD/MM/YYYY')
    ),
    (
        1,
        'Departamento de Ciências Agrárias e Ambientais',
        'DCAA',
        to_date('09/10/2000', 'DD/MM/YYYY')
    ),
    (
        2,
        'Departamento de Administracao e Ciências Contabeis',
        'DCAC',
        to_date('08/10/2000', 'DD/MM/YYYY')
    ),
    (
        3,
        'Departamento de Ciências Biológicas',
        'DCB',
        to_date('07/10/2000', 'DD/MM/YYYY')
    ),
    (
        4,
        'Departamento de Ciências Jurídicas',
        'DCJUR',
        to_date('06/10/2000', 'DD/MM/YYYY')
    ),
    (
        5,
        'Departamento de Ciências da Saúde',
        'DCS',
        to_date('05/10/2000', 'DD/MM/YYYY')
    );

insert into
    colegiado (id, nome, sigla, data_inicio, id_departamento)
values
    (
        0,
        'Colegiado de Ciência da Computação',
        'COLCIC',
        to_date('10/10/2010', 'DD/MM/YYYY'),
        0
    ),
    (
        1,
        'Colegiado de Física',
        'COLFIS',
        to_date('09/10/2010', 'DD/MM/YYYY'),
        0
    ),
    (
        2,
        'Colegiado de Medicina',
        'COLMED',
        to_date('08/10/2010', 'DD/MM/YYYY'),
        5
    );

insert into
    curso (
        id,
        nome,
        data_inicio,
        carga_horaria,
        id_colegiado
    )
values
    (
        0,
        'Ciência da Computação',
        to_date('10/10/2011', 'DD/MM/YYYY'),
        200,
        0
    ),
    (
        1,
        'Física',
        to_date('09/10/2011', 'DD/MM/YYYY'),
        550,
        1
    ),
    (
        2,
        'Medicina',
        to_date('08/10/2011', 'DD/MM/YYYY'),
        999,
        2
    );

insert into
    professor (
        id,
        nome,
        data_nascimento,
        data_inicio,
        id_departamento,
        id_curso
    )
values
    (
        0,
        'Marcelo Ossama Honda',
        to_date('10/10/1990', 'DD/MM/YYYY'),
        to_date('10/10/2016', 'DD/MM/YYYY'),
        0,
        0
    ),
    (
        1,
        'Hélder Conceição Almeida',
        to_date('22/08/1991', 'DD/MM/YYYY'),
        to_date('09/10/2015', 'DD/MM/YYYY'),
        0,
        0
    ),
    (
        2,
        'José Francisco',
        to_date('01/01/1961', 'DD/MM/YYYY'),
        to_date('09/10/2000', 'DD/MM/YYYY'),
        0,
        1
    ),
    (
        3,
        'Mariana Sousa',
        to_date('01/01/1995', 'DD/MM/YYYY'),
        to_date('10/10/2018', 'DD/MM/YYYY'),
        5,
        2
    );