--
-- Trabalho realizado por:
-- Igor Lima Rocha
-- Maira Gomes
--
--
-- Estrutura da tabela `dim_logistica_data`
--
CREATE TABLE `dim_logistica_data` (
  `Id_DimData` int(11) NOT NULL,
  `DataVenda` datetime DEFAULT NULL,
  `DataFrete` datetime DEFAULT NULL,
  `DataEntrega` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

INSERT INTO
  `dim_logistica_data` (
    `Id_DimData`,
    `DataVenda`,
    `DataFrete`,
    `DataEntrega`
  )
VALUES
  (1, '1998-09-07', '1998-09-07', '1998-09-07'),
  (2, '1998-09-07', '1998-09-07', '1998-09-07'),
  (3, '1998-09-07', '1998-09-07', '1998-09-07'),
  (4, '1998-09-07', '1998-09-07', '1998-09-07'),
  (5, '1998-09-07', '1998-09-07', '1998-09-07'),
  (6, '1998-09-07', '1998-09-07', '1998-09-07'),
  (7, '1998-09-07', '1998-09-07', '1998-09-07'),
  (8, '1998-09-07', '1998-09-07', '1998-09-07'),
  (9, '1998-09-07', '1998-09-07', '1998-09-07'),
  (10, '1998-09-07', '1998-09-07', '1998-09-07'),
  (11, '1998-09-07', '1998-09-07', '1998-09-07'),
  (12, '1998-09-07', '1998-09-07', '1998-09-07'),
  (13, '1998-09-07', '1998-09-07', '1998-09-07'),
  (14, '1998-09-07', '1998-09-07', '1998-09-07'),
  (15, '1998-09-07', '1998-09-07', '1998-09-07'),
  (16, '1998-09-07', '1998-09-07', '1998-09-07'),
  (17, '1998-09-07', '1998-09-07', '1998-09-07'),
  (18, '1998-09-07', '1998-09-07', '1998-09-07'),
  (19, '1998-09-07', '1998-09-07', '1998-09-07'),
  (20, '1998-09-07', '1998-09-07', '1998-09-07'),
  (21, '1998-09-07', '1998-09-07', '1998-09-07'),
  (21, '1998-09-07', '1998-09-07', '1998-09-07'),
  (22, '1998-09-07', '1998-09-07', '1998-09-07'),
  (23, '1998-09-07', '1998-09-07', '1998-09-07'),
  (24, '1998-09-07', '1998-09-07', '1998-09-07'),
  (26, '1998-09-07', '1998-09-07', '1998-09-07'),
  (27, '1998-09-07', '1998-09-07', '1998-09-07'),
  (28, '1998-09-07', '1998-09-07', '1998-09-07'),
  (29, '1998-09-07', '1998-09-07', '1998-09-07'),
  (29, '1998-09-07', '1998-09-07', '1998-09-07'),
  (30, '1998-09-07', '1998-09-07', '1998-09-07'),
  (31, '1998-09-07', '1998-09-07', '1998-09-07'),
  (32, '1998-09-07', '1998-09-07', '1998-09-07'),
  (33, '1998-09-07', '1998-09-07', '1998-09-07'),
  (34, '1998-09-07', '1998-09-07', '1998-09-07'),
  (35, '1998-09-07', '1998-09-07', '1998-09-07');

---- --------------------------------------------------------
-- Estrutura da tabela `dim_logistica_estoque`
--
CREATE TABLE `dim_logistica_estoque` (
  `Id_DimRecebimento` int(11) NOT NULL,
  `Grupo` int(11) DEFAULT NULL,
  `Quant_minima` float(10, 2) DEFAULT NULL,
  `Ressuprimento` varchar(5) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

INSERT INTO
  `dim_logistica_estoque` (
    `Id_DimRecebimento`,
    `Grupo`,
    `Quant_minima`,
    `Ressuprimento`
  )
VALUES
  (1, '3', '0,1', 'Nao'),
  (2, '3', '0,2', 'Nao'),
  (3, '6', '0,1', 'Sim'),
  (4, '4', '0,3', 'Sim'),
  (5, '1', '0,2', 'Nao'),
  (6, '1', '0,2', 'Sim'),
  (7, '5', '0,2', 'Nao'),
  (8, '6', '0,2', 'Nao'),
  (9, '1', '0,2', 'Nao'),
  (10, '1', '0,2', 'Nao'),
  (11, '1', '0,2', 'Nao'),
  (12, '1', '0,2', 'Nao'),
  (13, '1', '0,2', 'Nao'),
  (14, '17', '0,2', 'Nao'),
  (15, '3', '0,2', 'Nao'),
  (16, '3', '0,2', 'Nao'),
  (17, '3', '0,2', 'Nao'),
  (18, '3', '0,2', 'Nao'),
  (19, '3', '0,2', 'Sim'),
  (20, '3', '0,2', 'Sim'),
  (21, '4', '0,2', 'Sim'),
  (21, '4', '0,2', 'Sim'),
  (22, '4', '0,2', 'Sim'),
  (23, '4', '0,2', 'Sim'),
  (24, '4', '0,2', 'Sim'),
  (26, '4', '0,2', 'Sim'),
  (27, '4', '0,2', 'Sim'),
  (28, '5', '0,2', 'Sim'),
  (29, '5', '0,2', 'Sim'),
  (29, '5', '0,2', 'Sim'),
  (30, '5', '0,2', 'Sim'),
  (31, '5', '0,2', 'Sim'),
  (32, '5', '0,2', 'Sim'),
  (33, '5', '0,2', 'Sim'),
  (34, '5', '0,2', 'Sim'),
  (35, '5', '0,2', 'Sim');

-- --------------------------------------------------------
--
-- Estrutura da tabela `dim_logistica_produto`
--
CREATE TABLE `dim_logistica_produto` (
  `Id_DimEstoque` int(11) NOT NULL,
  `Produto` varchar(200) DEFAULT NULL,
  `Grupo` varchar(10) DEFAULT NULL,
  `Unidade` varchar(10) DEFAULT NULL,
  `ClasseABC` varchar(10) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

INSERT INTO
  `dim_logistica_produto` (
    `Id_DimEstoque`,
    `Produto`,
    `Grupo`,
    `Unidade`,
    `ClasseABC`
  )
VALUES
  (1, 'armario de cozinha', '1', 'unidade', 'C'),
  (2, 'celular', '2', 'unidade', 'C'),
  (3, 'celular', '2', 'unidade', 'C'),
  (4, 'mesa p/computador', '3', 'unidade', 'C'),
  (5, 'notebook', '2', 'unidade', 'B'),
  (6, 'arroz branco', '7', 'pacotes', 'C'),
  (7, 'feijão fradinho', '7', 'pacotes', 'C'),
  (8, 'acucar', '7', 'pacotes', 'C'),
  (9, 'fone de ouvido', '2', 'unidade', 'B'),
  (10, 'mesa p/computador', '2', 'unidade', 'C'),
  (11, 'mesa p/computador', '2', 'unidade', 'C'),
  (12, 'mesa p/computador', '2', 'unidade', 'C'),
  (13, 'mesa p/computador', '2', 'unidade', 'C'),
  (14, 'notebook', '2', 'unidade', 'C'),
  (15, 'notebook', '2', 'unidade', 'C'),
  (16, 'notebook', '2', 'unidade', 'C'),
  (17, 'notebook', '2', 'unidade', 'C'),
  (18, 'notebook', '2', 'unidade', 'C'),
  (19, 'notebook', '2', 'unidade', 'C'),
  (20, 'notebook', '2', 'unidade', 'C'),
  (21, 'celular', '2', 'unidade', 'C'),
  (21, 'celular', '2', 'unidade', 'C'),
  (22, 'celular', '2', 'unidade', 'C'),
  (23, 'celular', '2', 'unidade', 'C'),
  (24, 'celular', '2', 'unidade', 'C'),
  (26, 'celular', '2', 'unidade', 'C'),
  (27, 'celular', '2', 'unidade', 'C'),
  (28, 'mouse', '2', 'unidade', 'C'),
  (29, 'mouse', '2', 'unidade', 'C'),
  (29, 'mouse', '2', 'unidade', 'C'),
  (30, 'mouse', '2', 'unidade', 'C'),
  (31, 'mouse', '2', 'unidade', 'C'),
  (32, 'mouse', '2', 'unidade', 'C'),
  (33, 'mouse', '2', 'unidade', 'C'),
  (34, 'mouse', '2', 'unidade', 'C'),
  (35, 'mouse', '2', 'unidade', 'C');

-- --------------------------------------------------------
--
-- Estrutura da tabela `dim_logistica_transporte`
--
CREATE TABLE `dim_logistica_transporte` (
  `Id_DimTransporte` int(11) NOT NULL,
  `OrigemCarga` varchar(100) DEFAULT NULL,
  `DestinoCarga` varchar(100) DEFAULT NULL,
  `Transportador` varchar(150) DEFAULT NULL,
  `Veiculo` varchar(100) DEFAULT NULL,
  `Placa` varchar(12) DEFAULT NULL,
  `PostoAbastecimento` varchar(150) DEFAULT NULL,
  `Motorista` varchar(150) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

INSERT INTO
  `dim_logistica_transporte` (
    `Id_DimTransporte`,
    `OrigemCarga`,
    `DestinoCarga`,
    `Transportador`,
    `Veiculo`,
    `Placa`,
    `PostoAbastecimento`,
    `Motorista`
  )
VALUES
  (
    1,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1435',
    'abastece mais',
    'Carlos'
  ),
  (
    2,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1436',
    'abastece mais',
    'Carlos'
  ),
  (
    3,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1437',
    'abastece mais',
    'Carlos'
  ),
  (
    4,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1438',
    'abastece mais',
    'Carlos'
  ),
  (
    5,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1425',
    'abastece mais',
    'Carlos'
  ),
  (
    6,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1468',
    'abastece mais',
    'Carlos'
  ),
  (
    7,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1433',
    'abastece mais',
    'Carlos'
  ),
  (
    8,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1425',
    'abastece mais',
    'Carlos'
  ),
  (
    9,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1445',
    'abastece mais',
    'Carlos'
  ),
  (
    10,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1474',
    'abastece mais',
    'Carlos'
  ),
  (
    11,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1484',
    'abastece mais',
    'Carlos'
  ),
  (
    12,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1154',
    'abastece mais',
    'Carlos'
  ),
  (
    13,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1489',
    'abastece mais',
    'Carlos'
  ),
  (
    14,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1423',
    'abastece mais',
    'Carlos'
  ),
  (
    15,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1444',
    'abastece mais',
    'Carlos'
  ),
  (
    16,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-2354',
    'abastece mais',
    'Carlos'
  ),
  (
    17,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1894',
    'abastece mais',
    'Carlos'
  ),
  (
    18,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1724',
    'abastece mais',
    'Carlos'
  ),
  (
    19,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1434',
    'abastece mais',
    'Carlos'
  ),
  (
    20,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1434',
    'abastece mais',
    'Carlos'
  ),
  (
    21,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1434',
    'abastece mais',
    'Carlos'
  ),
  (
    22,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1434',
    'abastece mais',
    'Carlos'
  ),
  (
    23,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1434',
    'abastece mais',
    'Carlos'
  ),
  (
    24,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1434',
    'abastece mais',
    'Carlos'
  ),
  (
    25,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1434',
    'abastece mais',
    'Carlos'
  ),
  (
    26,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1434',
    'abastece mais',
    'Carlos'
  ),
  (
    27,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1434',
    'abastece mais',
    'Carlos'
  ),
  (
    28,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1434',
    'abastece mais',
    'Carlos'
  ),
  (
    29,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1434',
    'abastece mais',
    'Carlos'
  ),
  (
    30,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1434',
    'abastece mais',
    'Carlos'
  ),
  (
    31,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1434',
    'abastece mais',
    'Carlos'
  ),
  (
    32,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1434',
    'abastece mais',
    'Carlos'
  ),
  (
    33,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1434',
    'abastece mais',
    'Carlos'
  ),
  (
    34,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1434',
    'abastece mais',
    'Carlos'
  ),
  (
    35,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1434',
    'abastece mais',
    'Carlos'
  ),
  (
    36,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1434',
    'abastece mais',
    'Carlos'
  ),
  (
    37,
    'sao paulo',
    'salvador',
    'flash transporte',
    'fiat',
    'JKZ-1434',
    'abastece mais',
    'Carlos'
  );

--
-- Estrutura da tabela `dim_logistica_venda`
--
CREATE TABLE `dim_logistica_venda` (
  `Id_DimVendas` int(11) NOT NULL,
  `Num_Saida` varchar(20) DEFAULT NULL,
  `Requisitante` varchar(200) DEFAULT NULL,
  `GrupoVendas` varchar(50) DEFAULT NULL,
  `NotaFiscal` varchar(30) DEFAULT NULL,
  `SetorVendas` varchar(100) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

INSERT INTO
  `dim_logistica_venda` (
    `Id_DimVendas`,
    `Num_Saida`,
    `Requisitante`,
    `GrupoVendas`,
    `NotaFiscal`,
    `SetorVendas`
  )
VALUES
  (1, '2', '2', '1', '916', '4'),
  (2, '2', '2', '1', '916', '4'),
  (3, '2', '2', '1', '916', '4'),
  (4, '2', '2', '1', '916', '4'),
  (5, '2', '2', '1', '916', '4'),
  (6, '2', '2', '1', '916', '4'),
  (7, '2', '2', '1', '916', '4'),
  (8, '2', '2', '1', '916', '4'),
  (9, '2', '2', '1', '916', '4'),
  (10, '2', '2', '1', '916', '4'),
  (11, '2', '2', '1', '916', '4'),
  (12, '2', '2', '1', '916', '4'),
  (13, '2', '2', '1', '916', '4'),
  (14, '2', '2', '1', '916', '4'),
  (15, '2', '2', '1', '916', '4'),
  (16, '2', '2', '1', '916', '4'),
  (17, '2', '2', '1', '916', '4'),
  (18, '2', '2', '1', '916', '4'),
  (19, '2', '2', '1', '916', '4'),
  (20, '2', '2', '1', '916', '4'),
  (21, '2', '2', '1', '916', '4'),
  (22, '2', '2', '1', '916', '4'),
  (23, '2', '2', '1', '916', '4'),
  (24, '2', '2', '1', '916', '4'),
  (25, '2', '2', '1', '916', '4'),
  (26, '2', '2', '1', '916', '4'),
  (27, '2', '2', '1', '916', '4'),
  (28, '2', '2', '1', '916', '4'),
  (29, '2', '2', '1', '916', '4'),
  (30, '2', '2', '1', '916', '4'),
  (31, '2', '2', '1', '916', '4'),
  (32, '2', '2', '1', '916', '4'),
  (33, '2', '2', '1', '916', '4'),
  (34, '2', '2', '1', '916', '4'),
  (35, '2', '2', '1', '916', '4');