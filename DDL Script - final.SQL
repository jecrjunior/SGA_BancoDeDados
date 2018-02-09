/*
Created: 09/02/2018
Modified: 09/02/2018
Model: RE PostgreSQL 9.5
Database: PostgreSQL 9.5
*/

-- Create tables section -------------------------------------------------

-- Table public.tb_acesso

CREATE TABLE "public"."tb_acesso"(
 "id" Serial NOT NULL,
 "usuario" Integer NOT NULL,
 "guia" Integer NOT NULL,
 "momento" Timestamp NOT NULL
)
;

-- Add keys for table public.tb_acesso

ALTER TABLE "public"."tb_acesso" ADD CONSTRAINT "tb_acesso_pkey" PRIMARY KEY ("id")
;

-- Table public.tb_guia

CREATE TABLE "public"."tb_guia"(
 "id" Serial NOT NULL,
 "titulo" Character varying(150) NOT NULL,
 "publicacao" Timestamp NOT NULL,
 "descricao" Character varying(500),
 "idpai" Integer
)
;

-- Add keys for table public.tb_guia

ALTER TABLE "public"."tb_guia" ADD CONSTRAINT "tb_guia_pkey" PRIMARY KEY ("id")
;

-- Table public.tb_item_guia

CREATE TABLE "public"."tb_item_guia"(
 "id" Serial NOT NULL,
 "titulo" Character varying(150) NOT NULL,
 "conteudo" Character varying(500) NOT NULL,
 "idguia" Integer,
 "tipo" Integer
)
;

-- Add keys for table public.tb_item_guia

ALTER TABLE "public"."tb_item_guia" ADD CONSTRAINT "tb_item_guia_pkey" PRIMARY KEY ("id")
;

-- Table public.tb_usuario

CREATE TABLE "public"."tb_usuario"(
 "id" Serial NOT NULL,
 "nome" Character varying(150) NOT NULL,
 "email" Character varying(254) NOT NULL,
 "formacao" Integer,
 "vinculo" Integer,
 "tipo" Integer,
 "setor" Integer,
 "experiencia" Integer
)
;

-- Add keys for table public.tb_usuario

ALTER TABLE "public"."tb_usuario" ADD CONSTRAINT "tb_usuario_pkey" PRIMARY KEY ("id")
;

-- Table public.tb_usuario_experiencia

CREATE TABLE "public"."tb_usuario_experiencia"(
 "id" Serial NOT NULL,
 "descricao" Character varying(20) NOT NULL,
 "minimo" Integer,
 "maximo" Integer
)
;

-- Add keys for table public.tb_usuario_experiencia

ALTER TABLE "public"."tb_usuario_experiencia" ADD CONSTRAINT "tb_usuario_experiencia_pkey" PRIMARY KEY ("id")
;

-- Table public.tb_usuario_formacao

CREATE TABLE "public"."tb_usuario_formacao"(
 "id" Serial NOT NULL,
 "descricao" Character varying(150)
)
;

-- Add keys for table public.tb_usuario_formacao

ALTER TABLE "public"."tb_usuario_formacao" ADD CONSTRAINT "tb_usuario_formacao_pkey" PRIMARY KEY ("id")
;

-- Table public.tb_usuario_setor

CREATE TABLE "public"."tb_usuario_setor"(
 "id" Serial NOT NULL,
 "descricao" Character varying(150)
)
;

-- Add keys for table public.tb_usuario_setor

ALTER TABLE "public"."tb_usuario_setor" ADD CONSTRAINT "tb_usuario_setor_pkey" PRIMARY KEY ("id")
;

-- Table public.tb_usuario_tipo

CREATE TABLE "public"."tb_usuario_tipo"(
 "id" Serial NOT NULL,
 "descricao" Character varying(150)
)
;

-- Add keys for table public.tb_usuario_tipo

ALTER TABLE "public"."tb_usuario_tipo" ADD CONSTRAINT "tb_usuario_tipo_pkey" PRIMARY KEY ("id")
;

-- Table public.tb_usuario_vinculo

CREATE TABLE "public"."tb_usuario_vinculo"(
 "id" Serial NOT NULL,
 "descricao" Character varying(150)
)
;

-- Add keys for table public.tb_usuario_vinculo

ALTER TABLE "public"."tb_usuario_vinculo" ADD CONSTRAINT "tb_usuario_vinculo_pkey" PRIMARY KEY ("id")
;

-- Table public.tb_item_guia_tipo

CREATE TABLE "public"."tb_item_guia_tipo"(
 "id" Serial NOT NULL,
 "descricao" Character varying(50)
)
;

-- Add keys for table public.tb_item_guia_tipo

ALTER TABLE "public"."tb_item_guia_tipo" ADD CONSTRAINT "Key1" PRIMARY KEY ("id")
;
-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE "public"."tb_guia" ADD CONSTRAINT "fk_guia_pai" FOREIGN KEY ("idpai") REFERENCES "public"."tb_guia" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "public"."tb_item_guia" ADD CONSTRAINT "fk_guia" FOREIGN KEY ("idguia") REFERENCES "public"."tb_guia" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "public"."tb_usuario" ADD CONSTRAINT "fk_usuario_formacao" FOREIGN KEY ("formacao") REFERENCES "public"."tb_usuario_formacao" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "public"."tb_usuario" ADD CONSTRAINT "fk_usuario_vinculo" FOREIGN KEY ("vinculo") REFERENCES "public"."tb_usuario_vinculo" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "public"."tb_usuario" ADD CONSTRAINT "fk_usuario_tipo" FOREIGN KEY ("tipo") REFERENCES "public"."tb_usuario_tipo" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "public"."tb_usuario" ADD CONSTRAINT "fk_usuario_setor" FOREIGN KEY ("setor") REFERENCES "public"."tb_usuario_setor" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "public"."tb_usuario" ADD CONSTRAINT "fk_usuario_experiencia" FOREIGN KEY ("experiencia") REFERENCES "public"."tb_usuario_experiencia" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "public"."tb_acesso" ADD CONSTRAINT "fk_acesso_item_guia" FOREIGN KEY ("guia") REFERENCES "public"."tb_item_guia" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "public"."tb_acesso" ADD CONSTRAINT "fk_acesso_usuario" FOREIGN KEY ("usuario") REFERENCES "public"."tb_usuario" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

ALTER TABLE "public"."tb_item_guia" ADD CONSTRAINT "fk_tipo" FOREIGN KEY ("tipo") REFERENCES "public"."tb_item_guia_tipo" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION
;

