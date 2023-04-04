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

CREATE TABLE Clinica (
    id_clinica INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

CREATE TABLE Veterinario (
    id_veterinario INT PRIMARY KEY,
    id_clinica INT,
    nome VARCHAR(255) NOT NULL,
    especialidade VARCHAR(255) NOT NULL,
    licenca_num VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_clinica) REFERENCES Clinica(id_clinica)
);

CREATE TABLE Paciente (
    id_paciente INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    especies VARCHAR(255) NOT NULL,
    dob DATE NOT NULL
);

CREATE TABLE Proprietario (
    id_proprietario INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE Encontro (
    id_encontro INT PRIMARY KEY,
    id_veterinario INT NOT NULL,
    id_paciente INT NOT NULL,
    id_proprietario INT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (id_veterinario) REFERENCES Veterinario(id_veterinario),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_proprietario) REFERENCES Proprietario(id_proprietario)
);