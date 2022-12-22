--
-- Trabalho realizado por:
-- Igor Lima Rocha
-- Maira Gomes
--
-- ! 1 -----------------
SELECT
    CONCAT(
        'MAX(IF(pa.fieldname = ''',
        fieldname,
        ''', pa.fieldvalue, NULL)) AS ',
        fieldname
    )
FROM
    product_additional;

-- ! 2 -----------------
SELECT
    GROUP_CONCAT(
        DISTINCT CONCAT(
            'MAX(IF(pa.fieldname = ''',
            fieldname,
            ''', pa.fieldvalue,
NULL)) AS ',
            fieldname
        )
    )
FROM
    product_additional;

-- ! 3 -----------------
SELECT
    p.id,
    p.name,
    p.description,
    MAX(IF(pa.fieldname = 'size', pa.fieldvalue, NULL)) AS size,
    MAX(IF(pa.fieldname = 'height', pa.fieldvalue, NULL)) AS height,
    MAX(IF(pa.fieldname = 'color', pa.fieldvalue, NULL)) AS color
FROM
    product p,
    product_additional pa
WHERE
    p.id = pa.id
GROUP BY
    p.id;