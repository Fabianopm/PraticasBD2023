CREATE TABLE pessoas(
    id_pessoas INT PRIMARY KEY NOT NULL,
    nome VARCHAR (45) NOT NULL,
    sobrenome VARCHAR(45) NOT NULL,
    email VARCHAR (45) NOT NULL,
    sexo VARCHAR (45) NOT NULL
);

CREATE TABLE apartamento(
    id_apto INT PRIMARY KEY NOT NULL,
    nome VARCHAR (45) NOT NULL,
    numero INT NOT NULL,
    banheiros INT NOT NULL,
    quartos INT NOT NULL,
    id_pessoas INT NOT NULL,
    id_predios INT NOT NULL
);


CREATE TABLE predios(
    id_predios INT PRIMARY KEY NOT NULL,
    nome VARCHAR (45) NOT NULL,
    numeroAndares INT NOT NULL,
    id_rua INT NOT NULL
);


CREATE TABLE rua(
    id_rua INT PRIMARY KEY NOT NULL,
    nome VARCHAR (45) NOT NULL,
    CEP VARCHAR (45) NOT NULL,
    id_cidade INT NOT NULL
);

CREATE TABLE cidade(
    id_cidade INT PRIMARY KEY NOT NULL,
    nome VARCHAR (45) NOT NULL,
    estado VARCHAR (45),
    id_pais INT NOT NULL
);

CREATE TABLE pais(
    id_pais INT PRIMARY KEY NOT NULL,
    nome VARCHAR (45) NOT NULL,
    id_continente INT NOT NULL 
);

CREATE TABLE continente(
    id_continente INT PRIMARY KEY NOT NULL,
    nome VARCHAR (45) NOT NULL
);

insert into pessoas (id_pessoas, nome, sobrenome, email, sexo) values (1, 'Isabel', 'MacCarter', 'imaccarter0@yandex.ru', 'Female');
insert into pessoas (id_pessoas, nome, sobrenome, email, sexo) values (2, 'Arabela', 'Adrien', 'aadrien1@state.gov', 'Agender');
insert into pessoas (id_pessoas, nome, sobrenome, email, sexo) values (3, 'Joanie', 'Rouby', 'jrouby2@delicious.com', 'Female');
insert into pessoas (id_pessoas, nome, sobrenome, email, sexo) values (4, 'Ferdinanda', 'Parlor', 'fparlor3@china.com.cn', 'Female');
insert into pessoas (id_pessoas, nome, sobrenome, email, sexo) values (5, 'Magdalene', 'Denford', 'mdenford4@narod.ru', 'Female');

insert into apartamento (id_apto, nome, numero, banheiros, quartos, id_pessoas, id_predios) values (1, 'Barton, Considine and Cremin', 1, 1, 1, 1, 1);
insert into apartamento (id_apto, nome, numero, banheiros, quartos, id_pessoas, id_predios) values (2, 'Johnson-Weissnat', 2, 2, 2, 2, 2);
insert into apartamento (id_apto, nome, numero, banheiros, quartos, id_pessoas, id_predios) values (3, 'Bahringer Inc', 3, 3, 3, 3, 3);
insert into apartamento (id_apto, nome, numero, banheiros, quartos, id_pessoas, id_predios) values (4, 'Beahan, Quitzon and Monahan', 4, 4, 4, 4, 4);
insert into apartamento (id_apto, nome, numero, banheiros, quartos, id_pessoas, id_predios) values (5, 'Shields Group', 5, 5, 5, 5, 5);

insert into predios (id_predios, nome, numeroAndares, id_rua) values (1, 'Kuhlman LLC', 1, 1);
insert into predios (id_predios, nome, numeroAndares, id_rua) values (2, 'Leannon and Sons', 2, 2);
insert into predios (id_predios, nome, numeroAndares, id_rua) values (3, 'Ratke Inc', 3, 3);
insert into predios (id_predios, nome, numeroAndares, id_rua) values (4, 'Oberbrunner-Pfannerstill', 4, 4);
insert into predios (id_predios, nome, numeroAndares, id_rua) values (5, 'Kohler, Farrell and Murray', 5, 5);

insert into rua (id_rua, nome, CEP, id_cidade) values (1, 'Delladonna', '75554', 1);
insert into rua (id_rua, nome, CEP, id_cidade) values (2, 'Beilfuss', '1787', 2);
insert into rua (id_rua, nome, CEP, id_cidade) values (3, 'Columbus', '791', 3);
insert into rua (id_rua, nome, CEP, id_cidade) values (4, 'Armistice', '93', 4);
insert into rua (id_rua, nome, CEP, id_cidade) values (5, 'Nancy', '810', 5);

insert into cidade (id_cidade, nome, estado, id_pais) values (1, 'Nevada', 'RE', 1);
insert into cidade (id_cidade, nome, estado, id_pais) values (2, 'Killdeer', 'TR', 2);
insert into cidade (id_cidade, nome, estado, id_pais) values (3, 'Prairieview', 'YU', 3);
insert into cidade (id_cidade, nome, estado, id_pais) values (4, '7th', 'AD', 4);
insert into cidade (id_cidade, nome, estado, id_pais) values (5, 'Dixon', 'ER', 5);

insert into pais (id_pais, nome, id_continente) values (1, 'Philippines', 1);
insert into pais (id_pais, nome, id_continente) values (2, 'Norway', 2);
insert into pais (id_pais, nome, id_continente) values (3, 'China', 3);
insert into pais (id_pais, nome, id_continente) values (4, 'Cuba', 4);
insert into pais (id_pais, nome, id_continente) values (5, 'Uruguay', 5);

insert into continente (id_continente, nome) values (1, 'Ásia');
insert into continente (id_continente, nome) values (2, 'Europa');
insert into continente (id_continente, nome) values (3, 'Europa');
insert into continente (id_continente, nome) values (4, 'América');
insert into continente (id_continente, nome) values (5, 'Oceania');

DROP TABLE pessoas;
DROP TABLE apartamento;
DROP TABLE predios;
DROP TABLE rua;
DROP TABLE cidade;
DROP TABLE pais;
DROP TABLE continente;

ALTER TABLE apartamento ADD CONSTRAINT apartamento_pessoas_id_fk FOREIGN KEY (id_pessoas) REFERENCES pessoas (id_pessoas);
ALTER TABLE apartamento ADD CONSTRAINT apartamento_predios_id_fk FOREIGN KEY (id_predios) REFERENCES predios (id_predios);
ALTER TABLE predios ADD CONSTRAINT predios_rua_id_fk FOREIGN KEY (id_rua) REFERENCES rua (id_rua);
ALTER TABLE rua ADD CONSTRAINT rua_cidade_id_fk FOREIGN KEY (id_cidade) REFERENCES cidade (id_cidade);
ALTER TABLE cidade ADD CONSTRAINT cidade_pais_id_fk FOREIGN KEY (id_pais) REFERENCES pais (id_pais);
ALTER TABLE pais ADD CONSTRAINT pais_continente_id_fk FOREIGN KEY (id_continente) REFERENCES continente (id_continente);