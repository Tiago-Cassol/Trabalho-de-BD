CREATE DATABASE LOJA;

\C LOJA;

CREATE TABLE if not exists Cliente (
    Nome varchar(30) not null,
    Contato bigint not null,
    Data_de_Nascimento Date not null,
    CPF bigint not null,
    Email Varchar(50) not null,
    Login Varchar(15) not null,
    Senha Varchar(15) not null,
    CONSTRAINT pk_Cliente PRIMARY KEY(CPF)
);

CREATE TABLE if not exists Desenvolvedora (
    Nome Varchar(30) not null,
    CNPJ bigint not null,
    CONSTRAINT pk_Desenvolvedora PRIMARY KEY(Nome)
);

CREATE TABLE if not exists Produtos (
    Produto Varchar(50) not null,
    Categoria Varchar(20) not null,
    Promocao Decimal(6,2) null,
    Preco Decimal(6,2) not null,
    fk_Desenvolvedora_Nome Varchar(30),
    CONSTRAINT pk_Produtos PRIMARY KEY(Produto),
    CONSTRAINT fk_Produtos_Cliente FOREIGN KEY(fk_Desenvolvedora_Nome) REFERENCES Desenvolvedora(Nome)
);


CREATE TABLE if not exists Compra (
    Forma_de_Pagamento Varchar(20) not null,
    Data Date not null,
    fk_Produtos_Produto Varchar(50) not null,
    fk_Cliente_CPF bigint not null,
    CONSTRAINT fk_Compra_Produtos FOREIGN KEY(fk_Produtos_Produto) REFERENCES Produtos(Produto),
    CONSTRAINT fk_Compra_Cliente FOREIGN KEY(fk_Cliente_CPF) REFERENCES Cliente(CPF)
);

CREATE TABLE if not exists Devolucao (
    fk_Cliente_CPF bigint not null,
    fk_Produtos_Produto Varchar(50) not null,
    Comentario Varchar(500),
    Valor Decimal(6,2) not null,
    CONSTRAINT fk_Devolucao_Cliente FOREIGN KEY(fk_Cliente_CPF) REFERENCES Cliente(CPF),
    CONSTRAINT fk_Devolucao_Produtos FOREIGN KEY(fk_Produtos_Produto) REFERENCES Produtos(Produto)
);

insert into Cliente(Nome, Contato, Data_de_Nascimento, CPF, Email, Login, Senha) values
  ('Josney Ozorio', 49991587596, '23/04/1998', 15623598642, 'Josneyogado@gmail.com','JosneyUchiha','Naruto0912'),
  ('Sheron Olaine', 49988542631, '04/08/2000', 25631987458, 'Sheronzinha@hotmail.com', 'Sheronzinha100', 'Sheron040800');

insert into Desenvolvedora(Nome, CNPJ) values
  ('Sinned Games', 10025641589745),
  ('Invent4 Entertainment', 51263489755201);

insert into Produtos(Produto, Categoria, Promocao, Preco, fk_Desenvolvedora_Nome) values
  ('Mineirinho Ultra Adventure', 'Aventura', Null, 112.99, 'Sinned Games'),
  ('Bad Rats', 'indie', 72.50, 99.00,'Invent4 Entertainment');

insert into Compra(Forma_de_Pagamento, Data, fk_Produtos_Produto, fk_Cliente_CPF) values
  ('Boleto', '20/05/2021', 'Mineirinho Ultra Adventure', 15623598642),
  ('Cartão de Crédito', '22/05/2021', 'Bad Rats', 25631987458);

insert into Devolucao(fk_Cliente_CPF, fk_Produtos_Produto, Comentario, Valor) values
  (25631987458, 'Bad Rats', 'Eu esperava menos Ratos.', 72.50);
