--
-- Trabalho realizado por:
-- Igor Lima Rocha
-- Maira Gomes
--
-- ! 1 -----------------
SELECT
    Empresa,
    Cidade,
    GROUP_CONCAT(
        (
            CASE
                Descontinuado
                WHEN 0 THEN Id_DimProdutos
                ELSE NULL
            END
        )
    ) AS Produtos_Descontinuado_0,
    GROUP_CONCAT(
        (
            CASE
                Descontinuado
                WHEN 1 THEN Id_DimProdutos
                ELSE NULL
            END
        )
    ) AS Produtos_Descontinuado_1
FROM
    dim_fornecedores,
    fat_empresa,
    dim_produtos
WHERE
    Id_dimFornec = IdDimFornec
    and Id_dimProdutos = IdDimProdutos
GROUP BY
    Empresa,
    Cidade;

SELECT
    Empresa,
    Cidade,
    Id_DimProdutos
FROM
    dim_produtos;

-- ! 2 -----------------
SELECT
    Empresa,
    Cidade,
    Descontinuado,
    Id_DimProdutos
FROM
    Dim_Fornecedores,
    Fat_Empresa,
    Dim_Produtos
WHERE
    Id_dimFornec = IdDimFornec
    and Id_dimProdutos = IdDimProdutos;

-- ! 3 -----------------
SELECT
    DATE_FORMAT(dataentrega, '%M') AS `mes`,
    COUNT(*) AS `conta_registro`,
    SUM(frete) AS `Total_Frete`
FROM
    `pedidos`
WHERE
    `dataped` BETWEEN '1996-01-01'
    AND '1996-12-31'
GROUP BY
    MONTH(dataentrega);

-- ! 4 -----------------
SELECT
    DATE_FORMAT(dataped, '%M') AS `month`,
    COUNT(DISTINCT desconto) AS `product_count`,
    COUNT(*) AS `contar`,
    SUM(precoprod) AS `turnover`,
    SUM(`dim_produtos`.`descontinuado` = 0) AS `numero0`,
    SUM(
        IF(
            `dim_produtos`.`descontinuado` = 0,
            `totalfrete`,
            0
        )
    ) AS `frete0`,
    SUM(`dim_produtos`.`descontinuado` = 1) AS `numero1`,
    SUM(
        IF(
            `dim_produtos`.`descontinuado` = 1,
            `totalfrete`,
            1
        )
    ) AS `frete1`
FROM
    `dim_produtos`
    INNER JOIN `fat_empresa` ON Id_dimprodutos = Iddimprodut
    LEFT JOIN dim_datas ON id_dimprodutos = iddimdata
    LEFT JOIN dim_clientes ON Id_dimclient = Iddimclient
WHERE
    dataped BETWEEN '1996-01-01'
    AND '1996-12-31'
GROUP BY
    MONTH(dataped);