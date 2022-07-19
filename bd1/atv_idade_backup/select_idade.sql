SELECT
    nome,
    data_nascimento,
    floor(
        DATE_PART(
            'day',
            now() - data_nascimento
        ) / 365.25
    ) as idade
from
    pessoa;