# Microprojeto 05 — Sistema de Biblioteca Escolar

# Documento de Regras de Negócio

## Objetivo

Este documento descreve as regras de negócio identificadas durante o levantamento de requisitos do Sistema de Biblioteca Escolar. Essas regras representam restrições e comportamentos que deverão ser refletidos no modelo de dados e posteriormente implementados pela aplicação.

---

# Resumo das Regras de Negócio

| Código      | Regra                                                                                     |
| ------------ | ----------------------------------------------------------------------------------------- |
| RN01         | Apenas alunos podem realizar empréstimos.                                                |
| RN02         | Um exemplar pode possuir apenas um empréstimo ativo por vez.                             |
| RN03         | Um livro pode possuir vários exemplares.                                                 |
| RN04         | Um exemplar pertence a um único livro.                                                   |
| RN05         | Um livro pode possuir um ou mais autores.                                                 |
| RN06         | Um autor pode escrever um ou mais livros.                                                 |
| RN07         | Um livro pertence a apenas uma categoria.                                                 |
| RN08         | Uma categoria pode conter vários livros.                                                 |
| RN09         | Um livro pertence a apenas uma editora.                                                   |
| RN10         | Uma editora pode publicar vários livros.                                                 |
| RN11         | Alunos com empréstimos em atraso não podem realizar novos empréstimos.                 |
| RN12         | Livros indisponíveis podem ser reservados.                                               |
| RN13         | O histórico de empréstimos deve ser preservado.                                         |
| ==RN14== | Todo empréstimo e devolução deverá ser registrado por um bibliotecário responsável. |
| ==RN15== | Todo usuário deverá possuir exatamente um perfil de acesso.                             |

---

# Regras de Negócio

## RN01 — Apenas alunos podem realizar empréstimos

Somente usuários cadastrados como alunos poderão realizar empréstimos de livros.

**Objetivo**

Garantir que apenas estudantes utilizem o serviço de empréstimo da biblioteca.

**Entidades impactadas**

* Aluno
* Empréstimo

---

## RN02 — Um exemplar pode estar emprestado para apenas um aluno por vez

Cada exemplar poderá possuir apenas um empréstimo ativo simultaneamente.

Após sua devolução, o exemplar poderá ser emprestado novamente.

**Objetivo**

Evitar empréstimos simultâneos do mesmo exemplar.

**Entidades impactadas**

* Exemplar
* Empréstimo

---

## RN03 — Um livro pode possuir vários exemplares

Um livro poderá possuir uma ou mais cópias físicas disponíveis na biblioteca.

Cada exemplar representa uma unidade física independente.

**Objetivo**

Permitir controlar individualmente cada cópia disponível.

**Entidades impactadas**

* Livro
* Exemplar

---

## RN04 — Um exemplar pertence a um único livro

Cada exemplar deverá estar associado exclusivamente a um único livro.

Um exemplar não poderá representar mais de um livro.

**Objetivo**

Garantir a integridade do acervo.

**Entidades impactadas**

* Livro
* Exemplar

---

## RN05 — Um livro pode possuir um ou mais autores

Um livro poderá ser escrito por um ou vários autores.

**Objetivo**

Representar corretamente obras com autoria múltipla.

**Entidades impactadas**

* Livro
* Autor

---

## RN06 — Um autor pode escrever um ou mais livros

Um autor poderá estar associado à autoria de diversos livros cadastrados.

**Objetivo**

Evitar redundância de informações dos autores.

**Entidades impactadas**

* Autor
* Livro

---

## RN07 — Um livro pertence a apenas uma categoria

Cada livro deverá ser classificado em apenas uma categoria.

**Objetivo**

Facilitar a organização e consulta do acervo.

**Entidades impactadas**

* Livro
* Categoria

---

## RN08 — Uma categoria pode conter vários livros

Uma categoria poderá agrupar diversos livros.

**Objetivo**

Permitir organização temática do acervo.

**Entidades impactadas**

* Categoria
* Livro

---

## RN09 — Um livro pertence a apenas uma editora

Cada livro deverá estar associado a uma única editora.

**Objetivo**

Manter a origem editorial da publicação.

**Entidades impactadas**

* Livro
* Editora

---

## RN10 — Uma editora pode publicar vários livros

Uma editora poderá publicar diversos livros cadastrados.

**Objetivo**

Evitar duplicidade de informações sobre editoras.

**Entidades impactadas**

* Editora
* Livro

---

## RN11 — Alunos com empréstimos em atraso não poderão realizar novos empréstimos

Caso o aluno possua pelo menos um empréstimo em atraso, novos empréstimos deverão ser bloqueados até a regularização da situação.

**Objetivo**

Incentivar a devolução dentro do prazo estabelecido.

**Entidades impactadas**

* Aluno
* Empréstimo

---

## RN12 — Livros indisponíveis poderão ser reservados

Quando todos os exemplares de um livro estiverem emprestados, o aluno poderá registrar uma reserva e as reservas são realizadas para livros e não para exemplares.

A reserva permanecerá ativa até que um exemplar esteja disponível ou seja cancelada pois quando houver exemplar disponível, a reserva poderá ser atendida por qualquer exemplar pertencente ao livro reservado.

**Objetivo**

Organizar a fila de espera para livros indisponíveis.

**Entidades impactadas**

* Reserva
* Livro
* Aluno

---

## RN13 — O histórico de empréstimos deverá ser preservado

Registros de empréstimos concluídos não poderão ser excluídos do banco de dados.

Esses registros deverão permanecer disponíveis para consultas históricas e emissão de relatórios.

**Objetivo**

Preservar o histórico de utilização da biblioteca.

**Entidades impactadas**

* Empréstimo

---

## RN14 — Todo empréstimo e devolução deverá ser registrado por um bibliotecário responsável

Toda operação de empréstimo ou devolução deverá ser registrada por um usuário com perfil de Bibliotecário.

Essa informação deverá ser preservada para fins de auditoria e rastreabilidade.

**Objetivo**

Permitir identificar qual bibliotecário realizou cada operação na biblioteca.

**Entidades impactadas**

- Usuário
- Perfil
- Empréstimo

---

## RN15 — Todo usuário deverá possuir exatamente um perfil de acesso

Todo usuário cadastrado no sistema deverá possuir exatamente um perfil de acesso.

O perfil definirá o papel desempenhado pelo usuário dentro do sistema.

Os perfis inicialmente previstos são:

- Aluno
- Bibliotecário

Novos perfis poderão ser adicionados futuramente sem necessidade de alteração da estrutura do banco de dados.

**Objetivo**

Centralizar o gerenciamento dos tipos de usuários e facilitar a evolução do sistema.

**Entidades impactadas**

- Usuário
- Perfil

---
