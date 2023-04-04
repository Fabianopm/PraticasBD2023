CREATE TABLE   clientes (
id             BIGINT NOT NULL,
nome           VARCHAR (100) NOT NULL,
endereco       VARCHAR (255) NOT NULL,
cpf            CHAR (11) NOT NULL,
rg             CHAR (10) NOT NULL
);

CREATE TABLE   compras(
id            BIGINT NOT NULL,
data_compra   DATE,
valor_total   NUMERIC(10,5),
id_cliente    BIGINT NOT NULL,
);

CREATE TABLE   itens_compras(
valor_unitario NUMERIC(10,5),
assento        VARCHAR (100),
id_compra      BIGINT NOT NULL,
id_sessao      BIGINT NOT NULL,
);

CREATE TABLE    sessoes(
id              BIGINT NOT NULL,
horario         CHAR(10),
valor_unitario  NUMERIC(10,5),
id_filme        BIGINT NOT NULL,
id_sala         BIGINT NOT NULL,
);

CREATE TABLE   filmes(
id             BIGINT NOT NULL,
titulo         VARCHAR (200),
sinopse        TEXT,
duracao	       BIGINT NOT NULL,
diretor        VARCHAR (100),
elenco         TEXT,
classificacao  VARCHAR (100)
);

CREATE TABLE    salas(
id              BIGINT NOT NULL,
identificacao   CHAR (20) NOT NULL,
capacidade      BIGINT NOT NULL,
tipo            VARCHAR (100) NOT NULL
);

ALTER TABLE clientes ADD PRIMARY KEY (id);
ALTER TABLE compras ADD PRIMARY KEY (id);
ALTER TABLE sessoes ADD PRIMARY KEY (id);
ALTER TABLE filmes ADD PRIMARY KEY (id);
ALTER TABLE salas ADD PRIMARY KEY (id);

ALTER TABLE itens_compras ADD FOREIGN KEY (id_compra) REFERENCES compras (id);
ALTER TABLE itens_compras ADD FOREIGN KEY (id_sessao) REFERENCES id_sessoes (id);

ALTER TABLE sessoes ADD FOREIGN KEY (id_sessao) REFERENCES sessoes (id);
ALTER TABLE sessoes ADD FOREIGN KEY (id_sala) REFERENCES id_salas (id);

CREATE SEQUENCE clientes_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE compras_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE sessoes_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE filmes_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE salas_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE clientes ALTER COLUMN id SET DEFAULT NEXTVAL('clientes_id_seq');
ALTER TABLE compras ALTER COLUMN id SET DEFAULT NEXTVAL('clientes_id_seq');
ALTER TABLE sessoes ALTER COLUMN id SET DEFAULT NEXTVAL('clientes_id_seq');
ALTER TABLE filmes ALTER COLUMN id SET DEFAULT NEXTVAL('clientes_id_seq');
ALTER TABLE salas ALTER COLUMN id SET DEFAULT NEXTVAL('clientes_id_seq');

