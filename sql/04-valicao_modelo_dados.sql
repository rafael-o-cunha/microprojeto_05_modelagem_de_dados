/*
# Validação do Modelo de Dados

## Objetivo

Executar as operações e perguntas especificadas no arquivo 04-validacao_modelo_dados.md utilizando SQL.

*/

-- ============================================================================
-- Operações
-- ============================================================================

-- |  OP001  | Cadastrar categoria           | Registrar uma nova categoria de livros.                         | Categoria                      |
    INSERT INTO biblioteca.tb_categoria
    (
        nome,
        descricao
    )
    VALUES
    (
        'Computação em Nuvem',
        'Livros relacionados à computação em nuvem.'
    );

    SELECT
        id,
        nome,
        descricao,
        created_at,
        updated_at
    FROM biblioteca.tb_categoria
    WHERE nome = 'Computação em Nuvem';



-- |  OP002  | Alterar categoria             | Atualizar os dados de uma categoria existente.                  | Categoria                      |
    UPDATE biblioteca.tb_categoria
    SET
        nome = 'Cloud Computing',
        descricao = 'Livros sobre serviços, arquitetura e plataformas de computação em nuvem.'
        , updated_at = CURRENT_TIMESTAMP
    WHERE nome = 'Computação em Nuvem';

    SELECT
        id,
        nome,
        descricao,
        created_at,
        updated_at
    FROM biblioteca.tb_categoria
    WHERE nome = 'Cloud Computing';



-- |  OP003  | Cadastrar editora             | Registrar uma nova editora.                                     | Editora                        |
    INSERT INTO biblioteca.tb_editora
    (
        nome,
        site
    )
    VALUES
    (
        'Packt Publishing',
        'https://www.packtpub.com'
    );

    SELECT *
    FROM biblioteca.tb_editora
    WHERE nome = 'Packt Publishing';



-- |  OP004  | Alterar editora               | Atualizar os dados de uma editora.                              | Editora                        |
    UPDATE biblioteca.tb_editora
    SET
        nome = 'Packt',
        site = 'https://packtpub.com'
        , updated_at = CURRENT_TIMESTAMP
    WHERE nome = 'Packt Publishing';

    SELECT *
    FROM biblioteca.tb_editora
    WHERE nome = 'Packt';



-- |  OP005  | Cadastrar autor               | Registrar um novo autor.                                        | Autor                          |
    INSERT INTO biblioteca.tb_autor
    (
        nome,
        data_nascimento
    )
    VALUES
    (
        'Linus Torvalds',
        '1969-12-28'
    );

    SELECT *
    FROM biblioteca.tb_autor
    WHERE nome = 'Linus Torvalds';



-- |  OP006  | Alterar autor                 | Atualizar os dados de um autor.                                 | Autor                          |
    UPDATE biblioteca.tb_autor
    SET
        nome = 'Linus Benedict Torvalds'
        , updated_at = CURRENT_TIMESTAMP
    WHERE nome = 'Linus Torvalds';

    SELECT *
    FROM biblioteca.tb_autor
    WHERE nome = 'Linus Benedict Torvalds';



-- |  OP007  | Cadastrar livro               | Registrar um novo livro no acervo.                              | Livro                          |
    INSERT INTO biblioteca.tb_livro
    (
        id_categoria,
        id_editora,
        isbn,
        titulo,
        sinopse,
        edicao,
        ano_publicacao,
        numero_paginas
    )
    VALUES
    (
        (SELECT id FROM biblioteca.tb_categoria WHERE nome='Programação'),
        (SELECT id FROM biblioteca.tb_editora WHERE nome='Novatec'),
        '9780000000001',
        'Spring Boot na Prática',
        'Livro utilizado para testes.',
        1,
        2026,
        350
    );

    SELECT *
    FROM biblioteca.tb_livro
    WHERE isbn='9780000000001';



-- |  OP008  | Alterar livro                 | Atualizar os dados de um livro.                                 | Livro                          |
    UPDATE biblioteca.tb_livro
    SET
        titulo='Spring Boot na Prática - 2ª edição',
        numero_paginas=380
        , updated_at = CURRENT_TIMESTAMP
    WHERE isbn='9780000000001';

    SELECT *
    FROM biblioteca.tb_livro
    WHERE isbn='9780000000001';



-- |  OP009  | Associar autor ao livro       | Relacionar um ou mais autores a um livro.                       | Livro, LivroAutor, Autor       |
    INSERT INTO biblioteca.tb_livroAutor
    (
        id_livro,
        id_autor,
        ordem_autoria
    )
    VALUES
    (
        (
            SELECT id
            FROM biblioteca.tb_livro
            WHERE isbn = '9780000000001'
        ),
        (
            SELECT id
            FROM biblioteca.tb_autor
            WHERE nome = 'Martin Fowler'
        ),
        2
    );

    SELECT
        l.titulo,
        a.nome,
        la.ordem_autoria
    FROM biblioteca.tb_livroAutor la
    JOIN biblioteca.tb_livro l
        ON l.id = la.id_livro
    JOIN biblioteca.tb_autor a
        ON a.id = la.id_autor
    WHERE l.isbn = '9780000000001'
    ORDER BY la.ordem_autoria;



-- |  OP010  | Remover autor do livro        | Remover a associação entre livro e autor.                       | LivroAutor                     |
    DELETE FROM biblioteca.tb_livroAutor
    WHERE id_livro =
    (
        SELECT id
        FROM biblioteca.tb_livro
        WHERE isbn='9780000000001'
    )
    AND id_autor =
    (
        SELECT id
        FROM biblioteca.tb_autor
        WHERE nome='Martin Fowler'
    );

    SELECT
        l.titulo,
        a.nome,
        la.ordem_autoria
    FROM biblioteca.tb_livroAutor la
    JOIN biblioteca.tb_livro l
        ON l.id = la.id_livro
    JOIN biblioteca.tb_autor a
        ON a.id = la.id_autor
    WHERE l.isbn='9780000000001';



-- |  OP011  | Cadastrar exemplar            | Registrar um novo exemplar físico de um livro.                  | Exemplar                       |
    INSERT INTO biblioteca.tb_exemplar
    (
        id_status,
        id_livro,
        codigo_patrimonio,
        data_aquisicao,
        observacao
    )
    VALUES
    (
        (
            SELECT id
            FROM biblioteca.tb_status
            WHERE tipo='EXEMPLAR'
            AND status='DISPONIVEL'
        ),
        (
            SELECT id
            FROM biblioteca.tb_livro
            WHERE isbn='9780000000001'
        ),
        'PAT999999',
        CURRENT_DATE,
        'Exemplar criado para testes.'
    );

    SELECT *
    FROM biblioteca.tb_exemplar
    WHERE codigo_patrimonio='PAT999999';



-- |  OP012  | Alterar exemplar              | Atualizar os dados de um exemplar.                              | Exemplar                       |
    UPDATE biblioteca.tb_exemplar
    SET
        observacao = 'Exemplar revisado e etiquetado para empréstimo.',
        data_aquisicao = '2025-01-15',
        updated_at = CURRENT_TIMESTAMP
    WHERE codigo_patrimonio = 'PAT999999';

    SELECT
        e.id,
        l.titulo,
        e.codigo_patrimonio,
        e.data_aquisicao,
        e.observacao,
        s.status,
        e.created_at,
        e.updated_at
    FROM biblioteca.tb_exemplar e
    INNER JOIN biblioteca.tb_livro l
        ON l.id = e.id_livro
    INNER JOIN biblioteca.tb_status s
        ON s.id = e.id_status
    WHERE e.codigo_patrimonio = 'PAT999999';



-- |  OP013  | Alterar status do exemplar    | Atualizar o status de um exemplar.                              | Exemplar, Status               |
    UPDATE biblioteca.tb_exemplar
    SET
        id_status =
        (
            SELECT id
            FROM biblioteca.tb_status
            WHERE tipo='EXEMPLAR'
            AND status='MANUTENCAO'
        ),
        updated_at = CURRENT_TIMESTAMP
    WHERE codigo_patrimonio='PAT999999';


    SELECT
        e.codigo_patrimonio,
        s.tipo,
        s.status
    FROM biblioteca.tb_exemplar e
    JOIN biblioteca.tb_status s
        ON s.id = e.id_status
    WHERE e.codigo_patrimonio='PAT999999';



-- |  OP014  | Cadastrar perfil              | Registrar um novo perfil de usuário.                            | Perfil                         |
    INSERT INTO biblioteca.tb_perfil
    (
        nome,
        descricao
    )
    VALUES
    (
        'Professor',
        'Perfil utilizado para professores.'
    );

    SELECT *
    FROM biblioteca.tb_perfil
    WHERE nome='Professor';



-- |  OP015  | Alterar perfil                | Atualizar um perfil existente.                                  | Perfil                         |
    UPDATE biblioteca.tb_perfil
    SET
        descricao='Perfil destinado aos professores da instituição.'
        , updated_at = CURRENT_TIMESTAMP
    WHERE nome='Professor';

    SELECT *
    FROM biblioteca.tb_perfil
    WHERE nome='Professor';



-- |  OP016  | Cadastrar usuário             | Registrar um novo usuário.                                      | Usuário                        |
    INSERT INTO biblioteca.tb_usuario
    (
        id_perfil,
        nome,
        matricula,
        email,
        telefone,
        ativo
    )
    VALUES
    (
        (SELECT id FROM biblioteca.tb_perfil WHERE nome='Aluno'),
        'Pedro Henrique',
        '20249999',
        'pedro@escola.edu.br',
        '(11)99999-9999',
        TRUE
    );

    SELECT *
    FROM biblioteca.tb_usuario
    WHERE matricula='20249999';



-- |  OP017  | Alterar usuário               | Atualizar os dados de um usuário.                               | Usuário                        |
    UPDATE biblioteca.tb_usuario
    SET
        telefone='(11)98888-7777'
        , updated_at = CURRENT_TIMESTAMP
    WHERE matricula='20249999';

    SELECT *
    FROM biblioteca.tb_usuario
    WHERE matricula='20249999';



-- |  OP018  | Alterar perfil do usuário     | Alterar o perfil associado ao usuário.                          | Usuário, Perfil                |
    UPDATE biblioteca.tb_usuario
    SET
        id_perfil =
        (
            SELECT id
            FROM biblioteca.tb_perfil
            WHERE nome='Professor'
        ),
        updated_at = CURRENT_TIMESTAMP
    WHERE matricula='20249999';

    SELECT
        u.nome,
        u.matricula,
        p.nome AS perfil
    FROM biblioteca.tb_usuario u
    JOIN biblioteca.tb_perfil p
        ON p.id = u.id_perfil
    WHERE u.matricula='20249999';



-- |  OP019  | Ativar usuário                | Permitir novamente a utilização do sistema pelo usuário.        | Usuário                        |
    UPDATE biblioteca.tb_usuario
    SET
        ativo = TRUE,
        updated_at = CURRENT_TIMESTAMP
    WHERE matricula='20249999';

    SELECT
        nome,
        matricula,
        ativo
    FROM biblioteca.tb_usuario
    WHERE matricula='20249999';



-- |  OP020  | Inativar usuário              | Impedir novas operações realizadas pelo usuário.                | Usuário                        |
    UPDATE biblioteca.tb_usuario
    SET
        ativo = FALSE,
        updated_at = CURRENT_TIMESTAMP
    WHERE matricula='20249999';

    SELECT
        nome,
        matricula,
        ativo
    FROM biblioteca.tb_usuario
    WHERE matricula='20249999';



-- |  OP021  | Registrar empréstimo          | Registrar o empréstimo de um exemplar.                          | Empréstimo, Exemplar           |
    BEGIN; 
        UPDATE biblioteca.tb_exemplar
        SET
            id_status = (
                SELECT id
                FROM biblioteca.tb_status
                WHERE tipo = 'EXEMPLAR'
                AND status = 'EMPRESTADO'
            ),
            updated_at = CURRENT_TIMESTAMP
        WHERE codigo_patrimonio = 'PAT999999';

        INSERT INTO biblioteca.tb_emprestimo
        (
            id_exemplar,
            id_usuario_responsavel,
            id_usuario_registro,
            id_status,
            data_emprestimo,
            data_prevista_devolucao
        )
        VALUES
        (
            (SELECT id FROM biblioteca.tb_exemplar WHERE codigo_patrimonio='PAT999999'),
            (SELECT id FROM biblioteca.tb_usuario WHERE matricula='20249999'),
            (SELECT id FROM biblioteca.tb_usuario WHERE matricula='BIB001'),
            (SELECT id FROM biblioteca.tb_status WHERE tipo='EMPRESTIMO' AND status='ATIVO'),
            CURRENT_TIMESTAMP,
            CURRENT_TIMESTAMP + INTERVAL '7 day'
        );
    COMMIT;
    
    SELECT
        e.id,
        ex.codigo_patrimonio,
        u.nome AS aluno,
        b.nome AS bibliotecario,
        s.status,
        e.data_emprestimo,
        e.data_prevista_devolucao
    FROM biblioteca.tb_emprestimo e
    JOIN biblioteca.tb_exemplar ex ON ex.id=e.id_exemplar
    JOIN biblioteca.tb_usuario u ON u.id=e.id_usuario_responsavel
    JOIN biblioteca.tb_usuario b ON b.id=e.id_usuario_registro
    JOIN biblioteca.tb_status s ON s.id=e.id_status
    WHERE ex.codigo_patrimonio='PAT999999'
    ORDER BY e.id DESC
    LIMIT 1;



-- |  OP022  | Registrar devolução           | Registrar a devolução de um exemplar.                           | Empréstimo, Exemplar           |
    BEGIN;
        UPDATE biblioteca.tb_emprestimo
        SET
            data_devolucao = CURRENT_TIMESTAMP,
            id_status = (
                SELECT id
                FROM biblioteca.tb_status
                WHERE tipo = 'EMPRESTIMO'
                AND status = 'DEVOLVIDO'
            ),
            updated_at = CURRENT_TIMESTAMP
        WHERE id = 1;

        UPDATE biblioteca.tb_exemplar
        SET
            id_status = (
                SELECT id
                FROM biblioteca.tb_status
                WHERE tipo = 'EXEMPLAR'
                AND status = 'DISPONIVEL'
            ),
            updated_at = CURRENT_TIMESTAMP
        WHERE id =
        (
            SELECT id_exemplar
            FROM biblioteca.tb_emprestimo
            WHERE id = 1
        );
    COMMIT;

    SELECT
        e.id,
        ex.codigo_patrimonio,
        s.status,
        e.data_emprestimo,
        e.data_prevista_devolucao,
        e.data_devolucao
    FROM biblioteca.tb_emprestimo e
    INNER JOIN biblioteca.tb_exemplar ex
        ON ex.id = e.id_exemplar
    INNER JOIN biblioteca.tb_status s
        ON s.id = e.id_status
    WHERE e.id = 1;



-- |  OP023  | Renovar empréstimo            | Atualizar a data prevista para devolução.                       | Empréstimo                     |
    BEGIN;
       
        UPDATE biblioteca.tb_emprestimo
        SET
            data_prevista_devolucao = data_prevista_devolucao + INTERVAL '7 day',
            updated_at = CURRENT_TIMESTAMP
        WHERE id = 1;

    COMMIT;

    SELECT
        e.id,
        ex.codigo_patrimonio,
        u.nome AS aluno,
        s.status,
        e.data_emprestimo,
        e.data_prevista_devolucao,
        e.data_devolucao,
        e.updated_at
    FROM biblioteca.tb_emprestimo e
    INNER JOIN biblioteca.tb_exemplar ex
        ON ex.id = e.id_exemplar
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = e.id_usuario_responsavel
    INNER JOIN biblioteca.tb_status s
        ON s.id = e.id_status
    WHERE e.id = 1;



-- |  OP024  | Registrar reserva             | Registrar uma reserva para um livro indisponível.               | Reserva                        |
    INSERT INTO biblioteca.tb_reserva
    (
        id_livro,
        id_usuario,
        id_status,
        data_reserva
    )
    VALUES
    (
        (
            SELECT id
            FROM biblioteca.tb_livro
            WHERE isbn='9780000000001'
        ),
        (
            SELECT id
            FROM biblioteca.tb_usuario
            WHERE matricula='20249999'
        ),
        (
            SELECT id
            FROM biblioteca.tb_status
            WHERE tipo='RESERVA'
            AND status='ATIVA'
        ),
        CURRENT_TIMESTAMP
    );

    SELECT
        r.id,
        l.titulo,
        u.nome,
        s.status,
        r.data_reserva
    FROM biblioteca.tb_reserva r
    JOIN biblioteca.tb_livro l ON l.id=r.id_livro
    JOIN biblioteca.tb_usuario u ON u.id=r.id_usuario
    JOIN biblioteca.tb_status s ON s.id=r.id_status
    ORDER BY r.id DESC
    LIMIT 1;



-- |  OP025  | Atender reserva               | Registrar o atendimento de uma reserva, gerando um empréstimo.  | Reserva, Empréstimo, Exemplar  |
    BEGIN;

        UPDATE biblioteca.tb_reserva
        SET
            id_status = (
                SELECT id
                FROM biblioteca.tb_status
                WHERE tipo = 'RESERVA'
                AND status = 'ATENDIDA'
            ),
            data_atendimento = CURRENT_TIMESTAMP,
            updated_at = CURRENT_TIMESTAMP
        WHERE id = 1;

        UPDATE biblioteca.tb_exemplar
        SET
            id_status = (
                SELECT id
                FROM biblioteca.tb_status
                WHERE tipo = 'EXEMPLAR'
                AND status = 'EMPRESTADO'
            ),
            updated_at = CURRENT_TIMESTAMP
        WHERE codigo_patrimonio = 'PAT999999';

        INSERT INTO biblioteca.tb_emprestimo
        (
            id_exemplar,
            id_usuario_responsavel,
            id_usuario_registro,
            id_status,
            data_emprestimo,
            data_prevista_devolucao
        )
        VALUES
        (
            (
                SELECT id
                FROM biblioteca.tb_exemplar
                WHERE codigo_patrimonio = 'PAT999999'
            ),
            (
                SELECT id_usuario
                FROM biblioteca.tb_reserva
                WHERE id = 1
            ),
            (
                SELECT id
                FROM biblioteca.tb_usuario
                WHERE matricula = 'BIB001'
            ),
            (
                SELECT id
                FROM biblioteca.tb_status
                WHERE tipo = 'EMPRESTIMO'
                AND status = 'ATIVO'
            ),
            CURRENT_TIMESTAMP,
            CURRENT_TIMESTAMP + INTERVAL '7 day'
        );

    COMMIT;

    SELECT
        r.id,
        l.titulo,
        u.nome AS usuario,
        s.status,
        r.data_reserva,
        r.data_atendimento
    FROM biblioteca.tb_reserva r
    INNER JOIN biblioteca.tb_livro l
        ON l.id = r.id_livro
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = r.id_usuario
    INNER JOIN biblioteca.tb_status s
        ON s.id = r.id_status
    WHERE r.id = 1;

    SELECT
        emp.id,
        ex.codigo_patrimonio,
        aluno.nome AS aluno,
        bib.nome AS bibliotecario,
        st.status,
        emp.data_emprestimo,
        emp.data_prevista_devolucao
    FROM biblioteca.tb_emprestimo emp
    INNER JOIN biblioteca.tb_exemplar ex
        ON ex.id = emp.id_exemplar
    INNER JOIN biblioteca.tb_usuario aluno
        ON aluno.id = emp.id_usuario_responsavel
    INNER JOIN biblioteca.tb_usuario bib
        ON bib.id = emp.id_usuario_registro
    INNER JOIN biblioteca.tb_status st
        ON st.id = emp.id_status
    WHERE emp.id_exemplar =
    (
        SELECT id
        FROM biblioteca.tb_exemplar
        WHERE codigo_patrimonio = 'PAT999999'
    )
    AND emp.id_usuario_responsavel =
    (
        SELECT id_usuario
        FROM biblioteca.tb_reserva
        WHERE id = 1
    )
    ORDER BY emp.data_emprestimo DESC
    LIMIT 1;



-- |  OP026  | Cancelar reserva              | Cancelar uma reserva ativa.                                     | Reserva                        |
    BEGIN;

        UPDATE biblioteca.tb_reserva
        SET
            id_status = (
                SELECT id
                FROM biblioteca.tb_status
                WHERE tipo = 'RESERVA'
                AND status = 'CANCELADA'
            ),
            data_cancelamento = CURRENT_TIMESTAMP,
            updated_at = CURRENT_TIMESTAMP
        WHERE id = 1;

    COMMIT;

    SELECT
        r.id,
        l.titulo,
        u.nome AS usuario,
        s.status,
        r.data_reserva,
        r.data_atendimento,
        r.data_cancelamento,
        r.data_expiracao,
        r.created_at,
        r.updated_at
    FROM biblioteca.tb_reserva r
    INNER JOIN biblioteca.tb_livro l
        ON l.id = r.id_livro
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = r.id_usuario
    INNER JOIN biblioteca.tb_status s
        ON s.id = r.id_status
    WHERE r.id = 1;



-- |  OP027  | Expirar reserva               | Alterar o status de uma reserva para expirada.                  | Reserva                        |
    BEGIN;
        UPDATE biblioteca.tb_reserva
        SET
            id_status = (
                SELECT id
                FROM biblioteca.tb_status
                WHERE tipo = 'RESERVA'
                AND status = 'EXPIRADA'
            ),
            data_expiracao = CURRENT_TIMESTAMP,
            updated_at = CURRENT_TIMESTAMP
        WHERE id = 1;

    COMMIT;

    SELECT
        r.id,
        l.titulo,
        u.nome AS usuario,
        s.status,
        r.data_reserva,
        r.data_atendimento,
        r.data_cancelamento,
        r.data_expiracao,
        r.created_at,
        r.updated_at
    FROM biblioteca.tb_reserva r
    INNER JOIN biblioteca.tb_livro l
        ON l.id = r.id_livro
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = r.id_usuario
    INNER JOIN biblioteca.tb_status s
        ON s.id = r.id_status
    WHERE r.id = 1;



-- |  OP028  | Alterar status de empréstimo  | Atualizar o status de um empréstimo.                            | Empréstimo, Status             |
    BEGIN;
		UPDATE biblioteca.tb_emprestimo
		SET
		    id_status = (
		        SELECT id
		        FROM biblioteca.tb_status
		        WHERE tipo = 'EMPRESTIMO'
		          AND status = 'CANCELADO'
		    ),
		    updated_at = CURRENT_TIMESTAMP
		WHERE id = 1;

    COMMIT;

    SELECT
        emp.id,
        ex.codigo_patrimonio,
        aluno.nome AS aluno,
        bib.nome AS bibliotecario,
        st.status,
        emp.data_emprestimo,
        emp.data_prevista_devolucao,
        emp.data_devolucao,
        emp.created_at,
        emp.updated_at
    FROM biblioteca.tb_emprestimo emp
    INNER JOIN biblioteca.tb_exemplar ex
        ON ex.id = emp.id_exemplar
    INNER JOIN biblioteca.tb_usuario aluno
        ON aluno.id = emp.id_usuario_responsavel
    INNER JOIN biblioteca.tb_usuario bib
        ON bib.id = emp.id_usuario_registro
    INNER JOIN biblioteca.tb_status st
        ON st.id = emp.id_status
    WHERE emp.id = 1;



-- |  OP029  | Alterar status de reserva     | Atualizar o status de uma reserva.                              | Reserva, Status                |
    BEGIN;

        UPDATE biblioteca.tb_reserva
        SET
            id_status = (
                SELECT id
                FROM biblioteca.tb_status
                WHERE tipo = 'RESERVA'
                AND status = 'CANCELADA'
            ),
            updated_at = CURRENT_TIMESTAMP
        WHERE id = 1;

    COMMIT;

    SELECT
        r.id,
        l.titulo,
        u.nome AS usuario,
        st.status,
        r.data_reserva,
        r.data_atendimento,
        r.data_expiracao,
        r.data_cancelamento,
        r.created_at,
        r.updated_at
    FROM biblioteca.tb_reserva r
    INNER JOIN biblioteca.tb_livro l
        ON l.id = r.id_livro
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = r.id_usuario
    INNER JOIN biblioteca.tb_status st
        ON st.id = r.id_status
    WHERE r.id = 1;






-- ============================================================================
-- Perguntas
-- ============================================================================

-- |  Q001  | Quantos livros estão cadastrados?                       | Livro                    |
    SELECT
        COUNT(*) AS quantidade_livros
    FROM biblioteca.tb_livro;



-- |  Q002  | Quais livros pertencem a determinada categoria?         | Livro, Categoria         |
    SELECT
        l.id,
        l.isbn,
        l.titulo,
        c.nome AS categoria
    FROM biblioteca.tb_livro l
    INNER JOIN biblioteca.tb_categoria c
        ON c.id = l.id_categoria
    WHERE c.nome = 'Programação'
    ORDER BY l.titulo;



-- |  Q003  | Quais livros foram publicados por determinada editora?  | Livro, Editora           |
    SELECT
        l.id,
        l.isbn,
        l.titulo,
        e.nome AS editora
    FROM biblioteca.tb_livro l
    INNER JOIN biblioteca.tb_editora e
        ON e.id = l.id_editora
    WHERE e.nome = 'Novatec'
    ORDER BY l.titulo;



-- |  Q004  | Quais autores escreveram determinado livro?             | Livro, LivroAutor, Autor |
    SELECT
        l.titulo,
        a.nome AS autor,
        la.ordem_autoria
    FROM biblioteca.tb_livro l
    INNER JOIN biblioteca.tb_livroautor la
        ON la.id_livro = l.id
    INNER JOIN biblioteca.tb_autor a
        ON a.id = la.id_autor
    WHERE l.isbn = '9780000000001'
    ORDER BY la.ordem_autoria;



-- |  Q005  | Quais livros foram escritos por determinado autor?      | Livro, LivroAutor, Autor |
    SELECT
        a.nome AS autor,
        l.titulo,
        l.isbn
    FROM biblioteca.tb_autor a
    INNER JOIN biblioteca.tb_livroautor la
        ON la.id_autor = a.id
    INNER JOIN biblioteca.tb_livro l
        ON l.id = la.id_livro
    WHERE a.nome = 'Martin Fowler'
    ORDER BY l.titulo;



-- |  Q006  | Quantos exemplares existem para cada livro?             | Livro, Exemplar          |
    SELECT
        l.titulo,
        COUNT(e.id) AS quantidade_exemplares
    FROM biblioteca.tb_livro l
    LEFT JOIN biblioteca.tb_exemplar e
        ON e.id_livro = l.id
    GROUP BY
        l.id,
        l.titulo
    ORDER BY
        l.titulo;



-- |  Q007  | Quais exemplares estão disponíveis?                     | Exemplar, Status         |
    SELECT
        e.codigo_patrimonio,
        l.titulo,
        s.status
    FROM biblioteca.tb_exemplar e
    INNER JOIN biblioteca.tb_livro l
        ON l.id = e.id_livro
    INNER JOIN biblioteca.tb_status s
        ON s.id = e.id_status
    WHERE s.tipo = 'EXEMPLAR'
    AND s.status = 'DISPONIVEL'
    ORDER BY
        l.titulo,
        e.codigo_patrimonio;



-- |  Q008  | Quais exemplares estão emprestados?                     | Exemplar, Status         |
    SELECT
        e.codigo_patrimonio,
        l.titulo,
        s.status
    FROM biblioteca.tb_exemplar e
    INNER JOIN biblioteca.tb_livro l
        ON l.id = e.id_livro
    INNER JOIN biblioteca.tb_status s
        ON s.id = e.id_status
    WHERE s.tipo = 'EXEMPLAR'
    AND s.status = 'EMPRESTADO'
    ORDER BY
        l.titulo,
        e.codigo_patrimonio;



-- |  Q009  | Quais exemplares estão em manutenção?                   | Exemplar, Status         |
    SELECT
        e.codigo_patrimonio,
        l.titulo,
        s.status,
        e.observacao
    FROM biblioteca.tb_exemplar e
    INNER JOIN biblioteca.tb_livro l
        ON l.id = e.id_livro
    INNER JOIN biblioteca.tb_status s
        ON s.id = e.id_status
    WHERE s.tipo = 'EXEMPLAR'
    AND s.status = 'MANUTENCAO'
    ORDER BY
        l.titulo,
        e.codigo_patrimonio;



-- |  Q010  | Existem exemplares disponíveis para determinado livro?  | Livro, Exemplar          |
    SELECT
        l.titulo,
        CASE
            WHEN COUNT(e.id) > 0 THEN 'SIM'
            ELSE 'NÃO'
        END AS disponivel,
        COUNT(e.id) AS quantidade_disponivel
    FROM biblioteca.tb_livro l
    INNER JOIN biblioteca.tb_exemplar e
        ON e.id_livro = l.id
    INNER JOIN biblioteca.tb_status s
        ON s.id = e.id_status
    WHERE l.isbn = '9780000000001'
    AND s.tipo = 'EXEMPLAR'
    AND s.status = 'DISPONIVEL'
    GROUP BY l.titulo;



-- |  Q011  | Quais livros estão totalmente indisponíveis?            | Livro, Exemplar, Status  |
    SELECT
        l.id,
        l.isbn,
        l.titulo
    FROM biblioteca.tb_livro l
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM biblioteca.tb_exemplar e
        INNER JOIN biblioteca.tb_status s
            ON s.id = e.id_status
        WHERE e.id_livro = l.id
        AND s.tipo = 'EXEMPLAR'
        AND s.status = 'DISPONIVEL'
    )
    ORDER BY
        l.titulo;



-- |  Q012  | Quantos usuários estão cadastrados?                     | Usuário                  |
    SELECT
        COUNT(*) AS quantidade_usuarios
    FROM biblioteca.tb_usuario;



-- |  Q013  | Quais usuários possuem perfil de Aluno?                 | Usuário, Perfil          |
    SELECT
        u.id,
        u.nome,
        u.matricula,
        u.email
    FROM biblioteca.tb_usuario u
    INNER JOIN biblioteca.tb_perfil p
        ON p.id = u.id_perfil
    WHERE p.nome = 'Aluno'
    ORDER BY
        u.nome;



-- |  Q014  | Quais usuários possuem perfil de Bibliotecário?         | Usuário, Perfil          |
    SELECT
        u.id,
        u.nome,
        u.matricula,
        u.email
    FROM biblioteca.tb_usuario u
    INNER JOIN biblioteca.tb_perfil p
        ON p.id = u.id_perfil
    WHERE p.nome = 'Bibliotecario'
    ORDER BY
        u.nome;



-- |  Q015  | Quais usuários estão inativos?                          | Usuário                  |
    SELECT
        id,
        nome,
        matricula,
        email
    FROM biblioteca.tb_usuario
    WHERE ativo = FALSE
    ORDER BY
        nome;



-- |  Q016  | Quais empréstimos estão ativos?                         | Empréstimo, Status       |
    SELECT
        emp.id,
        ex.codigo_patrimonio,
        l.titulo,
        u.nome AS aluno,
        emp.data_emprestimo,
        emp.data_prevista_devolucao
    FROM biblioteca.tb_emprestimo emp
    INNER JOIN biblioteca.tb_exemplar ex
        ON ex.id = emp.id_exemplar
    INNER JOIN biblioteca.tb_livro l
        ON l.id = ex.id_livro
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = emp.id_usuario_responsavel
    INNER JOIN biblioteca.tb_status s
        ON s.id = emp.id_status
    WHERE s.tipo = 'EMPRESTIMO'
    AND s.status = 'ATIVO'
    ORDER BY
        emp.data_emprestimo DESC;



-- |  Q017  | Quais empréstimos estão atrasados?                      | Empréstimo, Status       |
    SELECT
        emp.id,
        ex.codigo_patrimonio,
        l.titulo,
        u.nome AS aluno,
        emp.data_prevista_devolucao
    FROM biblioteca.tb_emprestimo emp
    INNER JOIN biblioteca.tb_exemplar ex
        ON ex.id = emp.id_exemplar
    INNER JOIN biblioteca.tb_livro l
        ON l.id = ex.id_livro
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = emp.id_usuario_responsavel
    INNER JOIN biblioteca.tb_status s
        ON s.id = emp.id_status
    WHERE s.tipo = 'EMPRESTIMO'
    AND s.status = 'ATRASADO'
    ORDER BY
        emp.data_prevista_devolucao;



-- |  Q018  | Quais empréstimos já foram devolvidos?                  | Empréstimo, Status       |
    SELECT
        emp.id,
        ex.codigo_patrimonio,
        l.titulo,
        u.nome AS aluno,
        emp.data_emprestimo,
        emp.data_devolucao
    FROM biblioteca.tb_emprestimo emp
    INNER JOIN biblioteca.tb_exemplar ex
        ON ex.id = emp.id_exemplar
    INNER JOIN biblioteca.tb_livro l
        ON l.id = ex.id_livro
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = emp.id_usuario_responsavel
    INNER JOIN biblioteca.tb_status s
        ON s.id = emp.id_status
    WHERE s.tipo = 'EMPRESTIMO'
    AND s.status = 'DEVOLVIDO'
    ORDER BY
        emp.data_devolucao DESC;



-- |  Q019  | Quais empréstimos pertencem a determinado usuário?      | Empréstimo, Usuário      |
    SELECT
        emp.id,
        l.titulo,
        ex.codigo_patrimonio,
        s.status,
        emp.data_emprestimo,
        emp.data_prevista_devolucao,
        emp.data_devolucao
    FROM biblioteca.tb_emprestimo emp
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = emp.id_usuario_responsavel
    INNER JOIN biblioteca.tb_exemplar ex
        ON ex.id = emp.id_exemplar
    INNER JOIN biblioteca.tb_livro l
        ON l.id = ex.id_livro
    INNER JOIN biblioteca.tb_status s
        ON s.id = emp.id_status
    WHERE u.matricula = '20240001'
    ORDER BY
        emp.data_emprestimo DESC;



-- |  Q020  | Qual bibliotecário registrou determinado empréstimo?    | Empréstimo, Usuário      |
    SELECT
        emp.id,
        bib.nome AS bibliotecario,
        bib.matricula,
        l.titulo,
        ex.codigo_patrimonio,
        emp.data_emprestimo
    FROM biblioteca.tb_emprestimo emp
    INNER JOIN biblioteca.tb_usuario bib
        ON bib.id = emp.id_usuario_registro
    INNER JOIN biblioteca.tb_exemplar ex
        ON ex.id = emp.id_exemplar
    INNER JOIN biblioteca.tb_livro l
        ON l.id = ex.id_livro
    WHERE emp.id = 1;



-- |  Q021  | Quais reservas estão ativas?                            | Reserva, Status          |
    SELECT
        r.id,
        l.titulo,
        u.nome AS usuario,
        s.status,
        r.data_reserva
    FROM biblioteca.tb_reserva r
    INNER JOIN biblioteca.tb_livro l
        ON l.id = r.id_livro
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = r.id_usuario
    INNER JOIN biblioteca.tb_status s
        ON s.id = r.id_status
    WHERE s.tipo = 'RESERVA'
    AND s.status = 'ATIVA'
    ORDER BY
        r.data_reserva;



-- |  Q022  | Quais reservas foram atendidas?                         | Reserva, Status          |
    SELECT
        r.id,
        l.titulo,
        u.nome AS usuario,
        s.status,
        r.data_reserva,
        r.data_atendimento
    FROM biblioteca.tb_reserva r
    INNER JOIN biblioteca.tb_livro l
        ON l.id = r.id_livro
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = r.id_usuario
    INNER JOIN biblioteca.tb_status s
        ON s.id = r.id_status
    WHERE s.tipo = 'RESERVA'
    AND s.status = 'ATENDIDA'
    ORDER BY
        r.data_atendimento DESC;



-- |  Q023  | Quais reservas foram canceladas?                        | Reserva, Status          |
    SELECT
        r.id,
        l.titulo,
        u.nome AS usuario,
        s.status,
        r.data_reserva,
        r.data_cancelamento
    FROM biblioteca.tb_reserva r
    INNER JOIN biblioteca.tb_livro l
        ON l.id = r.id_livro
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = r.id_usuario
    INNER JOIN biblioteca.tb_status s
        ON s.id = r.id_status
    WHERE s.tipo = 'RESERVA'
    AND s.status = 'CANCELADA'
    ORDER BY
        r.data_cancelamento DESC;



-- |  Q024  | Quais reservas expiraram?                               | Reserva, Status          |
    SELECT
        r.id,
        l.titulo,
        u.nome AS usuario,
        s.status,
        r.data_reserva,
        r.data_expiracao
    FROM biblioteca.tb_reserva r
    INNER JOIN biblioteca.tb_livro l
        ON l.id = r.id_livro
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = r.id_usuario
    INNER JOIN biblioteca.tb_status s
        ON s.id = r.id_status
    WHERE s.tipo = 'RESERVA'
    AND s.status = 'EXPIRADA'
    ORDER BY
        r.data_expiracao DESC;



-- |  Q025  | Quais livros possuem reservas ativas?                   | Livro, Reserva           |
    SELECT
        l.id,
        l.isbn,
        l.titulo,
        COUNT(r.id) AS quantidade_reservas
    FROM biblioteca.tb_livro l
    INNER JOIN biblioteca.tb_reserva r
        ON r.id_livro = l.id
    INNER JOIN biblioteca.tb_status s
        ON s.id = r.id_status
    WHERE s.tipo = 'RESERVA'
    AND s.status = 'ATIVA'
    GROUP BY
        l.id,
        l.isbn,
        l.titulo
    ORDER BY
        quantidade_reservas DESC,
        l.titulo;



-- |  Q026  | Quais usuários possuem reservas ativas?                 | Reserva, Usuário         |
    SELECT
        u.id,
        u.nome,
        u.matricula,
        COUNT(r.id) AS quantidade_reservas
    FROM biblioteca.tb_usuario u
    INNER JOIN biblioteca.tb_reserva r
        ON r.id_usuario = u.id
    INNER JOIN biblioteca.tb_status s
        ON s.id = r.id_status
    WHERE s.tipo = 'RESERVA'
    AND s.status = 'ATIVA'
    GROUP BY
        u.id,
        u.nome,
        u.matricula
    ORDER BY
        quantidade_reservas DESC,
        u.nome;


 





-- ============================================================================
-- Histórico
-- ============================================================================

-- |  H001  | Qual é o histórico de empréstimos de um usuário?         | Empréstimo, Usuário          |
    SELECT
        emp.id,
        l.titulo,
        ex.codigo_patrimonio,
        st.status,
        emp.data_emprestimo,
        emp.data_prevista_devolucao,
        emp.data_devolucao
    FROM biblioteca.tb_emprestimo emp
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = emp.id_usuario_responsavel
    INNER JOIN biblioteca.tb_exemplar ex
        ON ex.id = emp.id_exemplar
    INNER JOIN biblioteca.tb_livro l
        ON l.id = ex.id_livro
    INNER JOIN biblioteca.tb_status st
        ON st.id = emp.id_status
    WHERE u.matricula = '20240001'
    ORDER BY
        emp.data_emprestimo DESC;


-- |  H002  | Qual é o histórico de um exemplar?                       | Empréstimo, Exemplar         |
    SELECT
        ex.codigo_patrimonio,
        l.titulo,
        u.nome AS aluno,
        st.status,
        emp.data_emprestimo,
        emp.data_prevista_devolucao,
        emp.data_devolucao
    FROM biblioteca.tb_emprestimo emp
    INNER JOIN biblioteca.tb_exemplar ex
        ON ex.id = emp.id_exemplar
    INNER JOIN biblioteca.tb_livro l
        ON l.id = ex.id_livro
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = emp.id_usuario_responsavel
    INNER JOIN biblioteca.tb_status st
        ON st.id = emp.id_status
    WHERE ex.codigo_patrimonio = 'PAT999999'
    ORDER BY
        emp.data_emprestimo DESC;


-- |  H003  | Qual é o histórico de um livro?                          | Livro, Exemplar, Empréstimo  |
    SELECT
        l.titulo,
        ex.codigo_patrimonio,
        u.nome AS aluno,
        st.status,
        emp.data_emprestimo,
        emp.data_prevista_devolucao,
        emp.data_devolucao
    FROM biblioteca.tb_livro l
    INNER JOIN biblioteca.tb_exemplar ex
        ON ex.id_livro = l.id
    INNER JOIN biblioteca.tb_emprestimo emp
        ON emp.id_exemplar = ex.id
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = emp.id_usuario_responsavel
    INNER JOIN biblioteca.tb_status st
        ON st.id = emp.id_status
    WHERE l.isbn = '9780000000001'
    ORDER BY
        emp.data_emprestimo DESC;


-- |  H004  | Quais empréstimos ocorreram em determinado período?      | Empréstimo                   |
    SELECT
        emp.id,
        l.titulo,
        u.nome AS aluno,
        st.status,
        emp.data_emprestimo,
        emp.data_prevista_devolucao,
        emp.data_devolucao
    FROM biblioteca.tb_emprestimo emp
    INNER JOIN biblioteca.tb_exemplar ex
        ON ex.id = emp.id_exemplar
    INNER JOIN biblioteca.tb_livro l
        ON l.id = ex.id_livro
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = emp.id_usuario_responsavel
    INNER JOIN biblioteca.tb_status st
        ON st.id = emp.id_status
    WHERE emp.data_emprestimo
    BETWEEN '2026-01-01'
    AND '2026-12-31'
    ORDER BY
        emp.data_emprestimo;


-- |  H005  | Quais reservas foram atendidas em determinado período?   | Reserva                      |
    SELECT
        r.id,
        l.titulo,
        u.nome,
        r.data_reserva,
        r.data_atendimento
    FROM biblioteca.tb_reserva r
    INNER JOIN biblioteca.tb_livro l
        ON l.id = r.id_livro
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = r.id_usuario
    INNER JOIN biblioteca.tb_status st
        ON st.id = r.id_status
    WHERE st.tipo = 'RESERVA'
    AND st.status = 'ATENDIDA'
    AND r.data_atendimento
    BETWEEN '2026-01-01'
    AND '2026-12-31'
    ORDER BY
        r.data_atendimento;


-- |  H006  | Quais livros foram cadastrados em determinado período?   | Livro                        |
    SELECT
        id,
        isbn,
        titulo,
        created_at
    FROM biblioteca.tb_livro
    WHERE created_at
    BETWEEN '2026-01-01'
    AND '2026-12-31'
    ORDER BY
        created_at;


-- |  H007  | Quais usuários foram cadastrados em determinado período? | Usuário                      |
    SELECT
        id,
        nome,
        matricula,
        email,
        ativo,
        created_at
    FROM biblioteca.tb_usuario
    WHERE created_at
    BETWEEN '2026-01-01'
    AND '2026-12-31'
    ORDER BY
        created_at;




-- ============================================================================
-- Governança
-- ============================================================================

-- |  G001  | Qual livro foi emprestado mais vezes?                       | Livro, Exemplar, Empréstimo           |
    SELECT
        l.titulo,
        COUNT(emp.id) AS quantidade_emprestimos
    FROM biblioteca.tb_emprestimo emp
    INNER JOIN biblioteca.tb_exemplar ex
        ON ex.id = emp.id_exemplar
    INNER JOIN biblioteca.tb_livro l
        ON l.id = ex.id_livro
    GROUP BY
        l.id,
        l.titulo
    ORDER BY
        quantidade_emprestimos DESC
    LIMIT 1;



-- |  G002  | Qual categoria possui maior circulação?                     | Categoria, Livro, Empréstimo          |
    SELECT
        c.nome,
        COUNT(emp.id) AS circulacao
    FROM biblioteca.tb_emprestimo emp
    INNER JOIN biblioteca.tb_exemplar ex
        ON ex.id = emp.id_exemplar
    INNER JOIN biblioteca.tb_livro l
        ON l.id = ex.id_livro
    INNER JOIN biblioteca.tb_categoria c
        ON c.id = l.id_categoria
    GROUP BY
        c.id,
        c.nome
    ORDER BY
        circulacao DESC
    LIMIT 1;



-- |  G003  | Qual autor possui maior circulação?                         | Autor, LivroAutor, Livro, Empréstimo  |
    SELECT
        a.nome,
        COUNT(emp.id) AS circulacao
    FROM biblioteca.tb_emprestimo emp
    INNER JOIN biblioteca.tb_exemplar ex
        ON ex.id = emp.id_exemplar
    INNER JOIN biblioteca.tb_livro l
        ON l.id = ex.id_livro
    INNER JOIN biblioteca.tb_livroAutor la
        ON la.id_livro = l.id
    INNER JOIN biblioteca.tb_autor a
        ON a.id = la.id_autor
    GROUP BY
        a.id,
        a.nome
    ORDER BY
        circulacao DESC
    LIMIT 1;



-- |  G004  | Qual editora possui maior circulação?                       | Editora, Livro, Empréstimo            |
    SELECT
        e.nome,
        COUNT(emp.id) AS circulacao
    FROM biblioteca.tb_emprestimo emp
    INNER JOIN biblioteca.tb_exemplar ex
        ON ex.id = emp.id_exemplar
    INNER JOIN biblioteca.tb_livro l
        ON l.id = ex.id_livro
    INNER JOIN biblioteca.tb_editora e
        ON e.id = l.id_editora
    GROUP BY
        e.id,
        e.nome
    ORDER BY
        circulacao DESC
    LIMIT 1;



-- |  G005  | Qual usuário realizou mais empréstimos?                     | Usuário, Empréstimo                   |
    SELECT
        u.nome,
        COUNT(emp.id) AS quantidade_emprestimos
    FROM biblioteca.tb_emprestimo emp
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = emp.id_usuario_responsavel
    GROUP BY
        u.id,
        u.nome
    ORDER BY
        quantidade_emprestimos DESC
    LIMIT 1;



-- |  G006  | Qual bibliotecário registrou mais empréstimos?              | Usuário, Empréstimo                   |
    SELECT
        u.nome,
        COUNT(emp.id) AS registros
    FROM biblioteca.tb_emprestimo emp
    INNER JOIN biblioteca.tb_usuario u
        ON u.id = emp.id_usuario_registro
    GROUP BY
        u.id,
        u.nome
    ORDER BY
        registros DESC
    LIMIT 1;



-- |  G007  | Qual livro possui maior quantidade de reservas?             | Livro, Reserva                        |
    SELECT
        l.titulo,
        COUNT(r.id) AS reservas
    FROM biblioteca.tb_reserva r
    INNER JOIN biblioteca.tb_livro l
        ON l.id = r.id_livro
    GROUP BY
        l.id,
        l.titulo
    ORDER BY
        reservas DESC
    LIMIT 1;



-- |  G008  | Quantas reservas foram atendidas?                           | Reserva                               |
    SELECT
        COUNT(*) AS reservas_atendidas
    FROM biblioteca.tb_reserva r
    INNER JOIN biblioteca.tb_status s
        ON s.id = r.id_status
    WHERE s.tipo='RESERVA'
    AND s.status='ATENDIDA';



-- |  G009  | Quantas reservas expiraram?                                 | Reserva                               |
    SELECT
        COUNT(*) AS reservas_expiradas
    FROM biblioteca.tb_reserva r
    INNER JOIN biblioteca.tb_status s
        ON s.id = r.id_status
    WHERE s.tipo='RESERVA'
    AND s.status='EXPIRADA';



-- |  G010  | Qual é a taxa de atendimento das reservas?                  | Reserva                               |
    SELECT
        ROUND(100.0 * SUM( CASE
                                WHEN s.status='ATENDIDA' THEN 1 ELSE 0
                        END) / COUNT(*) ,2) AS percentual_atendimento
    FROM biblioteca.tb_reserva r
    INNER JOIN biblioteca.tb_status s
    ON s.id=r.id_status
    WHERE s.tipo='RESERVA';



-- |  G011  | Qual é a taxa de cancelamento das reservas?                 | Reserva                               |
    SELECT
    ROUND(100.0 * SUM( CASE
                           WHEN s.status='CANCELADA' THEN 1 ELSE 0
                       END) / COUNT(*),2)  AS percentual_cancelamento
    FROM biblioteca.tb_reserva r
    INNER JOIN biblioteca.tb_status s
    ON s.id=r.id_status
    WHERE s.tipo='RESERVA';



-- |  G012  | Qual é o tempo médio entre reserva e atendimento?           | Reserva                               |
    SELECT
        AVG(r.data_atendimento - r.data_reserva) AS tempo_medio
    FROM biblioteca.tb_reserva r
    INNER JOIN biblioteca.tb_status s
    ON s.id=r.id_status
    WHERE s.tipo='RESERVA'
    AND s.status='ATENDIDA';



-- |  G013  | Qual é o tempo médio dos empréstimos?                       | Empréstimo                            |
    SELECT
        AVG(emp.data_devolucao - emp.data_emprestimo) AS tempo_medio
    FROM biblioteca.tb_emprestimo emp
    INNER JOIN biblioteca.tb_status s
    ON s.id=emp.id_status
    WHERE s.tipo='EMPRESTIMO'
    AND s.status='DEVOLVIDO';



-- |  G014  | Qual categoria possui maior quantidade de exemplares?       | Categoria, Livro, Exemplar            |
    SELECT
        c.nome,
        COUNT(ex.id) AS quantidade_exemplares
    FROM biblioteca.tb_categoria c
    INNER JOIN biblioteca.tb_livro l
        ON l.id_categoria=c.id
    INNER JOIN biblioteca.tb_exemplar ex
        ON ex.id_livro=l.id
    GROUP BY
        c.id,
        c.nome
    ORDER BY
        quantidade_exemplares DESC
    LIMIT 1;



-- |  G015  | Qual editora possui maior quantidade de livros cadastrados? | Editora, Livro                        |
    SELECT
        e.nome,
        COUNT(l.id) AS quantidade_livros
    FROM biblioteca.tb_editora e
    INNER JOIN biblioteca.tb_livro l
        ON l.id_editora=e.id
    GROUP BY
        e.id,
        e.nome
    ORDER BY
        quantidade_livros DESC
    LIMIT 1;



-- |  G016  | Qual autor possui maior quantidade de obras cadastradas?    | Autor, LivroAutor                     |
    SELECT
        a.nome,
        COUNT(la.id_livro) AS quantidade_obras
    FROM biblioteca.tb_autor a
    INNER JOIN biblioteca.tb_livroAutor la
        ON la.id_autor=a.id
    GROUP BY
        a.id,
        a.nome
    ORDER BY
        quantidade_obras DESC
    LIMIT 1;
