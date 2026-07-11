# Validação do Modelo de Dados

## Objetivo

Este documento descreve as operações e consultas que deverão ser suportadas pelo modelo de dados do Sistema de Biblioteca Escolar.

Seu objetivo é validar se o modelo conceitual e o modelo lógico são capazes de atender às necessidades do sistema antes da implementação física do banco de dados.

As operações representam funcionalidades que modificam os dados (INSERT, UPDATE e DELETE lógico, quando aplicável), enquanto as consultas representam perguntas que deverão ser respondidas pelo banco de dados através de consultas SQL.

---

# Operações do Sistema

## Objetivo

Validar se o modelo de dados suporta todas as operações previstas para o sistema.

| Código | Operação                    | Objetivo                                                        | Entidades Envolvidas           |
| :-----: | ----------------------------- | --------------------------------------------------------------- | ------------------------------ |
|  OP001  | Cadastrar categoria           | Registrar uma nova categoria de livros.                         | Categoria                      |
|  OP002  | Alterar categoria             | Atualizar os dados de uma categoria existente.                  | Categoria                      |
|  OP003  | Cadastrar editora             | Registrar uma nova editora.                                     | Editora                        |
|  OP004  | Alterar editora               | Atualizar os dados de uma editora.                              | Editora                        |
|  OP005  | Cadastrar autor               | Registrar um novo autor.                                        | Autor                          |
|  OP006  | Alterar autor                 | Atualizar os dados de um autor.                                 | Autor                          |
|  OP007  | Cadastrar livro               | Registrar um novo livro no acervo.                              | Livro                          |
|  OP008  | Alterar livro                 | Atualizar os dados de um livro.                                 | Livro                          |
|  OP009  | Associar autor ao livro       | Relacionar um ou mais autores a um livro.                       | Livro, LivroAutor, Autor       |
|  OP010  | Remover autor do livro        | Remover a associação entre livro e autor.                     | LivroAutor                     |
|  OP011  | Cadastrar exemplar            | Registrar um novo exemplar físico de um livro.                 | Exemplar                       |
|  OP012  | Alterar exemplar              | Atualizar os dados de um exemplar.                              | Exemplar                       |
|  OP013  | Alterar status do exemplar    | Atualizar o status de um exemplar.                              | Exemplar, Status               |
|  OP014  | Cadastrar perfil              | Registrar um novo perfil de usuário.                           | Perfil                         |
|  OP015  | Alterar perfil                | Atualizar um perfil existente.                                  | Perfil                         |
|  OP016  | Cadastrar usuário            | Registrar um novo usuário.                                     | Usuário                       |
|  OP017  | Alterar usuário              | Atualizar os dados de um usuário.                              | Usuário                       |
|  OP018  | Alterar perfil do usuário    | Alterar o perfil associado ao usuário.                         | Usuário, Perfil               |
|  OP019  | Ativar usuário               | Permitir novamente a utilização do sistema pelo usuário.     | Usuário                       |
|  OP020  | Inativar usuário             | Impedir novas operações realizadas pelo usuário.             | Usuário                       |
|  OP021  | Registrar empréstimo         | Registrar o empréstimo de um exemplar.                         | Empréstimo, Exemplar          |
|  OP022  | Registrar devolução         | Registrar a devolução de um exemplar.                         | Empréstimo, Exemplar          |
|  OP023  | Renovar empréstimo           | Atualizar a data prevista para devolução.                     | Empréstimo                    |
|  OP024  | Registrar reserva             | Registrar uma reserva para um livro indisponível.              | Reserva                        |
|  OP025  | Atender reserva               | Registrar o atendimento de uma reserva, gerando um empréstimo. | Reserva, Empréstimo, Exemplar |
|  OP026  | Cancelar reserva              | Cancelar uma reserva ativa.                                     | Reserva                        |
|  OP027  | Expirar reserva               | Alterar o status de uma reserva para expirada.                  | Reserva                        |
|  OP028  | Alterar status de empréstimo | Atualizar o status de um empréstimo.                           | Empréstimo, Status            |
|  OP029  | Alterar status de reserva     | Atualizar o status de uma reserva.                              | Reserva, Status                |

---

## Consultas Operacionais

Consultas utilizadas durante a operação diária da biblioteca.

| Código | Pergunta                                                | Entidades Envolvidas     |
| :-----: | ------------------------------------------------------- | ------------------------ |
|  Q001  | Quantos livros estão cadastrados?                      | Livro                    |
|  Q002  | Quais livros pertencem a determinada categoria?         | Livro, Categoria         |
|  Q003  | Quais livros foram publicados por determinada editora?  | Livro, Editora           |
|  Q004  | Quais autores escreveram determinado livro?             | Livro, LivroAutor, Autor |
|  Q005  | Quais livros foram escritos por determinado autor?      | Livro, LivroAutor, Autor |
|  Q006  | Quantos exemplares existem para cada livro?             | Livro, Exemplar          |
|  Q007  | Quais exemplares estão disponíveis?                   | Exemplar, Status         |
|  Q008  | Quais exemplares estão emprestados?                    | Exemplar, Status         |
|  Q009  | Quais exemplares estão em manutenção?                | Exemplar, Status         |
|  Q010  | Existem exemplares disponíveis para determinado livro? | Livro, Exemplar          |
|  Q011  | Quais livros estão totalmente indisponíveis?          | Livro, Exemplar, Status  |
|  Q012  | Quantos usuários estão cadastrados?                   | Usuário                 |
|  Q013  | Quais usuários possuem perfil de Aluno?                | Usuário, Perfil         |
|  Q014  | Quais usuários possuem perfil de Bibliotecário?       | Usuário, Perfil         |
|  Q015  | Quais usuários estão inativos?                        | Usuário                 |
|  Q016  | Quais empréstimos estão ativos?                       | Empréstimo, Status      |
|  Q017  | Quais empréstimos estão atrasados?                    | Empréstimo, Status      |
|  Q018  | Quais empréstimos já foram devolvidos?                | Empréstimo, Status      |
|  Q019  | Quais empréstimos pertencem a determinado usuário?    | Empréstimo, Usuário    |
|  Q020  | Qual bibliotecário registrou determinado empréstimo?  | Empréstimo, Usuário    |
|  Q021  | Quais reservas estão ativas?                           | Reserva, Status          |
|  Q022  | Quais reservas foram atendidas?                         | Reserva, Status          |
|  Q023  | Quais reservas foram canceladas?                        | Reserva, Status          |
|  Q024  | Quais reservas expiraram?                               | Reserva, Status          |
|  Q025  | Quais livros possuem reservas ativas?                   | Livro, Reserva           |
|  Q026  | Quais usuários possuem reservas ativas?                | Reserva, Usuário        |

---

## Consultas Históricas

Consultas destinadas à recuperação do histórico de utilização da biblioteca.

| Código | Pergunta                                                   | Entidades Envolvidas         |
| :-----: | ---------------------------------------------------------- | ---------------------------- |
|  H001  | Qual é o histórico de empréstimos de um usuário?       | Empréstimo, Usuário        |
|  H002  | Qual é o histórico de um exemplar?                       | Empréstimo, Exemplar        |
|  H003  | Qual é o histórico de um livro?                          | Livro, Exemplar, Empréstimo |
|  H004  | Quais empréstimos ocorreram em determinado período?      | Empréstimo                  |
|  H005  | Quais reservas foram atendidas em determinado período?    | Reserva                      |
|  H006  | Quais livros foram cadastrados em determinado período?    | Livro                        |
|  H007  | Quais usuários foram cadastrados em determinado período? | Usuário                     |

---

## Consultas Gerenciais

Consultas destinadas à geração de relatórios, indicadores e apoio à tomada de decisão.

| Código | Pergunta                                                    | Entidades Envolvidas                  |
| :-----: | ----------------------------------------------------------- | ------------------------------------- |
|  G001  | Qual livro foi emprestado mais vezes?                       | Livro, Exemplar, Empréstimo          |
|  G002  | Qual categoria possui maior circulação?                   | Categoria, Livro, Empréstimo         |
|  G003  | Qual autor possui maior circulação?                       | Autor, LivroAutor, Livro, Empréstimo |
|  G004  | Qual editora possui maior circulação?                     | Editora, Livro, Empréstimo           |
|  G005  | Qual usuário realizou mais empréstimos?                   | Usuário, Empréstimo                 |
|  G006  | Qual bibliotecário registrou mais empréstimos?            | Usuário, Empréstimo                 |
|  G007  | Qual livro possui maior quantidade de reservas?             | Livro, Reserva                        |
|  G008  | Quantas reservas foram atendidas?                           | Reserva                               |
|  G009  | Quantas reservas expiraram?                                 | Reserva                               |
|  G010  | Qual é a taxa de atendimento das reservas?                 | Reserva                               |
|  G011  | Qual é a taxa de cancelamento das reservas?                | Reserva                               |
|  G012  | Qual é o tempo médio entre reserva e atendimento?         | Reserva                               |
|  G013  | Qual é o tempo médio dos empréstimos?                    | Empréstimo                           |
|  G014  | Qual categoria possui maior quantidade de exemplares?       | Categoria, Livro, Exemplar            |
|  G015  | Qual editora possui maior quantidade de livros cadastrados? | Editora, Livro                        |
|  G016  | Qual autor possui maior quantidade de obras cadastradas?    | Autor, LivroAutor                     |


---



# Resultado Esperado

Ao final da implementação física do banco de dados, todas as operações descritas neste documento deverão ser suportadas pelo modelo de dados e todas as consultas deverão ser respondidas por meio de instruções SQL.

Este documento servirá como critério de validação da modelagem e como guia para a implementação das operações e consultas do sistema.
