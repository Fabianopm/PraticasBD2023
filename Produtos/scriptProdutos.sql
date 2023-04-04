CREATE TABLE
    Encomenda (
        id_encomenda INT PRIMARY KEY NOT NULL,
        data_encomenda VARCHAR(45),
        valor_total FLOAT,
        id_cliente INT NOT NULL,
        id_vendedor INT NOT NULL
    );
	
	CREATE TABLE
    Fatura (
        id_fatura INT PRIMARY KEY NOT NULL,
        valor_total VARCHAR(45),
        id_encomenda INT NOT NULL
    );
	
	CREATE TABLE
    Produto (
        id_produto INT PRIMARY KEY NOT NULL,
        quantidade INT NOT NULL,
        id_cliente INT NOT NULL,
        id_encomenda INT NOT NULL
    );
	
	CREATE TABLE
    Encomenda_Produto (
        id_enc_prod INT PRIMARY KEY NOT NULL,
        id_produto INT NOT NULL,
        id_encomenda INT NOT NULL
    );
	
	CREATE TABLE
    Cliente (
        id_cliente INT PRIMARY KEY NOT NULL,
        nome VARCHAR(45) NOT NULL,
        endereco VARCHAR(45) NOT NULL,
        telefone VARCHAR(45) NOT NULL
    );
	
	CREATE TABLE
    Vendedor (
        id_vendedor INT PRIMARY KEY NOT NULL,
        meta_vendas INT NOT NULL,
        exp_anos INT NOT NULL,
        id_empregado INT NOT NULL
    );

CREATE TABLE
    Empregado (
        id_empregado INT PRIMARY KEY NOT NULL,
        nome VARCHAR(45) NOT NULL,
        sobrenome VARCHAR(45) NOT NULL,
        data_Nascimento VARCHAR(45) NOT NULL,
        email VARCHAR(45) NOT NULL,
        cargo VARCHAR(45) NOT NULL,
        salario FLOAT NOT NULL,
        id_departamento INT NOT NULL
    );

CREATE TABLE
    Departamento (
        id_departamento INT PRIMARY KEY NOT NULL,
        nome VARCHAR(45) NOT NULL
    );


ALTER TABLE Fatura ADD CONSTRAINT fatura_encomenda_id_fk FOREIGN KEY (id_encomenda) REFERENCES Encomenda (id_encomenda);
ALTER TABLE Encomenda ADD CONSTRAINT encomenda_cliente_id_fk FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente);
ALTER TABLE Encomenda ADD CONSTRAINT encomenda_vendendor_id_fk FOREIGN KEY (id_vendedor) REFERENCES Vendedor (id_vendedor);
ALTER TABLE Encomenda_Produto ADD CONSTRAINT enc_prod_id_fk FOREIGN KEY (id_encomenda) REFERENCES Encomenda (id_encomenda);
ALTER TABLE Encomenda_Produto ADD CONSTRAINT prod_enc_id_fk FOREIGN KEY (id_produto) REFERENCES Produto (id_produto);
ALTER TABLE Produto ADD CONSTRAINT produto_encomenda_id_fk FOREIGN KEY (id_encomenda) REFERENCES Encomenda (id_encomenda);
ALTER TABLE Produto ADD CONSTRAINT produto_cliente_id_fk FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente);
ALTER TABLE Vendedor ADD CONSTRAINT vendedor_empregado_id_fk FOREIGN KEY (id_empregado) REFERENCES Empregado (id_empregado);
ALTER TABLE Empregado ADD CONSTRAINT empregado_deartamento_id_fk FOREIGN KEY (id_departamento) REFERENCES Departamento (id_departamento);

INSERT INTO Departamento (id_departamento, nome) VALUES (1, 'Vendas');
INSERT INTO Departamento (id_departamento, nome) VALUES (2, 'Limpeza');

INSERT INTO Empregado (id_empregado, nome, sobrenome, data_Nascimento, email, cargo, salario, id_departamento)
VALUES (1, 'Rogerio Souza', 'Santos', '24/10/1998', 'r.souza@gmail.com', 'Vendedor', 2.500, 1);
INSERT INTO Empregado (id_empregado, nome, sobrenome, data_Nascimento, email, cargo, salario, id_departamento)
VALUES (2, 'Marcelo Dantas', 'Onofre', '02/09/1987', 'm.dantas@outlook.com', 'Vendedor', 2.500, 1);
INSERT INTO Empregado (id_empregado, nome, sobrenome, data_Nascimento, email, cargo, salario, id_departamento)
VALUES (3, 'Claudio', 'Pereira', '18/01/2000', 'c.pereira@yahoo.com', 'Faxineiro', 1.700, 2);

INSERT INTO Vendedor (id_vendedor, meta_vendas, exp_anos, id_empregado) VALUES (1, 10, 3, 1);
INSERT INTO Vendedor (id_vendedor, meta_vendas, exp_anos, id_empregado) VALUES (2, 7, 8, 2);
INSERT INTO Vendedor (id_vendedor, meta_vendas, exp_anos, id_empregado) VALUES (3, 23, 10, 3);

INSERT INTO Cliente (id_cliente, nome, endereco, telefone) VALUES (1, 'Gilmar Freitas', 'Av.Joaquim Porto - Guarulhos', '(48)987676554');
INSERT INTO Cliente (id_cliente, nome, endereco, telefone) VALUES (2, 'Juca Leoncio', 'Av.Porto Belo - Belo Horizonte', '(23)915896354');
INSERT INTO Cliente (id_cliente, nome, endereco, telefone) VALUES (3, 'Fabiano Pacheco', 'Francisco Alves - Porto Alegre', '(51)986354176');

INSERT INTO Encomenda (id_encomenda, data_encomenda, valor_total, id_cliente, id_vendedor) VALUES (1, '17/12/2022', 2.500, 1, 1);
INSERT INTO Encomenda (id_encomenda, data_encomenda, valor_total, id_cliente, id_vendedor) VALUES (2, '23/04/2008', 1.700, 2, 2);
INSERT INTO Encomenda (id_encomenda, data_encomenda, valor_total, id_cliente, id_vendedor) VALUES (3, '05/01/2002', 2.750, 3, 3);

INSERT INTO Fatura (id_fatura, valor_total, id_encomenda) VALUES (1, 1.700, 2);
INSERT INTO Fatura (id_fatura, valor_total, id_encomenda) VALUES (2, 2.500, 1);
INSERT INTO Fatura (id_fatura, valor_total, id_encomenda) VALUES (3, 2.750, 3);

INSERT INTO Produto (id_produto, quantidade, id_encomenda, id_cliente) VALUES (1, 5, 1,1);
INSERT INTO Produto (id_produto, quantidade, id_encomenda, id_cliente) VALUES (2, 2, 2,2);
INSERT INTO Produto (id_produto, quantidade, id_encomenda, id_cliente) VALUES (3, 3, 3,3);

INSERT INTO Encomenda_Produto (id_enc_prod, id_produto, id_encomenda) VALUES (1, 2, 3);
INSERT INTO Encomenda_Produto (id_enc_prod, id_produto, id_encomenda) VALUES (2, 1, 2);
INSERT INTO Encomenda_Produto (id_enc_prod, id_produto, id_encomenda) VALUES (3, 3, 1);