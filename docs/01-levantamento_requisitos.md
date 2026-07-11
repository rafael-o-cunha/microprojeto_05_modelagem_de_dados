# Microprojeto 05 — Sistema de Biblioteca Escolar

## Documento de Levantamento de Requisitos

### Objetivo

Desenvolver um sistema para informatizar o gerenciamento da biblioteca de uma escola, substituindo controles realizados por meio de fichas e planilhas por um banco de dados estruturado.

O sistema deverá permitir controlar o acervo de livros, seus exemplares, os empréstimos realizados pelos alunos, devoluções, reservas e consultas ao acervo, fornecendo informações confiáveis para o bibliotecário e para a administração da escola.

---

# Stakeholders

## Diretor da Escola

Responsável por acompanhar o funcionamento da biblioteca e obter informações gerenciais sobre o acervo e sua utilização.

## Bibliotecário

Responsável pela operação diária do sistema, realizando cadastros, empréstimos, devoluções, reservas e consultas.

## Aluno

Usuário autorizado a consultar o acervo e realizar empréstimos e reservas de livros.

---

# Problemas Atuais

Atualmente a biblioteca realiza seus controles utilizando fichas em papel e planilhas eletrônicas, ocasionando diversos problemas, tais como:

* dificuldade para localizar livros disponíveis;
* controle manual dos empréstimos;
* dificuldade para identificar livros em atraso;
* ausência de histórico organizado dos empréstimos;
* dificuldade para controlar a quantidade de exemplares disponíveis;
* demora na realização de consultas sobre o acervo;
* possibilidade de perda ou inconsistência das informações;
* dificuldade para gerar relatórios de utilização da biblioteca.

---

# Funcionalidades Identificadas

O sistema deverá permitir:

* cadastrar livros;
* cadastrar autores;
* cadastrar editoras;
* cadastrar categorias de livros;
* cadastrar exemplares físicos;
* cadastrar alunos;
* cadastrar bibliotecários;
* registrar empréstimos;
* registrar devoluções;
* registrar reservas;
* bloquear empréstimos para alunos com devoluções em atraso;
* consultar disponibilidade de exemplares;
* consultar histórico de empréstimos;
* consultar livros por título;
* consultar livros por autor;
* consultar livros por categoria;
* consultar livros por editora;
* consultar livros disponíveis para empréstimo;
* consultar livros emprestados;
* consultar alunos com empréstimos em atraso;
* emitir informações estatísticas sobre utilização do acervo.

---

# Requisitos Funcionais

### RF01 — Cadastro de Livros

O sistema deverá permitir cadastrar livros contendo suas informações bibliográficas.

### RF02 — Cadastro de Autores

O sistema deverá permitir cadastrar autores e associá-los aos respectivos livros.

### RF03 — Cadastro de Editoras

O sistema deverá permitir cadastrar editoras responsáveis pelas publicações.

### RF04 — Cadastro de Categorias

O sistema deverá permitir organizar os livros em categorias.

### RF05 — Cadastro de Exemplares

O sistema deverá permitir cadastrar cada exemplar físico pertencente ao acervo.

Cada exemplar deverá possuir identificação própria.

### RF06 — Cadastro de Alunos

O sistema deverá permitir cadastrar alunos autorizados a realizar empréstimos.

### RF07 — Cadastro de Bibliotecários

O sistema deverá permitir cadastrar os funcionários responsáveis pela administração da biblioteca.

### RF08 — Registro de Empréstimos

O sistema deverá registrar os empréstimos de exemplares para alunos.

### RF09 — Registro de Devoluções

O sistema deverá registrar a devolução dos exemplares emprestados.

### RF10 — Controle de Disponibilidade

O sistema não deverá permitir que um mesmo exemplar seja emprestado simultaneamente para mais de um aluno.

### RF11 — Controle de Atrasos

O sistema deverá identificar automaticamente empréstimos com prazo de devolução expirado.

### RF12 — Bloqueio de Empréstimos

Alunos que possuírem empréstimos em atraso não poderão realizar novos empréstimos até a regularização da situação.

### RF13 — Reserva de Livros

O sistema deverá permitir que um aluno reserve um livro quando não houver exemplares disponíveis.

### RF14 — Histórico de Empréstimos

O sistema deverá manter o histórico completo dos empréstimos realizados.

### RF15 — Consulta ao Acervo

O sistema deverá permitir pesquisar livros por diferentes critérios, como:

* título;
* autor;
* categoria;
* editora;
* disponibilidade.

### RF16 — Relatórios

O sistema deverá disponibilizar informações como:

* livros mais emprestados;
* quantidade de exemplares disponíveis;
* quantidade de empréstimos ativos;
* alunos com empréstimos em atraso;
* quantidade de livros por categoria.

---


# Requisitos Não Funcionais

### RNF01

O banco de dados deverá ser implementado utilizando PostgreSQL.

### RNF02

O modelo deverá ser desenvolvido seguindo o processo de normalização até, no mínimo, a Terceira Forma Normal (3FN).

### RNF03

Os scripts SQL deverão utilizar preferencialmente a sintaxe ANSI SQL, realizando adaptações específicas apenas quando necessárias para o PostgreSQL.

### RNF04

Todas as tabelas deverão possuir chave primária.

### RNF05

Os relacionamentos deverão ser implementados por meio de chaves estrangeiras, garantindo integridade referencial.

### RNF06

Os campos obrigatórios deverão utilizar restrições `NOT NULL`.

### RNF07

O modelo deverá minimizar redundâncias de dados por meio da normalização.

### RNF08

O projeto deverá conter diagrama entidade-relacionamento, dicionário de dados, scripts SQL e Scripts de teste que fazem "perguntas ao modelo".

### RNF09

Os nomes das tabelas, colunas, restrições e demais objetos do banco deverão seguir um padrão de nomenclatura consistente.

### RNF10

O modelo deverá permitir futura expansão para inclusão de novos tipos de usuários ou funcionalidades sem necessidade de grandes alterações estruturais.
