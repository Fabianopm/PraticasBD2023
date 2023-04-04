/*
    Neste diagrama temos quatro entidades principais:
    - Clincia
    - Veterinario
    - Proprietario
    - Encontro

    Clinica tem uma relação de 1 para N com Veterinario.
    Um Veterinario tem uma relação de N para N com Paciente.
    Proprietario tem uma relação de N para N com Paciente.
    Encontro é uma entidade associativa que relaciona Veterinario, Paciente e Proprietario
    o qual representa o agendamento da consulta.
*/

CREATE TABLE clinica (
    id BIGINT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

CREATE TABLE veterinario (
    id BIGINT PRIMARY KEY,
    id_clinica BIGINT,
    nome VARCHAR(255) NOT NULL,
    especialidade TEXT NOT NULL,
    licenca_num VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_clinica) REFERENCES clinica(id)
);

CREATE TABLE paciente (
    id BIGINT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    especies VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    id_proprietario BIGINT NOT NULL,
    FOREIGN KEY (id_proprietario) REFERENCES proprietario(id)
);

CREATE TABLE proprietario (
    id BIGINT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE consulta (
    id BIGINT NOT NULL,
    id_veterinario BIGINT NOT NULL,
    id_paciente BIGINT NOT NULL,
    data_consulta DATE NOT NULL,
    valor NUMERIC (10, 5) NOT NULL
);

ALTER TABLE consulta ADD PRIMARY KEY (id);
ALTER TABLE consulta ADD FOREIGN KEY (id_veterinario) REFERENCES veterinario (id);
ALTER TABLE consulta ADD FOREIGN KEY (id_paciente) REFERENCES paciente (id);


CREATE SEQUENCE clinica_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE veterinario_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE paciente_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE proprietario_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE consulta_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE clinica ALTER COLUMN id SET DEFAULT NEXTVAL('clinica_id_seq');
ALTER TABLE veterinario ALTER COLUMN id SET DEFAULT NEXTVAL('veterinario_id_seq');
ALTER TABLE paciente ALTER COLUMN id SET DEFAULT NEXTVAL('paciente_id_seq');
ALTER TABLE proprietario ALTER COLUMN id SET DEFAULT NEXTVAL('proprietario_id_seq');
ALTER TABLE consulta ALTER COLUMN id SET DEFAULT NEXTVAL('consulta_id_seq');