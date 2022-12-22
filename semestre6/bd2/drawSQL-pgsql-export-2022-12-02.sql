CREATE TABLE "dim_logistica_produto"(
    "id" INTEGER NOT NULL,
    "id_dim_produto" INTEGER NOT NULL,
    "produto" VARCHAR(255) NOT NULL,
    "grupo" VARCHAR(255) NOT NULL,
    "unidade" VARCHAR(255) NOT NULL,
    "classe_abc" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "dim_logistica_produto" ADD PRIMARY KEY("id");
CREATE TABLE "fato_logistica"(
    "id" INTEGER NOT NULL,
    "id_transporte" INTEGER NOT NULL,
    "id_produto" INTEGER NOT NULL,
    "id_entrega" INTEGER NOT NULL,
    "id_estoque" INTEGER NOT NULL,
    "id_venda" INTEGER NOT NULL,
    "id_data" INTEGER NOT NULL,
    "quantidade_saida" DOUBLE PRECISION NOT NULL,
    "total_saida" DOUBLE PRECISION NOT NULL,
    "frete" DOUBLE PRECISION NOT NULL,
    "combustivel" DOUBLE PRECISION NOT NULL
);
ALTER TABLE
    "fato_logistica" ADD PRIMARY KEY("id");
CREATE TABLE "dim_logistica_estoque"(
    "id" INTEGER NOT NULL,
    "id_dim_estoque" INTEGER NOT NULL,
    "grupo" INTEGER NOT NULL,
    "quantidade_minima" DOUBLE PRECISION NOT NULL,
    "ressuprimento" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "dim_logistica_estoque" ADD PRIMARY KEY("id");
CREATE TABLE "dim_logistica_transporte"(
    "id" INTEGER NOT NULL,
    "id_dim_transporte" INTEGER NOT NULL,
    "origem_carga" VARCHAR(255) NOT NULL,
    "destino_carga" VARCHAR(255) NOT NULL,
    "transportador" VARCHAR(255) NOT NULL,
    "veiculo" VARCHAR(255) NOT NULL,
    "placa" VARCHAR(255) NOT NULL,
    "posto_abastecimento" VARCHAR(255) NOT NULL,
    "motorista" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "dim_logistica_transporte" ADD PRIMARY KEY("id");
CREATE TABLE "dim_logistica_data"(
    "id" INTEGER NOT NULL,
    "id_dim_data" INTEGER NOT NULL,
    "data_venda" DATE NOT NULL,
    "data_frete" DATE NOT NULL,
    "data_entrega" DATE NOT NULL
);
ALTER TABLE
    "dim_logistica_data" ADD PRIMARY KEY("id");
CREATE TABLE "dim_logistica_venda"(
    "id" INTEGER NOT NULL,
    "id_dim_vendas" INTEGER NOT NULL,
    "numero_saida" VARCHAR(255) NOT NULL,
    "requisitantes" VARCHAR(255) NOT NULL,
    "grupo_vendas" VARCHAR(255) NOT NULL,
    "nota_fiscal" VARCHAR(255) NOT NULL,
    "setor_vendas" VARCHAR(255) NOT NULL,
    "column_8" INTEGER NOT NULL
);
ALTER TABLE
    "dim_logistica_venda" ADD PRIMARY KEY("id");
CREATE TABLE "fato_compras"(
    "id" INTEGER NOT NULL,
    "id_fornecedor" INTEGER NOT NULL,
    "id_produto" INTEGER NOT NULL,
    "id_compras" INTEGER NOT NULL,
    "id_estoque" INTEGER NOT NULL,
    "id_contrato" INTEGER NOT NULL,
    "id_data" INTEGER NOT NULL,
    "quantidade_entrada" DOUBLE PRECISION NOT NULL,
    "valor_contrato" DOUBLE PRECISION NOT NULL,
    "frete" DOUBLE PRECISION NOT NULL
);
ALTER TABLE
    "fato_compras" ADD PRIMARY KEY("id");
CREATE TABLE "dim_compras_compra"(
    "id" INTEGER NOT NULL,
    "id_dim_compras" INTEGER NOT NULL,
    "numero_entrada" VARCHAR(255) NOT NULL,
    "fornecedor" VARCHAR(255) NOT NULL,
    "grupo_vendas" VARCHAR(255) NOT NULL,
    "nota_fiscal" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "dim_compras_compra" ADD PRIMARY KEY("id");
CREATE TABLE "dim_compras_estoque"(
    "id" INTEGER NOT NULL,
    "id_dim_estoque" INTEGER NOT NULL,
    "grupo" INTEGER NOT NULL,
    "quantidade_minima" DOUBLE PRECISION NOT NULL,
    "ressuprimento" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "dim_compras_estoque" ADD PRIMARY KEY("id");
CREATE TABLE "dim_compras_data"(
    "id" INTEGER NOT NULL,
    "id_dim_data" INTEGER NOT NULL,
    "data_venda" DATE NOT NULL,
    "data_vigencia" DATE NOT NULL,
    "data_compra" DATE NOT NULL
);
ALTER TABLE
    "dim_compras_data" ADD PRIMARY KEY("id");
CREATE TABLE "dim_compras_fornecedor"(
    "id" INTEGER NOT NULL,
    "id_dim_estoque" INTEGER NOT NULL,
    "produto" VARCHAR(255) NOT NULL,
    "grupo" VARCHAR(255) NOT NULL,
    "unidade" VARCHAR(255) NOT NULL,
    "classe_abc" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "dim_compras_fornecedor" ADD PRIMARY KEY("id");
CREATE TABLE "dim_compras_produto"(
    "id" INTEGER NOT NULL,
    "id_produto" INTEGER NOT NULL,
    "descricao" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "dim_compras_produto" ADD PRIMARY KEY("id");
CREATE TABLE "dim_compras_contrato"(
    "id" INTEGER NOT NULL,
    "id_dim_contrato" INTEGER NOT NULL,
    "produto" VARCHAR(255) NOT NULL,
    "contratado" VARCHAR(255) NOT NULL,
    "supervisor" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "dim_compras_contrato" ADD PRIMARY KEY("id");
CREATE TABLE "fato_financas"(
    "id" INTEGER NOT NULL,
    "id_compras" INTEGER NOT NULL,
    "id_contrato" INTEGER NOT NULL,
    "id_estoque" INTEGER NOT NULL,
    "id_vendas" INTEGER NOT NULL,
    "id_data" INTEGER NOT NULL,
    "quantidade_venda" DOUBLE PRECISION NOT NULL,
    "total_saida" DOUBLE PRECISION NOT NULL,
    "quantidade_compra" DOUBLE PRECISION NOT NULL,
    "total_compra" DOUBLE PRECISION NOT NULL,
    "quantidade_estoque" DOUBLE PRECISION NOT NULL,
    "total_estoque" DOUBLE PRECISION NOT NULL,
    "frete" DOUBLE PRECISION NOT NULL
);
ALTER TABLE
    "fato_financas" ADD PRIMARY KEY("id");
CREATE TABLE "dim_financas_estoque"(
    "id" INTEGER NOT NULL,
    "id_dim_estoque" INTEGER NOT NULL,
    "grupo" INTEGER NOT NULL,
    "quantidade_minima" DOUBLE PRECISION NOT NULL,
    "ressuprimento" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "dim_financas_estoque" ADD PRIMARY KEY("id");