CREATE TABLE passageiros(
    id        BIGINT NOT NULL,
    nome      VARCHAR(45) NOT NULL,
    CPF       VARCHAR(45) NOT NULL,
    telefone  VARCHAR(45) NOT NULL,
    email     VARCHAR(45) NOT NULL,
    endereco  VARCHAR(45) NOT NULL
);

CREATE TABLE reserva(
    id           BIGINT NOT NULL,
    data_reserva VARCHAR(45) NOT NULL,
    id_passageiros BIGINT NOT NULL,
    id_voo BIGINT NOT NULL,
    id_assento BIGINT NOT NULL
);

CREATE TABLE voo(
    id            BIGINT NOT NULL,
    origem        VARCHAR(45),
    destino       VARCHAR(45),
    data_chegada  VARCHAR(45),
    data_partida  VARCHAR(45),
    hora_partida  VARCHAR(45),
    hora_chegada  VARCHAR(45)
);

CREATE TABLE assento(
    id      BIGINT NOT NULL,
    numero  INT NOT NULL,
    classe  VARCHAR(45),
    id_voo BIGINT NOT NULL
);

CREATE TABLE pagamento(
    id             BIGINT NOT NULL,
    valor          NUMERIC(10,2),
    data_pagamento VARCHAR(45),
    id_reserva BIGINT NOT NULL
);

ALTER TABLE passageiros ADD PRIMARY KEY (id);
ALTER TABLE reserva     ADD PRIMARY KEY (id);
ALTER TABLE voo         ADD PRIMARY KEY (id);
ALTER TABLE assento    ADD PRIMARY KEY (id);
ALTER TABLE pagamento   ADD PRIMARY KEY (id);

ALTER TABLE reserva ADD FOREIGN KEY (id_passageiros) REFERENCES passageiros (id);
ALTER TABLE reserva ADD FOREIGN KEY (id_voo) REFERENCES voo (id);
ALTER TABLE reserva ADD FOREIGN KEY (id_assento) REFERENCES assento (id);
ALTER TABLE pagamento ADD FOREIGN KEY (id_reserva) REFERENCES reserva (id);
ALTER TABLE assento ADD FOREIGN KEY (id_voo) REFERENCES voo (id);

CREATE SEQUENCE passageiros_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE reserva_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE voo_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE assento_id_seq
INCREMENT 1
START 1
CACHE 1;

CREATE SEQUENCE pagamento_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE passageiros ALTER COLUMN id SET DEFAULT NEXTVAL('passageiros_id_seq');
ALTER TABLE reserva ALTER COLUMN id SET DEFAULT NEXTVAL('reserva_id_seq');
ALTER TABLE voo ALTER COLUMN id SET DEFAULT NEXTVAL('voo_id_seq');
ALTER TABLE assento ALTER COLUMN id SET DEFAULT NEXTVAL('assento_id_seq');
ALTER TABLE pagamento ALTER COLUMN id SET DEFAULT NEXTVAL('pagamento_id_seq');

drop table passageiros;
drop table reserva;
drop table assento;
drop table pagamento;
drop table voo;