--
-- Trabalho realizado por:
-- Igor Lima Rocha
-- Maira Gomes
--
--
-- Estrutura da tabela `dim_compras_compras`
--
CREATE TABLE `dim_compras_compras` (
  `Id_DimVendas` int(11) NOT NULL,
  `Num_Entrada` varchar(20) DEFAULT NULL,
  `Fornecedor` varchar(200) DEFAULT NULL,
  `GrupoVendas` varchar(50) DEFAULT NULL,
  `NotaFiscal` varchar(30) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

INSERT INTO
  `dim_compras_compras` (
    `Id_DimVendas`,
    `Num_Entrada`,
    `Fornecedor`,
    `GrupoVendas`,
    `NotaFiscal`
  )
VALUES
  (1, '2', '2', '1', '916'),
  (2, '2', '2', '1', '916'),
  (3, '2', '2', '1', '916'),
  (4, '2', '2', '1', '916'),
  (5, '2', '2', '1', '916'),
  (6, '2', '2', '1', '916'),
  (7, '2', '2', '1', '916'),
  (8, '2', '2', '1', '916'),
  (9, '2', '2', '1', '916'),
  (10, '2', '2', '1', '916'),
  (11, '2', '2', '1', '916'),
  (12, '2', '2', '1', '916'),
  (13, '2', '2', '1', '916'),
  (14, '2', '2', '1', '916'),
  (15, '2', '2', '1', '916'),
  (16, '2', '2', '1', '916'),
  (17, '2', '2', '1', '916'),
  (18, '2', '2', '1', '916'),
  (19, '2', '2', '1', '916'),
  (20, '2', '2', '1', '916'),
  (21, '2', '2', '1', '916'),
  (22, '2', '2', '1', '916'),
  (23, '2', '2', '1', '916'),
  (24, '2', '2', '1', '916'),
  (25, '2', '2', '1', '916'),
  (26, '2', '2', '1', '916'),
  (27, '2', '2', '1', '916'),
  (28, '2', '2', '1', '916'),
  (29, '2', '2', '1', '916'),
  (30, '2', '2', '1', '916'),
  (31, '2', '2', '1', '916'),
  (32, '2', '2', '1', '916'),
  (33, '2', '2', '1', '916'),
  (34, '2', '2', '1', '916'),
  (35, '2', '2', '1', '916');

-- --------------------------------------------------------
--
-- Estrutura da tabela `dim_compras_contrato`
--
CREATE TABLE `dim_compras_contrato` (
  `Id_DimContrato` int(11) NOT NULL,
  `NumContrato` varchar(20) DEFAULT NULL,
  `ParteContrato` varchar(150) DEFAULT NULL,
  `Supervisor` varchar(150) DEFAULT NULL,
  `NotaFiscal` varchar(20) DEFAULT NULL,
  `Aditivo` varchar(10) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

INSERT INTO
  `dim_compras_contrato` (
    `Id_DimContrato`,
    `NumContrato`,
    `ParteContrato`,
    `Supervisor`,
    `NotaFiscal`,
    `Aditivo`
  )
VALUES
  (1, '2000-0', 'industria IM', '1', '916', 'Sim'),
  (2, '2001-0', 'industria IM', '1', '916', 'Sim'),
  (3, '2325-0', 'industria IM', '1', '916', 'Sim'),
  (4, '2547-0', 'industria IM', '1', '916', 'Sim'),
  (5, '2969-0', 'industria IM', '1', '916', 'Sim'),
  (6, '2478-0', 'industria IM', '1', '916', 'Sim'),
  (7, '2147-0', 'industria IM', '1', '916', 'Sim'),
  (8, '5496-1', 'industria IM', '1', '916', 'Sim'),
  (9, '5496-1', 'industria IM', '1', '916', 'Sim'),
  (10, '5496-1', 'industria IM', '1', '916', 'Sim'),
  (11, '5496-1', 'industria IM', '1', '916', 'Sim'),
  (12, '5496-1', 'industria IM', '1', '916', 'Sim'),
  (13, '5496-1', 'industria IM', '1', '916', 'Sim'),
  (14, '5496-1', 'industria IM', '1', '916', 'Sim'),
  (15, '5496-1', 'industria IM', '1', '916', 'Sim'),
  (16, '5496-1', 'industria IM', '1', '916', 'Sim'),
  (17, '5496-1', 'industria IM', '1', '916', 'Sim'),
  (18, '5496-1', 'industria IM', '1', '916', 'Sim'),
  (19, '5496-1', 'industria IM', '1', '916', 'Sim'),
  (20, '4587-2', 'industria IM', '1', '916', 'Sim'),
  (21, '4587-2', 'industria IM', '1', '916', 'Sim'),
  (22, '4587-2', 'industria IM', '1', '916', 'Sim'),
  (23, '4587-2', 'industria IM', '1', '916', 'Sim'),
  (24, '4587-2', 'industria IM', '1', '916', 'Sim'),
  (25, '4587-2', 'industria IM', '1', '916', 'Sim'),
  (26, '4587-2', 'industria IM', '1', '916', 'Sim'),
  (27, '4587-2', 'industria IM', '1', '916', 'Sim'),
  (28, '4587-2', 'industria IM', '1', '916', 'Sim'),
  (29, '4587-2', 'industria IM', '1', '916', 'Sim'),
  (30, '4587-2', 'industria IM', '1', '916', 'Sim'),
  (31, '4587-2', 'industria IM', '1', '916', 'Sim'),
  (32, '4587-2', 'industria IM', '1', '916', 'Sim'),
  (33, '4587-2', 'industria IM', '1', '916', 'Sim'),
  (34, '4587-2', 'industria IM', '1', '916', 'Sim'),
  (35, '4587-2', 'industria IM', '1', '916', 'Sim');

-- --------------------------------------------------------
--
-- Estrutura da tabela `dim_compras_data`
--
CREATE TABLE `dim_compras_data` (
  `Id_DimData` int(11) NOT NULL,
  `DataVenda` datetime DEFAULT NULL,
  `DataVigencia` datetime DEFAULT NULL,
  `DataCompra` datetime DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

INSERT INTO
  `dim_compras_data` (
    `Id_DimData`,
    `DataVenda`,
    `DataVigencia`,
    `DataCompra`
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
-- Estrutura da tabela `dim_compras_estoque`
--
CREATE TABLE `dim_compras_estoque` (
  `Id_DimEstoque` int(11) NOT NULL,
  `Grupo` int(11) DEFAULT NULL,
  `Quant_minima` float(10, 2) DEFAULT NULL,
  `Ressuprimento` varchar(5) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

INSERT INTO
  `dim_compras_estoque` (
    `Id_DimEstoque`,
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
-- Estrutura da tabela `dim_compras_fornecedor`
--
CREATE TABLE `dim_compras_fornecedor` (
  `Id_DimEstoque` int(11) NOT NULL,
  `Nomefornecedor` varchar(200) DEFAULT NULL,
  `Grupo` varchar(10) DEFAULT NULL,
  `ClasseABC` varchar(10) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

INSERT INTO
  `dim_compras_fornecedor` (
    `Id_DimEstoque`,
    `Nomefornecedor`,
    `Grupo`,
    `ClasseABC`
  )
VALUES
  (1, 'industria IM', '5', 'A'),
  (2, 'industria IM', '5', 'B'),
  (3, 'industria IM', '5', 'B'),
  (4, 'industria IM', '5', 'B'),
  (5, 'industria IM', '1', 'B'),
  (6, 'industria IM', '1', 'B'),
  (7, 'industria IM', '1', 'B'),
  (8, 'industria IM', '1', 'B'),
  (9, 'industria IM', '1', 'B'),
  (10, 'industria IM', '1', 'B'),
  (11, 'industria IM', '1', 'C'),
  (12, 'industria IM', '1', 'C'),
  (13, 'industria IM', '1', 'C'),
  (14, 'industria IM', '2', 'C'),
  (15, 'industria IM', '2', 'C'),
  (16, 'industria IM', '2', 'C'),
  (17, 'industria IM', '2', 'C'),
  (18, 'industria IM', '2', 'C'),
  (19, 'industria IM', '2', 'C'),
  (20, 'industria IM', '2', 'C'),
  (21, 'industria IM', '2', 'C'),
  (21, 'industria IM', '2', 'C'),
  (22, 'industria IM', '4', 'C'),
  (23, 'industria IM', '4', 'C'),
  (24, 'industria IM', '4', 'C'),
  (26, 'industria IM', '4', 'C'),
  (27, 'industria IM', '4', 'A'),
  (28, 'industria IM', '4', 'A'),
  (29, 'industria IM', '4', 'A'),
  (29, 'industria IM', '3', 'A'),
  (30, 'industria IM', '3', 'A'),
  (31, 'industria IM', '3', 'A'),
  (32, 'industria IM', '3', 'A'),
  (33, 'industria IM', '3', 'A'),
  (34, 'industria IM', '3', 'A'),
  (35, 'industria IM', '3', 'A');

-- --------------------------------------------------------
--
-- Estrutura da tabela `dim_compras_produto`
--
CREATE TABLE `dim_compras_produto` (
  `Id_Produto` int(11) NOT NULL,
  `Descricao` varchar(200) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

INSERT INTO
  `dim_compras_produto` (`Id_Produto`, `Descricao`)
VALUES
  (
    1,
    'CARTUCHO DE FOGO CENTRAL, calibre 7,62 x 51 mm, com projetil comum.'
  ),
  (
    2,
    'SOLDA eletrica, eletrodo para aco carbono 46, rutilico, norma AWS E 6013 de 3,25 mm.\nEmbalagem: caixa com 20 kg.'
  ),
  (
    3,
    'SOLDA eletrica, eletrodo para aco carbono 46, rutilico, norma AWS E 6013 de 2,5mm.'
  ),
  (
    4,
    'MANDRIL DE SERRA COPO em aco, dimensoes 14 x 30 mm.\nEmbalagem individual em caixa, contendo dados de identificacao do produto, marca do fabricante, com certificado ISO 9000 ou superior.'
  ),
  (
    5,
    'MANDRIL DE SERRA COPO em aco, dimensoes 32 x 152 mm.\nEmbalagem individual em caixa, contendo dados de identificacao do produto, marca do fabricante, com certificado ISO 9000 ou superior.'
  ),
  (6, 'CORREIA PARA CENTRIFUGADORA DE ROUPA, B-65'),
  (
    7,
    'BOBINA PARA MAQUINA EMPACOTADORA, em pelicula de polietileno, dupla face, com 45 cm de largura, 30 Kg.\nEmbalagem em rolo, com dados de identificacao do produto, marca do fabricante, data de fabricacao e prazo de validade.'
  ),
  (8, 'TINTA off-set, na cor preta europa'),
  (9, 'REVELADOR PARA CHAPA OFF-SET positivo'),
  (10, 'TINTA off-set rotativa vermelha.'),
  (
    11,
    'MAQUINA encadernadora, manual, capacidade ate 20 folhas de uma so vez, comprimento maximo de perfuracao 63 furos (385 mm), diametro dos furos de no maximo 4 mm, matrizes e puncoes em aco temperado e reticado, contem margeador de profundidade com 4 posicoe'
  ),
  (12, 'TINTA off-set, na cor magenta'),
  (
    13,
    'PULVERIZADOR, costal, motorizado, para aplicacao de inseticida liquido, com controle de vazao regulavel de 60 a 208 ml/min, ultra baixo volume; motor a gasolina e oleo (motor dois tempos) que aciona a ventuinha a 7.000 rpm gerando cerca de 16 m3 de ar e p'
  ),
  (
    14,
    'PULVERIZADOR, multiuso, plastico resistente (polietileno e polipropileno), para uso domestico, capacidade 500 ml'
  ),
  (
    15,
    'TESOURA DE PODA para grama, cabo em madeira, comprimento total 40 cm.'
  ),
  (
    16,
    'TESOURA, poda, para grama, 12 polegadas, com presilha de PVC.'
  ),
  (
    17,
    'LAMINA, aco cromo vanadio, para maquina rocadeira stihl; dimensoes: 200 x 80 x 2 mm.'
  ),
  (
    18,
    'SERRA DE FITA, aco inox, para postear peixe, com motor blindado de 1,0 CV, tensao 110 volts.'
  ),
  (
    19,
    'ANCORA, modelo garateia, minimo de 5,0 e maximo de 6,0 Kg'
  ),
  (
    20,
    'CAIXA PARA TRANSPORTE DE ANIMAL, polipropileno, autoclavavel, com travas para empilhamento, com borda superior reforcada de 15mm de espessura, dimensoes 414mm ( comprimento) x 344mm (largura) x 168mm (altura).'
  ),
  (
    21,
    'TAMPA PARA GAIOLA, em arame inox, de camundongo, tamanho 414 x 344 mm e 6 mm de espaco entre os arames, com suporte para bebedouro e comedouro embutidos.'
  ),
  (
    22,
    'GAIOLA PARA COELHO, aco inox, com alcas para transporte e encaixe para bandeja, suporte para bebedouro, manjedoura e comedouro, bandeja para detrito, empilhavel, dimensoes 50 x 50 x 50 cm'
  ),
  (
    23,
    'CAMBAO, aco inox, para captura de caes, cabo de 1,5 m, cabo de aco encapado com borracha para nao machucar o animal e com empunhadura anatomica.'
  ),
  (
    24,
    'LINHA DE NYLON, lisa, para pesca, na cor branca, espessura de 0,40 mm.\nEmbalagem: rolo com 100 m.'
  ),
  (
    25,
    'LINHA DE NYLON, lisa, para pesca, na cor branca, espessura de 0,60 mm.\nEmbalagem: rolo com 100 m'
  ),
  (
    26,
    'LINHA DE NYLON, lisa, para pesca, na cor branca, espessura de 1,00 mm.\nEmbalagem: rolo com 100 m'
  ),
  (
    27,
    'REDE DE PESCA passagua, com fios de seda, com haste de aluminio, diametro de 30 cm, malha de 8,0 mm, para captura de peixe.'
  ),
  (
    28,
    'CARRO TRANSPORTE DE ROUPA, limpa, em fibra, cacamba com tampa, 2 rodizios fixos, 2 rodizios de giro livre, dimensoes 1000 x 600 x 800 mm.'
  ),
  (
    29,
    'CARRO PLATAFORMA, lastro em chapa de aco, capacidade 300 Kg, dimensoes 1,00 x 0,60 m., com suporte para locomocao, 02 rodizios giratorios e 02 rodizios fixos.'
  ),
  (
    30,
    'CARRO TRANSPORTE DE ALIMENTOS, termico, tampo superior, mesa auxiliar basculante em aco inoxidavel corpo em aluminio polido com painel de comando prateleira interdimensional e gavetas para talheres em aco inox, aquecido a seco atraves de resistencia em ac'
  ),
  (
    31,
    'CARRO TRANSPORTE DE ROUPA, umida, em plastico rigido, com registro na parte inferior para escoamento da agua, nas dimensoes de 1,00 x 0,60 x 0,80 m.'
  ),
  (
    32,
    'CARRO TIPO GAIOLA, capacidade para 600 litros, para transporte de material em almoxarifado, em aco inox ou liga de aco, dispositivos de destrava lateral, destrava para arrumacao, rodas em polipropileno.'
  ),
  (
    33,
    'CARRO TIPO GAIOLA, capacidade para 250 litros para transporte de material em almoxarifado, em aco inox ou liga de aco, dimensoes 54 x 90 x 88 cm, dispositivos de destrava lateral, destrava para arrumacao, rodas em polipropileno.'
  ),
  (
    34,
    'CARRO TRANSPORTE DE LABORATORIO, aco inox, 03 bandejas em plastico resistente, lisas e faceis de lavar (sendo 02 bandejas superiores com 60 cm de comprimento), rodas multidirecionais, dimensoes aproximadas de 120 x 50 x 100 cm.'
  ),
  (
    35,
    'CARRO DE MAO, capacidade 70 litros, para varricao, estrutura tubular, com 2 rodas, pneu borracha macica, conjugado com caixa de lixo.'
  ),
  (
    36,
    'CARRINHO TIPO SUPERMERCADO, capacidade minima 60 litros, estrutura tubular em aco galvanizado, 02 bandejas teladas, estrado, rodas com rolamentos, 02 rodas traseiras fixas, 02 rodizios dianteiros livres e giratorios.'
  ),
  (
    37,
    'CARRINHO TIPO SUPERMERCADO, capacidade minima 130 litros, estrutura tubular em aco galvanizado, simples com estrado, rodas com rolamentos, 02 rodas traseiras fixas, 02 rodizios dianteiros livres e giratorios.'
  ),
  (
    38,
    'CARRO PLATAFORMA, lastro em chapa de aco, capacidade 800 kg, dimensoes 0,80 x 1,50 m, rodas pneumaticas anteriores moveis e traseiras fixos, suporte para locomocao, com sistema de freio.'
  ),
  (
    39,
    'CARRO, esteira, em chapa de aco, com rodizios, medindo 44 x 86 cm, com 6 cm de altura.'
  );

-- --------------------------------------------------------