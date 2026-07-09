-- ============================================================================
-- Script: 01_create_database.sql
-- Objetivo: Criar o banco de dados
-- SGBD: PostgreSQL
-- ============================================================================

CREATE DATABASE biblioteca_escolar
    WITH
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TEMPLATE = template0;



-- ============================================================================
-- Script: 02_create_schema.sql
-- Objetivo: Criar o schema da aplicação
-- ============================================================================

CREATE SCHEMA IF NOT EXISTS biblioteca;

SET search_path TO biblioteca;



-- ============================================================================
-- Script: 03_create_tables_base.sql
-- Objetivo: Criar tabelas independentes
-- ============================================================================

SET search_path TO biblioteca;



-- ============================================================================
-- Tabela: Categoria
-- ============================================================================

CREATE TABLE tb_categoria (

    id              INTEGER GENERATED ALWAYS AS IDENTITY,
    nome            VARCHAR(100) NOT NULL,
    descricao       VARCHAR(255),

    created_at      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_categoria
        PRIMARY KEY (id),

    CONSTRAINT uk_categoria_nome
        UNIQUE (nome)

);



-- ============================================================================
-- Tabela: Editora
-- ============================================================================

CREATE TABLE tb_editora (

    id              INTEGER GENERATED ALWAYS AS IDENTITY,
    nome            VARCHAR(150) NOT NULL,
    site            VARCHAR(255),

    created_at      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_editora
        PRIMARY KEY (id),

    CONSTRAINT uk_editora_nome
        UNIQUE (nome)

);



-- ============================================================================
-- Tabela: Autor
-- ============================================================================

CREATE TABLE tb_autor (

    id                  INTEGER GENERATED ALWAYS AS IDENTITY,
    nome                VARCHAR(150) NOT NULL,
    data_nascimento     DATE,

    created_at          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_autor
        PRIMARY KEY (id)

);



-- ============================================================================
-- Tabela: Perfil
-- ============================================================================

CREATE TABLE tb_perfil (

    id              INTEGER GENERATED ALWAYS AS IDENTITY,
    nome            VARCHAR(50) NOT NULL,
    descricao       VARCHAR(255),

    created_at      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_perfil
        PRIMARY KEY (id),

    CONSTRAINT uk_perfil_nome
        UNIQUE (nome)

);



-- ============================================================================
-- Tabela: Status
-- ============================================================================

CREATE TABLE tb_status (

    id              INTEGER GENERATED ALWAYS AS IDENTITY,
    tipo            VARCHAR(30) NOT NULL,
    status          VARCHAR(50) NOT NULL,
    descricao       VARCHAR(255),

    created_at      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_status
        PRIMARY KEY (id),

    CONSTRAINT uk_status
        UNIQUE (tipo, status),

    CONSTRAINT ck_tipo
        CHECK (tipo <> ''),

    CONSTRAINT ck_status
        CHECK (status <> '')

);



-- ============================================================================
-- Script: 04_create_tb_livro.sql
-- Objetivo: Criar a tabela de livros
-- Dependências:
--   - tb_categoria
--   - tb_editora
-- ============================================================================

SET search_path TO biblioteca;

CREATE TABLE tb_livro (

    id                  INTEGER GENERATED ALWAYS AS IDENTITY,

    id_categoria        INTEGER NOT NULL,
    id_editora          INTEGER NOT NULL,

    isbn                VARCHAR(20) NOT NULL,
    titulo              VARCHAR(200) NOT NULL,
    sinopse             TEXT,
    edicao              INTEGER,
    ano_publicacao      SMALLINT,
    numero_paginas      INTEGER,

    created_at          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_livro
        PRIMARY KEY (id),

    CONSTRAINT uk_livro_isbn
        UNIQUE (isbn),

    CONSTRAINT fk_livro_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES tb_categoria(id),

    CONSTRAINT fk_livro_editora
        FOREIGN KEY (id_editora)
        REFERENCES tb_editora(id),

    CONSTRAINT ck_livro_paginas
        CHECK (numero_paginas > 0),

    CONSTRAINT ck_livro_edicao
        CHECK (edicao > 0)

);



-- ============================================================================
-- Script: 05_create_tb_livro_autor.sql
-- Objetivo: Resolver o relacionamento N:N entre Livro e Autor
-- Dependências:
--   - tb_livro
--   - tb_autor
-- ============================================================================

SET search_path TO biblioteca;

CREATE TABLE tb_livroAutor (

    id_livro            INTEGER NOT NULL,
    id_autor            INTEGER NOT NULL,

    ordem_autoria       INTEGER NOT NULL DEFAULT 1,

    created_at          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_livroAutor
        PRIMARY KEY (
            id_livro,
            id_autor
        ),

    CONSTRAINT fk_livroAutor_livro
        FOREIGN KEY (id_livro)
        REFERENCES tb_livro(id),

    CONSTRAINT fk_livroAutor_autor
        FOREIGN KEY (id_autor)
        REFERENCES tb_autor(id),

    CONSTRAINT ck_ordem_autoria
        CHECK (ordem_autoria > 0)

);



-- ============================================================================
-- Script: 06_create_tb_usuario.sql
-- Objetivo: Criar usuários do sistema
-- Dependências:
--   - tb_perfil
-- ============================================================================

SET search_path TO biblioteca;

CREATE TABLE tb_usuario (

    id                  INTEGER GENERATED ALWAYS AS IDENTITY,

    id_perfil           INTEGER NOT NULL,

    nome                VARCHAR(150) NOT NULL,
    matricula           VARCHAR(30) NOT NULL,
    email               VARCHAR(150) NOT NULL,
    telefone            VARCHAR(30),

    ativo               BOOLEAN NOT NULL DEFAULT TRUE,

    created_at          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_usuario
        PRIMARY KEY (id),

    CONSTRAINT uk_usuario_matricula
        UNIQUE (matricula),

    CONSTRAINT uk_usuario_email
        UNIQUE (email),

    CONSTRAINT fk_usuario_perfil
        FOREIGN KEY (id_perfil)
        REFERENCES tb_perfil(id),

    CONSTRAINT ck_matricula
        CHECK (matricula <> ''),

    CONSTRAINT ck_email
        CHECK (email <> '')
);



-- ============================================================================
-- Script: 07_create_tb_exemplar.sql
-- Objetivo: Criar os exemplares físicos dos livros
-- Dependências:
--   - tb_livro
--   - tb_status
-- ============================================================================

SET search_path TO biblioteca;

CREATE TABLE tb_exemplar (

    id                      INTEGER GENERATED ALWAYS AS IDENTITY,

    id_status               INTEGER NOT NULL,
    id_livro                INTEGER NOT NULL,

    codigo_patrimonio       VARCHAR(30) NOT NULL,

    data_aquisicao          DATE,

    observacao              VARCHAR(255),

    created_at              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_exemplar
        PRIMARY KEY (id),

    CONSTRAINT uk_exemplar_codigo
        UNIQUE (codigo_patrimonio),

    CONSTRAINT fk_exemplar_livro
        FOREIGN KEY (id_livro)
        REFERENCES tb_livro(id),

    CONSTRAINT fk_exemplar_status
        FOREIGN KEY (id_status)
        REFERENCES tb_status(id),
    
    CONSTRAINT ck_codigo_patrimonio
        CHECK (codigo_patrimonio <> '')

);



-- ============================================================================
-- Script: 08_create_tb_reserva.sql
-- Objetivo: Criar a tabela de reservas
-- Dependências:
--   - tb_livro
--   - tb_usuario
--   - tb_status
-- ============================================================================

SET search_path TO biblioteca;

CREATE TABLE tb_reserva (

    id                  INTEGER GENERATED ALWAYS AS IDENTITY,

    id_livro            INTEGER NOT NULL,
    id_usuario          INTEGER NOT NULL,
    id_status           INTEGER NOT NULL,

    data_reserva        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_atendimento    TIMESTAMP,
    data_expiracao      TIMESTAMP,
    data_cancelamento   TIMESTAMP,

    created_at          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_reserva
        PRIMARY KEY (id),

    CONSTRAINT fk_reserva_livro
        FOREIGN KEY (id_livro)
        REFERENCES tb_livro(id),

    CONSTRAINT fk_reserva_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES tb_usuario(id),

    CONSTRAINT fk_reserva_status
        FOREIGN KEY (id_status)
        REFERENCES tb_status(id)

);



-- ============================================================================
-- Script: 09_create_tb_emprestimo.sql
-- Objetivo: Criar a tabela de empréstimos
-- Dependências:
--   - tb_exemplar
--   - tb_usuario
--   - tb_status
-- ============================================================================

SET search_path TO biblioteca;

CREATE TABLE tb_emprestimo (

    id                          INTEGER GENERATED ALWAYS AS IDENTITY,

    id_exemplar                 INTEGER NOT NULL,

    id_usuario_responsavel      INTEGER NOT NULL,

    id_usuario_registro         INTEGER NOT NULL,

    id_status                   INTEGER NOT NULL,

    data_emprestimo             TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    data_prevista_devolucao     TIMESTAMP NOT NULL,

    data_devolucao              TIMESTAMP,

    created_at                  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at                  TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_emprestimo
        PRIMARY KEY (id),

    CONSTRAINT fk_emprestimo_exemplar
        FOREIGN KEY (id_exemplar)
        REFERENCES tb_exemplar(id),

    CONSTRAINT fk_emprestimo_usuario
        FOREIGN KEY (id_usuario_responsavel)
        REFERENCES tb_usuario(id),

    CONSTRAINT fk_emprestimo_bibliotecario
        FOREIGN KEY (id_usuario_registro)
        REFERENCES tb_usuario(id),

    CONSTRAINT fk_emprestimo_status
        FOREIGN KEY (id_status)
        REFERENCES tb_status(id),

    CONSTRAINT ck_datas_emprestimo
        CHECK (
            data_prevista_devolucao >= data_emprestimo
        ),

    CONSTRAINT ck_data_devolucao
        CHECK (
            data_devolucao IS NULL
            OR
            data_devolucao >= data_emprestimo
        )

);



-- ============================================================================
-- Script: 10_create_indexes.sql
-- Objetivo: Criar índices para otimização das consultas
-- ============================================================================

SET search_path TO biblioteca;

-- ============================================================================
-- Livro
-- ============================================================================

CREATE INDEX idx_livro_categoria
ON tb_livro(id_categoria);

CREATE INDEX idx_livro_editora
ON tb_livro(id_editora);

-- ============================================================================
-- LivroAutor
-- ============================================================================

CREATE INDEX idx_livroAutor_autor
ON tb_livroAutor(id_autor);

-- ============================================================================
-- Usuário
-- ============================================================================

CREATE INDEX idx_usuario_perfil
ON tb_usuario(id_perfil);

-- ============================================================================
-- Exemplar
-- ============================================================================

CREATE INDEX idx_exemplar_livro
ON tb_exemplar(id_livro);

CREATE INDEX idx_exemplar_status
ON tb_exemplar(id_status);

-- ============================================================================
-- Reserva
-- ============================================================================

CREATE INDEX idx_reserva_livro
ON tb_reserva(id_livro);

CREATE INDEX idx_reserva_usuario
ON tb_reserva(id_usuario);

CREATE INDEX idx_reserva_status
ON tb_reserva(id_status);

CREATE INDEX idx_reserva_data
ON tb_reserva(data_reserva);

-- ============================================================================
-- Empréstimo
-- ============================================================================

CREATE INDEX idx_emprestimo_exemplar
ON tb_emprestimo(id_exemplar);

CREATE INDEX idx_emprestimo_usuario
ON tb_emprestimo(id_usuario_responsavel);

CREATE INDEX idx_emprestimo_registro
ON tb_emprestimo(id_usuario_registro);

CREATE INDEX idx_emprestimo_status
ON tb_emprestimo(id_status);

CREATE INDEX idx_emprestimo_data
ON tb_emprestimo(data_emprestimo);

-- ============================================================================
-- Status
-- ============================================================================

CREATE INDEX idx_tipo_status
ON tb_status(tipo, status);
