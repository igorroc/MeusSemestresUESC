--
-- Trabalho realizado por:
-- Igor Lima Rocha
-- Maira Gomes
--
-- ! 1  ------------------
SELECT
    DESCRI,
    dataped,
    trimestre,
    mes,
    semana,
    format(sum(precoprod), 2) as TotalPreco
FROM
    dim_produtos,
    dim_datas,
    fat_empresa
WHERE
    id_data = iddimdata
    and id_dimprodutos = iddimprodut
GROUP BY
    DESCRI,
    dataped,
    trimestre,
    mes,
    semana WITH ROLLUP;

-- ! 2  ------------------
SELECT
    DESCRI,
    dataped,
    trimestre,
    mes format(sum(precoprod), 2) as TotalPreco
FROM
    dim_produtos,
    dim_datas,
    fat_empresa
WHERE
    id_data = iddimdata
    and id_dimprodutos = iddimprodut
GROUP BY
    DESCRI,
    dataped,
    trimestre,
    mes WITH ROLLUP;

-- ! 3  ------------------
SELECT
    DESCRI,
    dataped,
    trimestre format(sum(precoprod), 2) as TotalPreco
FROM
    dim_produtos,
    dim_datas,
    fat_empresa
WHERE
    id_data = iddimdata
    and id_dimprodutos = iddimprodut
GROUP BY
    DESCRI,
    dataped,
    trimestre WITH ROLLUP