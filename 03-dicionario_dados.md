# Dicionário de Dados

## Objetivo

Este documento detalha os atributos identificados durante a construção do modelo lógico do Sistema de Biblioteca Escolar.

Enquanto o modelo conceitual representa o domínio por meio de entidades e relacionamentos, e o modelo lógico apresenta as tabelas e seus atributos principais, o dicionário de dados descreve tecnicamente cada atributo, indicando seu tipo de dado, restrições, finalidade e relacionamento com as regras de negócio.

Este documento servirá como base para a implementação do modelo físico em ==PostgreSQL==.

---

# Entidade: tb_categoria

## Descrição

Representa as categorias utilizadas para classificar os livros da biblioteca.

### Atributos

| Campo      | Tipo         | PK | FK | NN | UK |      Default      | Descrição                                |
| ---------- | ------------ | :-: | :-: | :-: | :-: | :---------------: | ------------------------------------------ |
| id         | INTEGER      | ✓ |    | ✓ |    |       AUTO       | Identificador da categoria.                |
| nome       | VARCHAR(100) |    |    | ✓ | ✓ |                  | Nome da categoria.                         |
| descricao  | VARCHAR(255) |    |    |    |    |                  | Descrição da categoria.                  |
| created_at | TIMESTAMP    |    |    | ✓ |    | CURRENT_TIMESTAMP | Data de criação do registro.             |
| updated_at | TIMESTAMP    |    |    | ✓ |    | CURRENT_TIMESTAMP | Data da última atualização do registro. |

### Restrições

- Nome da categoria deve ser único.
- Toda categoria pode estar associada a diversos livros.

### Regras de Negócio Relacionadas

- RN07
- RN08
- RN17

---

# Entidade: tb_editora

## Descrição

Representa as editoras responsáveis pelas publicações dos livros.

### Atributos

| Campo      | Tipo         | PK | FK | NN | UK |      Default      | Descrição                    |
| ---------- | ------------ | :-: | :-: | :-: | :-: | :---------------: | ------------------------------ |
| id         | INTEGER      | ✓ |    | ✓ |    |       AUTO       | Identificador da editora.      |
| nome       | VARCHAR(150) |    |    | ✓ | ✓ |                  | Nome da editora.               |
| site       | VARCHAR(255) |    |    |    |    |                  | Site oficial da editora.       |
| created_at | TIMESTAMP    |    |    | ✓ |    | CURRENT_TIMESTAMP | Data de criação.             |
| updated_at | TIMESTAMP    |    |    | ✓ |    | CURRENT_TIMESTAMP | Data da última atualização. |

### Restrições

- Nome da editora deve ser único.

### Regras de Negócio Relacionadas

- RN09
- RN10
- RN17

---

# Entidade: tb_autor

## Descrição

Representa os autores das obras cadastradas.

### Atributos

| Campo           | Tipo         | PK | FK | NN | UK |      Default      | Descrição                    |
| --------------- | ------------ | :-: | :-: | :-: | :-: | :---------------: | ------------------------------ |
| id              | INTEGER      | ✓ |    | ✓ |    |       AUTO       | Identificador do autor.        |
| nome            | VARCHAR(150) |    |    | ✓ |    |                  | Nome completo do autor.        |
| data_nascimento | DATE         |    |    |    |    |                  | Data de nascimento do autor.   |
| created_at      | TIMESTAMP    |    |    | ✓ |    | CURRENT_TIMESTAMP | Data de criação.             |
| updated_at      | TIMESTAMP    |    |    | ✓ |    | CURRENT_TIMESTAMP | Data da última atualização. |

### Restrições

- O autor poderá estar associado a vários livros.

### Regras de Negócio Relacionadas

- RN05
- RN06
- RN17

---

# Entidade: tb_livro

## Descrição

Representa os livros cadastrados na biblioteca.

### Atributos

| Campo          | Tipo         | PK | FK | NN | UK |      Default      | Descrição                             |
| -------------- | ------------ | :-: | :-: | :-: | :-: | :---------------: | --------------------------------------- |
| id             | INTEGER      | ✓ |    | ✓ |    |       AUTO       | Identificador do livro.                 |
| id_categoria   | INTEGER      |    | ✓ | ✓ |    |                  | Categoria do livro.                     |
| id_editora     | INTEGER      |    | ✓ | ✓ |    |                  | Editora responsável pela publicação. |
| isbn           | VARCHAR(20)  |    |    | ✓ | ✓ |                  | ISBN da obra.                           |
| titulo         | VARCHAR(255) |    |    | ✓ |    |                  | Título do livro.                       |
| sinopse        | TEXT         |    |    |    |    |                  | Resumo da obra.                         |
| edicao         | VARCHAR(30)  |    |    |    |    |                  | Número da edição.                    |
| ano_publicacao | SMALLINT     |    |    | ✓ |    |                  | Ano de publicação.                    |
| numero_paginas | INTEGER      |    |    | ✓ |    |                  | Quantidade de páginas.                 |
| created_at     | TIMESTAMP    |    |    | ✓ |    | CURRENT_TIMESTAMP | Data de criação.                      |
| updated_at     | TIMESTAMP    |    |    | ✓ |    | CURRENT_TIMESTAMP | Data da última atualização.          |

### Restrições

- ISBN deve ser único.
- Todo livro deve possuir uma categoria.
- Todo livro deve possuir uma editora.

### Regras de Negócio Relacionadas

- RN03
- RN04
- RN05
- RN06
- RN07
- RN08
- RN09
- RN10
- RN17

---

# Entidade: tb_livroAutor

## Descrição

Representa a associação entre livros e autores.

### Atributos

| Campo         | Tipo      | PK | FK | NN | UK |      Default      | Descrição                    |
| ------------- | --------- | :-: | :-: | :-: | :-: | :---------------: | ------------------------------ |
| id_livro      | INTEGER   | ✓ | ✓ | ✓ |    |                  | Livro relacionado.             |
| id_autor      | INTEGER   | ✓ | ✓ | ✓ |    |                  | Autor relacionado.             |
| ordem_autoria | SMALLINT  |    |    | ✓ |    |         1         | Ordem de autoria da obra.      |
| created_at    | TIMESTAMP |    |    | ✓ |    | CURRENT_TIMESTAMP | Data de criação.             |
| updated_at    | TIMESTAMP |    |    | ✓ |    | CURRENT_TIMESTAMP | Data da última atualização. |

### Restrições

- A combinação `(id_livro, id_autor)` forma a chave primária composta.
- Não pode existir a mesma associação mais de uma vez.

### Regras de Negócio Relacionadas

- RN05
- RN06
- RN17

---

# Entidade: tb_status

## Descrição

Centraliza os estados utilizados por diferentes entidades do sistema.

### Atributos

| Campo      | Tipo         | PK | FK | NN | UK |      Default      | Descrição                                                           |
| ---------- | ------------ | :-: | :-: | :-: | :-: | :---------------: | --------------------------------------------------------------------- |
| id         | INTEGER      | ✓ |    | ✓ |    |       AUTO       | Identificador do status.                                              |
| tipo       | VARCHAR(30)  |    |    | ✓ |    |                  | Domínio ao qual o status pertence (EXEMPLAR, RESERVA ou EMPRESTIMO). |
| status     | VARCHAR(50)  |    |    | ✓ |    |                  | Nome do status.                                                       |
| descricao  | VARCHAR(255) |    |    |    |    |                  | Descrição do status.                                                |
| created_at | TIMESTAMP    |    |    | ✓ |    | CURRENT_TIMESTAMP | Data de criação.                                                    |
| updated_at | TIMESTAMP    |    |    | ✓ |    | CURRENT_TIMESTAMP | Data da última atualização.                                        |

### Restrições

- A combinação `(tipo, status)` deve ser única.

### Regras de Negócio Relacionadas

- RN16
- RN17

## Valores pré-definidos para esta entidade

Os registros desta tabela são organizados por domínio (`tipo`), permitindo reutilização dos estados por diferentes entidades do sistema.



#### Tipo: EXEMPLAR

| Status     | Descrição                                         |
| ---------- | --------------------------------------------------- |
| DISPONIVEL | Exemplar disponível para empréstimo.              |
| EMPRESTADO | Exemplar atualmente emprestado.                     |
| RESERVADO  | Exemplar separado para atender uma reserva.         |
| MANUTENCAO | Exemplar indisponível para manutenção ou reparo. |
| EXTRAVIADO | Exemplar perdido ou não localizado.                |
| DESCARTADO | Exemplar removido permanentemente do acervo.        |



#### Tipo: EMPRESTIMO

| Status    | Descrição                                  |
| --------- | -------------------------------------------- |
| ATIVO     | Empréstimo em andamento.                    |
| DEVOLVIDO | Empréstimo encerrado com devolução.       |
| ATRASADO  | Prazo de devolução expirado.               |
| CANCELADO | Empréstimo cancelado antes da efetivação. |



#### Tipo: RESERVA

| Status    | Descrição                                        |
| --------- | -------------------------------------------------- |
| ATIVA     | Reserva aguardando disponibilidade do livro.       |
| ATENDIDA  | Reserva convertida em empréstimo.                 |
| CANCELADA | Reserva cancelada pelo usuário ou bibliotecário. |
| EXPIRADA  | Reserva perdeu a validade por falta de retirada.   |



### Observações

- A combinação `(tipo, status)` identifica unicamente um estado válido do sistema.
- Novos domínios e novos estados poderão ser adicionados futuramente sem necessidade de alteração da estrutura do banco de dados.
- Os valores apresentados representam a carga inicial (seed) prevista para o sistema e poderão ser ampliados conforme evolução das regras de negócio.



---

# Entidade: tb_exemplar

## Descrição

Representa cada unidade física de um livro pertencente ao acervo.

### Atributos

| Campo             | Tipo        | PK | FK | NN | UK |      Default      | Descrição                      |
| ----------------- | ----------- | :-: | :-: | :-: | :-: | :---------------: | -------------------------------- |
| id                | INTEGER     | ✓ |    | ✓ |    |       AUTO       | Identificador do exemplar.       |
| id_status         | INTEGER     |    | ✓ | ✓ |    |                  | Status do exemplar.              |
| id_livro          | INTEGER     |    | ✓ | ✓ |    |                  | Livro ao qual pertence.          |
| codigo_patrimonio | VARCHAR(50) |    |    | ✓ | ✓ |                  | Código patrimonial do exemplar. |
| data_aquisicao    | DATE        |    |    |    |    |                  | Data de aquisição.             |
| observacao        | TEXT        |    |    |    |    |                  | Observações sobre o exemplar.  |
| created_at        | TIMESTAMP   |    |    | ✓ |    | CURRENT_TIMESTAMP | Data de criação.               |
| updated_at        | TIMESTAMP   |    |    | ✓ |    | CURRENT_TIMESTAMP | Data da última atualização.   |

### Restrições

- Código patrimonial deve ser único.
- Todo exemplar pertence a um único livro.
- Todo exemplar deve possuir um status válido.

### Regras de Negócio Relacionadas

- RN02
- RN03
- RN04
- RN16
- RN17

---

# Entidade: tb_perfil

## Descrição

Representa os perfis de acesso dos usuários.

### Atributos

| Campo      | Tipo         | PK | FK | NN | UK |      Default      | Descrição                    |
| ---------- | ------------ | :-: | :-: | :-: | :-: | :---------------: | ------------------------------ |
| id         | INTEGER      | ✓ |    | ✓ |    |       AUTO       | Identificador do perfil.       |
| nome       | VARCHAR(50)  |    |    | ✓ | ✓ |                  | Nome do perfil.                |
| descricao  | VARCHAR(255) |    |    |    |    |                  | Descrição do perfil.         |
| created_at | TIMESTAMP    |    |    | ✓ |    | CURRENT_TIMESTAMP | Data de criação.             |
| updated_at | TIMESTAMP    |    |    | ✓ |    | CURRENT_TIMESTAMP | Data da última atualização. |

### Restrições

- O nome do perfil deve ser único.

### Regras de Negócio Relacionadas

- RN15
- RN17

---

# Entidade: tb_usuario

## Descrição

Representa todos os usuários cadastrados no sistema.

### Atributos

| Campo      | Tipo         | PK | FK | NN | UK |      Default      | Descrição                       |
| ---------- | ------------ | :-: | :-: | :-: | :-: | :---------------: | --------------------------------- |
| id         | INTEGER      | ✓ |    | ✓ |    |       AUTO       | Identificador do usuário.        |
| id_perfil  | INTEGER      |    | ✓ | ✓ |    |                  | Perfil de acesso.                 |
| nome       | VARCHAR(150) |    |    | ✓ |    |                  | Nome completo.                    |
| matricula  | VARCHAR(30)  |    |    | ✓ | ✓ |                  | Matrícula institucional.         |
| email      | VARCHAR(150) |    |    | ✓ | ✓ |                  | E-mail do usuário.               |
| telefone   | VARCHAR(20)  |    |    |    |    |                  | 01 Telefone para contato.        |
| ativo      | BOOLEAN      |    |    | ✓ |    |       TRUE       | Indica se o usuário está ativo. |
| created_at | TIMESTAMP    |    |    | ✓ |    | CURRENT_TIMESTAMP | Data de criação.                |
| updated_at | TIMESTAMP    |    |    | ✓ |    | CURRENT_TIMESTAMP | Data da última atualização.    |

### Restrições

- Matrícula deve ser única.
- Todo usuário deve possuir exatamente um perfil.

### Regras de Negócio Relacionadas

- RN01
- RN11
- RN12
- RN14
- RN15
- RN17

---

# Entidade: tb_reserva

## Descrição

Representa as reservas realizadas para livros indisponíveis.

### Atributos

| Campo             | Tipo      | PK | FK | NN | UK |      Default      | Descrição                      |
| ----------------- | --------- | :-: | :-: | :-: | :-: | :---------------: | -------------------------------- |
| id                | INTEGER   | ✓ |    | ✓ |    |       AUTO       | Identificador da reserva.        |
| id_livro          | INTEGER   |    | ✓ | ✓ |    |                  | Livro reservado.                 |
| id_status         | INTEGER   |    | ✓ | ✓ |    |                  | Status da reserva.               |
| id_usuario        | INTEGER   |    | ✓ | ✓ |    |                  | Usuário que realizou a reserva. |
| data_reserva      | DATE      |    |    | ✓ |    |                  | Data da reserva.                 |
| data_cancelamento | DATE      |    |    |    |    |                  | Data de cancelamento.            |
| created_at        | TIMESTAMP |    |    | ✓ |    | CURRENT_TIMESTAMP | Data de criação.               |
| updated_at        | TIMESTAMP |    |    | ✓ |    | CURRENT_TIMESTAMP | Data da última atualização.   |

### Restrições

- Toda reserva deve estar associada a um livro.
- Toda reserva deve possuir um usuário.
- Toda reserva deve possuir um status válido.

### Regras de Negócio Relacionadas

- RN12
- RN16
- RN17

---

# Entidade: tb_emprestimo

## Descrição

Representa os empréstimos realizados na biblioteca.

### Atributos

| Campo                   | Tipo      | PK | FK | NN | UK |      Default      | Descrição                                           |
| ----------------------- | --------- | :-: | :-: | :-: | :-: | :---------------: | ----------------------------------------------------- |
| id                      | INTEGER   | ✓ |    | ✓ |    |       AUTO       | Identificador do empréstimo.                         |
| id_exemplar             | INTEGER   |    | ✓ | ✓ |    |                  | Exemplar emprestado.                                  |
| id_usuario_responsavel  | INTEGER   |    | ✓ | ✓ |    |                  | Usuário (aluno) responsável pelo empréstimo.       |
| id_usuario_registro     | INTEGER   |    | ✓ | ✓ |    |                  | Usuário (bibliotecário) que registrou a operação. |
| id_status               | INTEGER   |    | ✓ | ✓ |    |                  | Status do empréstimo.                                |
| data_emprestimo         | DATE      |    |    | ✓ |    |                  | Data do empréstimo.                                  |
| data_prevista_devolucao | DATE      |    |    | ✓ |    |                  | Data prevista para devolução.                       |
| data_devolucao          | DATE      |    |    |    |    |                  | Data efetiva da devolução.                          |
| created_at              | TIMESTAMP |    |    | ✓ |    | CURRENT_TIMESTAMP | Data de criação.                                    |
| updated_at              | TIMESTAMP |    |    | ✓ |    | CURRENT_TIMESTAMP | Data da última atualização.                        |

### Restrições

- Todo empréstimo deve possuir um exemplar.
- Todo empréstimo deve possuir um aluno responsável.
- Todo empréstimo deve possuir um bibliotecário responsável pelo registro.
- Todo empréstimo deve possuir um status válido.

### Regras de Negócio Relacionadas

- RN01
- RN02
- RN11
- RN13
- RN14
- RN16
- RN17
