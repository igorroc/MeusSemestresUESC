--
-- Trabalho realizado por:
-- Igor Lima Rocha
-- Maira Gomes
--
--
-- Estrutura da tabela `dim_financas_estoque`
--
CREATE TABLE `dim_financas_estoque` (
  `Id_DimRecebimento` int(11) NOT NULL,
  `Grupo` int(11) DEFAULT NULL,
  `Quant_minima` float(10, 2) DEFAULT NULL,
  `Ressuprimento` varchar(5) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

INSERT INTO
  `dim_financas_estoque` (
    `Id_DimRecebimento`,
    `Grupo`,
    `Quant_minima`,
    `Ressuprimento`
  )
VALUES
  (1, '3', '1', 'Nao'),
  (2, '3', '2', 'Nao'),
  (3, '6', '1', 'Sim'),
  (4, '4', '3', 'Sim'),
  (5, '1', '2', 'Nao'),
  (6, '1', '2', 'Sim'),
  (7, '5', '2', 'Nao'),
  (8, '6', '2', 'Nao'),
  (9, '1', '2', 'Nao'),
  (10, '1', '2', 'Nao'),
  (11, '1', '2', 'Nao'),
  (12, '1', '2', 'Nao'),
  (13, '1', '2', 'Nao'),
  (14, '17', '2', 'Nao'),
  (15, '3', '2', 'Nao'),
  (16, '3', '2', 'Nao'),
  (17, '3', '2', 'Nao'),
  (18, '3', '2', 'Nao'),
  (19, '3', '2', 'Sim'),
  (20, '3', '2', 'Sim'),
  (21, '4', '2', 'Sim'),
  (21, '4', '2', 'Sim'),
  (22, '4', '2', 'Sim'),
  (23, '4', '2', 'Sim'),
  (24, '4', '2', 'Sim'),
  (26, '4', '2', 'Sim'),
  (27, '4', '2', 'Sim'),
  (28, '5', '2', 'Sim'),
  (29, '5', '2', 'Sim'),
  (29, '5', '2', 'Sim'),
  (30, '5', '2', 'Sim'),
  (31, '5', '2', 'Sim'),
  (32, '5', '2', 'Sim'),
  (33, '5', '2', 'Sim'),
  (34, '5', '2', 'Sim'),
  (35, '5', '2', 'Sim');

-- --------------------------------------------------------
--
-- Estrutura da tabela `dim_financas_recebimento`
--
CREATE TABLE `dim_financas_recebimento` (
  `Id_DimVendas` int(11) NOT NULL,
  `Num_Saida` varchar(20) DEFAULT NULL,
  `Requisitante` varchar(200) DEFAULT NULL,
  `GrupoVendas` varchar(50) DEFAULT NULL,
  `NotaFiscal` varchar(30) DEFAULT NULL,
  `SetorVendas` varchar(100) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

INSERT INTO
  `dim_financas_recebimento` (
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

-- --------------------------------------------------------
--
-- Estrutura da tabela `dim_financas_data`
--
CREATE TABLE `dim_financas_data` (
  `Id_DimData` int(11) NOT NULL,
  `DataVenda` datetime DEFAULT NULL,
  `DataCompra` datetime DEFAULT NULL,
  `DataEntrega` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

INSERT INTO
  `dim_financas_data` (
    `Id_DimData`,
    `DataVenda`,
    `DataCompra`,
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

-- --------------------------------------------------------
--
-- Estrutura da tabela `dim_financas_contrato`
--
CREATE TABLE `dim_financas_contrato` (
  `Id_DimContrato` int(11) NOT NULL,
  `Produto` varchar(200) DEFAULT NULL,
  `Contratado` varchar(10) DEFAULT NULL,
  `Supervisor` varchar(10) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

INSERT INTO
  `dim_financas_contrato` (
    `Id_DimContrato`,
    `Produto`,
    `Contratado`,
    `Supervisor`
  )
VALUES
  (1, 'armario de cozinha', 'industria IM', '5'),
  (2, 'celular', 'industria IM', '5'),
  (3, 'celular', 'industria IM', '5'),
  (4, 'mesa p/computador', 'industria IM', '5'),
  (5, 'notebook', 'industria IM', '1'),
  (6, 'arroz branco', 'industria IM', '1'),
  (7, 'feijão fradinho', 'industria IM', '1'),
  (8, 'acucar', 'industria IM', '1'),
  (9, 'fone de ouvido', 'industria IM', '1'),
  (10, 'mesa p/computador', 'industria IM', '1'),
  (11, 'mesa p/computador', 'industria IM', '1'),
  (12, 'mesa p/computador', 'industria IM', '1'),
  (13, 'mesa p/computador', 'industria IM', '1'),
  (14, 'notebook', 'industria IM', '2'),
  (15, 'notebook', 'industria IM', '2'),
  (16, 'notebook', 'industria IM', '2'),
  (17, 'notebook', 'industria IM', '2'),
  (18, 'notebook', 'industria IM', '2'),
  (19, 'notebook', 'industria IM', '2'),
  (20, 'notebook', 'industria IM', '2'),
  (21, 'celular', 'industria IM', '2'),
  (21, 'celular', 'industria IM', '2'),
  (22, 'celular', 'industria IM', '4'),
  (23, 'celular', 'industria IM', '4'),
  (24, 'celular', 'industria IM', '4'),
  (26, 'celular', 'industria IM', '4'),
  (27, 'celular', 'industria IM', '4'),
  (28, 'mouse', 'industria IM', '4'),
  (29, 'mouse', 'industria IM', '4'),
  (29, 'mouse', 'industria IM', '3'),
  (30, 'mouse', 'industria IM', '3'),
  (31, 'mouse', 'industria IM', '3'),
  (32, 'mouse', 'industria IM', '3'),
  (33, 'mouse', 'industria IM', '3'),
  (34, 'mouse', 'industria IM', '3'),
  (35, 'mouse', 'industria IM', '3');

-- --------------------------------------------------------,
--
-- Estrutura da tabela `dim_financas_pagamentos`
--
CREATE TABLE `dim_financas_pagamentos` (
  `Id_DimCompras` int(11) NOT NULL,
  `Fornecedor` varchar(200) DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `UF` varchar(6) DEFAULT NULL,
  `Banco` varchar(50) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

INSERT INTO
  `dim_financas_pagamentos` (
    `Id_DimCompras`,
    `Fornecedor`,
    `Cidade`,
    `UF`,
    `Banco`
  )
VALUES
  (1, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (2, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (3, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (4, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (5, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (6, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (7, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (8, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (9, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (10, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (11, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (12, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (13, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (14, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (15, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (16, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (17, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (18, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (19, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (20, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (21, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (21, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (22, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (23, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (24, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (26, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (27, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (28, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (29, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (29, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (30, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (31, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (32, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (33, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (34, 'industria IM', 'salvador', 'BA', 'bradesco'),
  (35, 'industria IM', 'salvador', 'BA', 'bradesco');

-- --------------------------------------------------------