CREATE TABLE TB_GUIA (
    Id serial PRIMARY KEY,
    Title varchar(150) NOT NULL,
    Publication timestamp NOT NULL,
    Descricao varchar(500),
    IdPai int
);

ALTER TABLE TB_GUIA
    ADD FOREIGN KEY (IdPai) REFERENCES TB_GUIA(Id); 

CREATE TABLE TB_ITEM_GUIA (
    Id serial PRIMARY KEY,
    Title varchar(150) NOT NULL,
    Content varchar(500) NOT NULL,
    IdGuia int
);

ALTER TABLE TB_ITEM_GUIA
    ADD FOREIGN KEY (IdGuia) REFERENCES TB_GUIA(Id); 

CREATE TABLE TB_USUARIO_FORMACAO(
    Id serial PRIMARY KEY,
    Descricao varchar(150)
);

CREATE TABLE TB_USUARIO_VINCULO(
    Id serial PRIMARY KEY,
    Descricao varchar(150)
);

CREATE TABLE TB_USUARIO_TIPO(
    Id serial PRIMARY KEY,
    Descricao varchar(150)
);

CREATE TABLE TB_USUARIO_SETOR(
    Id serial PRIMARY KEY,
    Descricao varchar(150)
);

CREATE TABLE TB_USUARIO_EXPERIENCIA(
    Id serial PRIMARY KEY,
    Descricao varchar(20) NOT NULL,
    Minimo int,
    Maximo int
);

CREATE TABLE TB_USUARIO (
    Id serial PRIMARY KEY,
    Nome varchar(150) NOT NULL,
    Email varchar(254) NOT NULL,
    Formacao int,
    Vinculo int,
    Tipo int,
    Setor int,
    Experiencia int
);

ALTER TABLE TB_USUARIO
    ADD FOREIGN KEY (Formacao) REFERENCES TB_USUARIO_FORMACAO(id); 

ALTER TABLE TB_USUARIO
    ADD FOREIGN KEY (Vinculo) REFERENCES TB_USUARIO_VINCULO(id); 

ALTER TABLE TB_USUARIO
    ADD FOREIGN KEY (Tipo) REFERENCES TB_USUARIO_TIPO(id); 

ALTER TABLE TB_USUARIO
    ADD FOREIGN KEY (Setor) REFERENCES TB_USUARIO_SETOR(id); 

ALTER TABLE TB_USUARIO
    ADD FOREIGN KEY (Experiencia) REFERENCES TB_USUARIO_EXPERIENCIA(id); 

CREATE TABLE TB_ACESSO (
    Id int PRIMARY KEY,
    Usuario int NOT NULL,
    Guia int NOT NULL,
    Momento timestamp NOT NULL
);

ALTER TABLE TB_ACESSO
    ADD FOREIGN KEY (Usuario) REFERENCES TB_USUARIO(Id); 

ALTER TABLE TB_ACESSO
    ADD FOREIGN KEY (Guia) REFERENCES TB_GUIA(id); 

