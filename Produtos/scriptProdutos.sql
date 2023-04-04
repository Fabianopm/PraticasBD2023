CREATE TABLE
    encomenda (
        id BIGINT NOT NULL,
        data_encomenda VARCHAR(45),
        valor_total FLOAT,
        id_cliente BIGINT NOT NULL,
        id_vendedor BIGINT NOT NULL,
        FOREIGN KEY (id_cliente) REFERENCES cliente (id),
        FOREIGN KEY (id_vendedor) REFERENCES vendedor (id),
    );
	
	CREATE TABLE
    fatura (
        id BIGINT NOT NULL,
        valor_total VARCHAR(45),
        id_encomenda BIGINT NOT NULL,
        FOREIGN KEY (id_encomenda) REFERENCES encomenda (id)
    );
	
	CREATE TABLE
    produto (
        id BIGINT NOT NULL,
        quantidade BIGINT NOT NULL
    );
	
	CREATE TABLE
    encomenda_produto (
        id_produto BIGINT NOT NULL,
        id_encomenda BIGINT NOT NULL,
        FOREIGN KEY (id_produto) REFERENCES produto (id),
        FOREIGN KEY (id_encomenda) REFERENCES encomenda (id)
    );
	
	CREATE TABLE
    cliente (
        id BIGINT NOT NULL,
        nome VARCHAR(45) NOT NULL,
        endereco VARCHAR(45) NOT NULL,
        telefone VARCHAR(45) NOT NULL
    );
	
	CREATE TABLE
    vendedor (
        id BIGINT NOT NULL,
        meta_vendas BIGINT NOT NULL,
        exp_anos BIGINT NOT NULL,
        id_empregado BIGINT NOT NULL,
        FOREIGN KEY (id_empregado) REFERENCES empregado (id)
    );

CREATE TABLE
    empregado (
        id BIGINT PRIMARY KEY NOT NULL,
        nome VARCHAR(45) NOT NULL,
        sobrenome VARCHAR(45) NOT NULL,
        data_Nascimento VARCHAR(45) NOT NULL,
        email VARCHAR(45) NOT NULL,
        cargo VARCHAR(45) NOT NULL,
        salario FLOAT NOT NULL,
        id_departamento BIGINT NOT NULL,
        FOREIGN KEY (id_departamento) REFERENCES departamento (id)
    );

CREATE TABLE
    departamento (
        id BIGINT PRIMARY KEY NOT NULL,
        nome VARCHAR(45) NOT NULL
    );

ALTER TABLE encomenda ADD PRIMARY KEY (id);
ALTER TABLE fatura ADD PRIMARY KEY (id);
ALTER TABLE cliente ADD PRIMARY KEY (id);
ALTER TABLE produto ADD PRIMARY KEY (id);
ALTER TABLE vendedor ADD PRIMARY KEY (id);
ALTER TABLE empregado ADD PRIMARY KEY (id);
ALTER TABLE departamento ADD PRIMARY KEY (id);

ALTER TABLE encomenda ADD FOREIGN KEY (id_cliente) REFERENCES cliente (id);
ALTER TABLE encomenda ADD FOREIGN KEY (id_vendedor) REFERENCES vendedor (id);
ALTER TABLE fatura ADD FOREIGN KEY (id_encomenda) REFERENCES encomenda (id);
ALTER TABLE encomenda_produto ADD FOREIGN KEY (id_encomenda) REFERENCES encomenda (id);
ALTER TABLE encomenda_produto ADD FOREIGN KEY (id_produto) REFERENCES produto (id);
ALTER TABLE vendedor ADD FOREIGN KEY (id_empregado) REFERENCES empregado (id);
ALTER TABLE empregado ADD FOREIGN KEY (id_departamento) REFERENCES departamento (id);

CREATE SEQUENCE encomenda_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE fatura_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE produto_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE cliente_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE vendedor_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE empregado_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE departamento_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE encomenda ALTER COLUMN id SET DEFAULT NEXTVAL('encomenda_id_seq');
ALTER TABLE fatura ALTER COLUMN id SET DEFAULT NEXTVAL('fatura_id_seq');
ALTER TABLE produto ALTER COLUMN id SET DEFAULT NEXTVAL('produto_id_seq');
ALTER TABLE cliente ALTER COLUMN id SET DEFAULT NEXTVAL('cliente_id_seq');
ALTER TABLE vendedor ALTER COLUMN id SET DEFAULT NEXTVAL('vendedor_id_seq');
ALTER TABLE empregado ALTER COLUMN id SET DEFAULT NEXTVAL('empregado_id_seq');
ALTER TABLE departamento ALTER COLUMN id SET DEFAULT NEXTVAL('departamento_id_seq');