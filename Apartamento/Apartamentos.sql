CREATE TABLE pessoas(
    id BIGINT NOT NULL,
    nome VARCHAR (45) NOT NULL,
    sobrenome VARCHAR(45) NOT NULL,
    email VARCHAR (45) NOT NULL,
    sexo VARCHAR (45) NOT NULL
);

CREATE TABLE apartamento(
    id BIGINT NOT NULL,
    nome VARCHAR (45) NOT NULL,
    numero INT NOT NULL,
    banheiros INT NOT NULL,
    quartos INT NOT NULL,
    id_pessoas INT NOT NULL,
    id_predios INT NOT NULL,
    FOREIGN KEY (id_pessoas) REFERENCES pessoas (id),
    FOREIGN KEY (id_predios) REFERENCES predios (id)
);


CREATE TABLE predios(
    id BIGINT NOT NULL,
    nome VARCHAR (45) NOT NULL,
    numeroAndares INT NOT NULL,
    id_rua INT NOT NULL,
    FOREIGN KEY (id_rua) REFERENCES rua (id)
);


CREATE TABLE rua(
    id BIGINT NOT NULL,
    nome VARCHAR (45) NOT NULL,
    CEP VARCHAR (45) NOT NULL,
    id_cidade INT NOT NULL,
    FOREIGN KEY (id_cidade) REFERENCES cidade (id)
);

CREATE TABLE cidade(
    id BIGINT NOT NULL,
    nome VARCHAR (45) NOT NULL,
    estado VARCHAR (45),
    id_pais INT NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES pais (id)
);

CREATE TABLE pais(
    id BIGINT NOT NULL,
    nome VARCHAR (45) NOT NULL,
    id_continente INT NOT NULL,
    FOREIGN KEY (id_continente) REFERENCES continente (id)
);

CREATE TABLE continente(
    id BIGINT NOT NULL,
    nome VARCHAR (45) NOT NULL
);

ALTER TABLE pessoas ADD PRIMARY KEY (id);
ALTER TABLE apartamento ADD PRIMARY KEY (id);
ALTER TABLE predios ADD PRIMARY KEY (id);
ALTER TABLE rua ADD PRIMARY KEY (id);
ALTER TABLE cidade ADD PRIMARY KEY (id);
ALTER TABLE pais ADD PRIMARY KEY (id);
ALTER TABLE continente ADD PRIMARY KEY (id);

ALTER TABLE apartamento ADD FOREIGN KEY (id_predios) REFERENCES predios (id);
ALTER TABLE apartamento ADD FOREIGN KEY (id_pessoas) REFERENCES pessoas (id);

ALTER TABLE predios ADD FOREIGN KEY (id_rua) REFERENCES rua (id);

ALTER TABLE rua ADD FOREIGN KEY (id_cidade) REFERENCES cidade (id);

ALTER TABLE cidade ADD FOREIGN KEY (id_pais) REFERENCES pais (id);

ALTER TABLE pais ADD FOREIGN KEY (id_continente) REFERENCES continente (id);


CREATE SEQUENCE pessoas_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE apartamento_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE predios_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE rua_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE cidade_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE pais_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE pais_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE pessoas ALTER COLUMN id SET DEFAULT NEXTVAL('pessoas_id_seq');
ALTER TABLE apartamento ALTER COLUMN id SET DEFAULT NEXTVAL('apartamento_id_seq');
ALTER TABLE predios ALTER COLUMN id SET DEFAULT NEXTVAL('predios_id_seq');
ALTER TABLE rua ALTER COLUMN id SET DEFAULT NEXTVAL('cidade_id_seq');
ALTER TABLE cidade ALTER COLUMN id SET DEFAULT NEXTVAL('cidade_id_seq');
ALTER TABLE pais ALTER COLUMN id SET DEFAULT NEXTVAL('pais_id_seq');
ALTER TABLE continente ALTER COLUMN id SET DEFAULT NEXTVAL('continente_id_seq');