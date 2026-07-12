-- ============================================================================
-- Objetivo: Popular a tabela de status do sistema
-- ============================================================================

INSERT INTO biblioteca.tb_status (tipo, status, descricao)
VALUES
('EXEMPLAR', 'DISPONIVEL', 'Exemplar disponível para empréstimo'),
('EXEMPLAR', 'EMPRESTADO', 'Exemplar emprestado para um aluno'),
('EXEMPLAR', 'RESERVADO', 'Exemplar reservado aguardando retirada'),
('EXEMPLAR', 'MANUTENCAO', 'Exemplar temporariamente indisponível para manutenção'),
('EXEMPLAR', 'EXTRAVIADO', 'Exemplar extraviado'),
('EXEMPLAR', 'DESCARTADO', 'Exemplar retirado definitivamente do acervo'),
('EMPRESTIMO', 'ATIVO', 'Empréstimo em andamento'),
('EMPRESTIMO', 'DEVOLVIDO', 'Empréstimo encerrado com devolução'),
('EMPRESTIMO', 'ATRASADO', 'Prazo de devolução expirado'),
('EMPRESTIMO', 'CANCELADO', 'Empréstimo cancelado'),
('RESERVA', 'ATIVA', 'Reserva aguardando disponibilidade'),
('RESERVA', 'ATENDIDA', 'Reserva atendida'),
('RESERVA', 'CANCELADA', 'Reserva cancelada pelo usuário'),
('RESERVA', 'EXPIRADA', 'Reserva expirada por falta de retirada');

-- ============================================================================
-- Objetivo: Popular os perfis de usuários
-- ============================================================================

INSERT INTO biblioteca.tb_perfil (nome, descricao)
VALUES
('Aluno', 'Usuário autorizado a realizar empréstimos e reservas'),
('Bibliotecario', 'Usuário responsável pelo atendimento da biblioteca'),
('Administrador', 'Usuário responsável pela administração do sistema');

-- ============================================================================
-- Objetivo: Popular as categorias de livros
-- ============================================================================

INSERT INTO biblioteca.tb_categoria (nome, descricao)
VALUES
('Programação', 'Livros sobre desenvolvimento de software'),
('Banco de Dados', 'Livros sobre bancos de dados relacionais e NoSQL'),
('Algoritmos', 'Livros sobre algoritmos e estruturas de dados'),
('Engenharia de Software', 'Livros sobre processos e arquitetura de software'),
('Redes de Computadores', 'Livros sobre infraestrutura e redes'),
('Segurança da Informação', 'Livros sobre segurança digital'),
('Inteligência Artificial', 'Livros sobre IA e Machine Learning'),
('Matemática', 'Livros de matemática aplicada e teórica'),
('Física', 'Livros de física geral'),
('Literatura', 'Livros literários para apoio escolar'),
('História', 'Livros de história geral'),
('Geografia', 'Livros de geografia física e humana');


-- ============================================================================
-- Objetivo: Popular as editoras
-- ============================================================================

INSERT INTO biblioteca.tb_editora (nome, site)
VALUES
('Novatec', 'https://novatec.com.br'),
('Casa do Código', 'https://www.casadocodigo.com.br'),
('Alta Books', 'https://altabooks.com.br'),
('Pearson', 'https://www.pearson.com'),
('Bookman', 'https://bookman.com.br'),
('Elsevier', 'https://www.elsevier.com'),
('O''Reilly Media', 'https://www.oreilly.com'),
('Addison-Wesley', 'https://www.informit.com'),
('McGraw-Hill', 'https://www.mheducation.com'),
('MIT Press', 'https://mitpress.mit.edu');


-- ============================================================================
-- Objetivo: Popular a tabela de autores
-- ============================================================================

INSERT INTO biblioteca.tb_autor (nome, data_nascimento)
VALUES
('Robert C. Martin',        '1952-12-05'),
('Martin Fowler',           '1963-12-18'),
('Joshua Bloch',            '1961-08-28'),
('Eric Evans',              '1965-01-01'),
('Erich Gamma',             '1961-03-13'),
('Richard Helm',            '1960-01-01'),
('Ralph Johnson',           '1955-10-07'),
('John Vlissides',          '1961-08-02'),
('Andrew Hunt',             '1964-01-01'),
('David Thomas',            '1956-01-01'),
('Thomas H. Cormen',        '1956-01-01'),
('Charles E. Leiserson',    '1953-11-10'),
('Ronald L. Rivest',        '1947-05-06'),
('Clifford Stein',          '1965-01-14'),
('Donald E. Knuth',         '1938-01-10');


-- ============================================================================
-- Objetivo: Popular a tabela de livros
-- ============================================================================

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
 (SELECT id FROM biblioteca.tb_editora WHERE nome='Alta Books'),
 '9788550801485',
 'Clean Code',
 'Boas práticas para desenvolvimento de software.',
 1,
 2009,
 425
),
(
 (SELECT id FROM biblioteca.tb_categoria WHERE nome='Engenharia de Software'),
 (SELECT id FROM biblioteca.tb_editora WHERE nome='Novatec'),
 '9788575227242',
 'Clean Architecture',
 'Arquitetura limpa para sistemas de software.',
 1,
 2019,
 432
),
(
 (SELECT id FROM biblioteca.tb_categoria WHERE nome='Engenharia de Software'),
 (SELECT id FROM biblioteca.tb_editora WHERE nome='Novatec'),
 '9788575221264',
 'Refactoring',
 'Melhorando o projeto de código existente.',
 2,
 2019,
 448
),
(
 (SELECT id FROM biblioteca.tb_categoria WHERE nome='Programação'),
 (SELECT id FROM biblioteca.tb_editora WHERE nome='Addison-Wesley'),
 '9780134685991',
 'Effective Java',
 'Boas práticas para Java.',
 3,
 2018,
 416
),
(
 (SELECT id FROM biblioteca.tb_categoria WHERE nome='Engenharia de Software'),
 (SELECT id FROM biblioteca.tb_editora WHERE nome='Alta Books'),
 '9788550815307',
 'Domain-Driven Design',
 'Projeto orientado ao domínio.',
 1,
 2016,
 560
),
(
 (SELECT id FROM biblioteca.tb_categoria WHERE nome='Algoritmos'),
 (SELECT id FROM biblioteca.tb_editora WHERE nome='MIT Press'),
 '9780262046305',
 'Introduction to Algorithms',
 'Algoritmos clássicos.',
 4,
 2022,
 1312
),
(
 (SELECT id FROM biblioteca.tb_categoria WHERE nome='Programação'),
 (SELECT id FROM biblioteca.tb_editora WHERE nome='Addison-Wesley'),
 '9780201616224',
 'Design Patterns',
 'Padrões de projeto.',
 1,
 1994,
 395
),
(
 (SELECT id FROM biblioteca.tb_categoria WHERE nome='Programação'),
 (SELECT id FROM biblioteca.tb_editora WHERE nome='Addison-Wesley'),
 '9780201616460',
 'The Pragmatic Programmer',
 'Programação pragmática.',
 2,
 2019,
 352
);


-- ============================================================================
-- Objetivo: Relacionar livros e autores
-- ============================================================================

INSERT INTO biblioteca.tb_livroAutor
(id_livro,id_autor,ordem_autoria)
VALUES
(
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Clean Code'),
 (SELECT id FROM biblioteca.tb_autor WHERE nome='Robert C. Martin'),
 1
),
(
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Clean Architecture'),
 (SELECT id FROM biblioteca.tb_autor WHERE nome='Robert C. Martin'),
 1
),
(
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Refactoring'),
 (SELECT id FROM biblioteca.tb_autor WHERE nome='Martin Fowler'),
 1
),
(
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Effective Java'),
 (SELECT id FROM biblioteca.tb_autor WHERE nome='Joshua Bloch'),
 1
),
(
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Domain-Driven Design'),
 (SELECT id FROM biblioteca.tb_autor WHERE nome='Eric Evans'),
 1
),
(
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Introduction to Algorithms'),
 (SELECT id FROM biblioteca.tb_autor WHERE nome='Thomas H. Cormen'),
 1
),
(
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Introduction to Algorithms'),
 (SELECT id FROM biblioteca.tb_autor WHERE nome='Charles E. Leiserson'),
 2
),
(
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Introduction to Algorithms'),
 (SELECT id FROM biblioteca.tb_autor WHERE nome='Ronald L. Rivest'),
 3
),
(
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Introduction to Algorithms'),
 (SELECT id FROM biblioteca.tb_autor WHERE nome='Clifford Stein'),
 4
),
(
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Design Patterns'),
 (SELECT id FROM biblioteca.tb_autor WHERE nome='Erich Gamma'),
 1
),
(
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Design Patterns'),
 (SELECT id FROM biblioteca.tb_autor WHERE nome='Richard Helm'),
 2
),
(
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Design Patterns'),
 (SELECT id FROM biblioteca.tb_autor WHERE nome='Ralph Johnson'),
 3
),
(
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Design Patterns'),
 (SELECT id FROM biblioteca.tb_autor WHERE nome='John Vlissides'),
 4
),
(
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='The Pragmatic Programmer'),
 (SELECT id FROM biblioteca.tb_autor WHERE nome='Andrew Hunt'),
 1
),
(
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='The Pragmatic Programmer'),
 (SELECT id FROM biblioteca.tb_autor WHERE nome='David Thomas'),
 2
);


-- ============================================================================
-- Objetivo: Popular usuários do sistema
-- ============================================================================

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
 (SELECT id FROM biblioteca.tb_perfil WHERE nome='Bibliotecario'),
 'Maria Oliveira',
 'BIB001',
 'maria@biblioteca.edu.br',
 '(11)1111-1111',
 TRUE
),
(
 (SELECT id FROM biblioteca.tb_perfil WHERE nome='Bibliotecario'),
 'Carlos Santos',
 'BIB002',
 'carlos@biblioteca.edu.br',
 '(11)1111-2222',
 TRUE
),
(
 (SELECT id FROM biblioteca.tb_perfil WHERE nome='Administrador'),
 'Administrador do Sistema',
 'ADM001',
 'admin@biblioteca.edu.br',
 '(11)1111-0000',
 TRUE
),
(
 (SELECT id FROM biblioteca.tb_perfil WHERE nome='Aluno'),
 'Ana Souza',
 '20240001',
 'ana@escola.edu.br',
 '(11)90000-0001',
 TRUE
),
(
 (SELECT id FROM biblioteca.tb_perfil WHERE nome='Aluno'),
 'Bruno Lima',
 '20240002',
 'bruno@escola.edu.br',
 '(11)90000-0002',
 TRUE
),
(
 (SELECT id FROM biblioteca.tb_perfil WHERE nome='Aluno'),
 'Camila Rocha',
 '20240003',
 'camila@escola.edu.br',
 '(11)90000-0003',
 TRUE
),
(
 (SELECT id FROM biblioteca.tb_perfil WHERE nome='Aluno'),
 'Daniel Costa',
 '20240004',
 'daniel@escola.edu.br',
 '(11)90000-0004',
 TRUE
),
(
 (SELECT id FROM biblioteca.tb_perfil WHERE nome='Aluno'),
 'Eduarda Martins',
 '20240005',
 'eduarda@escola.edu.br',
 '(11)90000-0005',
 TRUE
),
(
 (SELECT id FROM biblioteca.tb_perfil WHERE nome='Aluno'),
 'Felipe Almeida',
 '20240006',
 'felipe@escola.edu.br',
 '(11)90000-0006',
 TRUE
),
(
 (SELECT id FROM biblioteca.tb_perfil WHERE nome='Aluno'),
 'Gabriela Ferreira',
 '20240007',
 'gabriela@escola.edu.br',
 '(11)90000-0007',
 TRUE
),
(
 (SELECT id FROM biblioteca.tb_perfil WHERE nome='Aluno'),
 'Henrique Barbosa',
 '20240008',
 'henrique@escola.edu.br',
 '(11)90000-0008',
 TRUE
),
(
 (SELECT id FROM biblioteca.tb_perfil WHERE nome='Aluno'),
 'Isabela Gomes',
 '20240009',
 'isabela@escola.edu.br',
 '(11)90000-0009',
 TRUE
),
(
 (SELECT id FROM biblioteca.tb_perfil WHERE nome='Aluno'),
 'João Pereira',
 '20240010',
 'joao@escola.edu.br',
 '(11)90000-0010',
 TRUE
);

-- ============================================================================
-- Objetivo: Popular os exemplares do acervo
-- ============================================================================

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
 (SELECT id FROM biblioteca.tb_status WHERE tipo='EXEMPLAR' AND status='DISPONIVEL'),
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Clean Code'),
 'PAT000001',
 '2024-01-15',
 NULL
),
(
 (SELECT id FROM biblioteca.tb_status WHERE tipo='EXEMPLAR' AND status='EMPRESTADO'),
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Clean Code'),
 'PAT000002',
 '2024-01-15',
 NULL
),
(
 (SELECT id FROM biblioteca.tb_status WHERE tipo='EXEMPLAR' AND status='RESERVADO'),
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Clean Code'),
 'PAT000003',
 '2024-01-15',
 NULL
),
(
 (SELECT id FROM biblioteca.tb_status WHERE tipo='EXEMPLAR' AND status='EMPRESTADO'),
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Effective Java'),
 'PAT000004',
 '2024-02-10',
 NULL
),
(
 (SELECT id FROM biblioteca.tb_status WHERE tipo='EXEMPLAR' AND status='DISPONIVEL'),
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Effective Java'),
 'PAT000005',
 '2024-02-10',
 NULL
),
(
 (SELECT id FROM biblioteca.tb_status WHERE tipo='EXEMPLAR' AND status='DISPONIVEL'),
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Refactoring'),
 'PAT000006',
 '2024-03-01',
 NULL
),
(
 (SELECT id FROM biblioteca.tb_status WHERE tipo='EXEMPLAR' AND status='MANUTENCAO'),
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Design Patterns'),
 'PAT000007',
 '2024-03-15',
 'Encaminhado para restauração'
),
(
 (SELECT id FROM biblioteca.tb_status WHERE tipo='EXEMPLAR' AND status='DISPONIVEL'),
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Domain-Driven Design'),
 'PAT000008',
 '2024-03-20',
 NULL
),
(
 (SELECT id FROM biblioteca.tb_status WHERE tipo='EXEMPLAR' AND status='EMPRESTADO'),
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Introduction to Algorithms'),
 'PAT000009',
 '2024-04-10',
 NULL
),
(
 (SELECT id FROM biblioteca.tb_status WHERE tipo='EXEMPLAR' AND status='DISPONIVEL'),
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Introduction to Algorithms'),
 'PAT000010',
 '2024-04-10',
 NULL
);

-- ============================================================================
-- Objetivo: Popular reservas
-- ============================================================================

INSERT INTO biblioteca.tb_reserva
(
    id_livro,
    id_status,
    id_usuario,
    data_reserva,
    data_atendimento,
    data_expiracao,
    data_cancelamento
)
VALUES
(
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Clean Code'),
 (SELECT id FROM biblioteca.tb_status WHERE tipo='RESERVA' AND status='ATIVA'),
 (SELECT id FROM biblioteca.tb_usuario WHERE matricula='20240003'),
 '2026-07-08 09:00',
 NULL,
 NULL,
 NULL
),
(
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Effective Java'),
 (SELECT id FROM biblioteca.tb_status WHERE tipo='RESERVA' AND status='ATENDIDA'),
 (SELECT id FROM biblioteca.tb_usuario WHERE matricula='20240004'),
 '2026-07-01 10:00',
 '2026-07-03 15:00',
 NULL,
 NULL
),
(
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Domain-Driven Design'),
 (SELECT id FROM biblioteca.tb_status WHERE tipo='RESERVA' AND status='CANCELADA'),
 (SELECT id FROM biblioteca.tb_usuario WHERE matricula='20240005'),
 '2026-07-02 11:00',
 NULL,
 NULL,
 '2026-07-03 09:00'
),
(
 (SELECT id FROM biblioteca.tb_livro WHERE titulo='Introduction to Algorithms'),
 (SELECT id FROM biblioteca.tb_status WHERE tipo='RESERVA' AND status='EXPIRADA'),
 (SELECT id FROM biblioteca.tb_usuario WHERE matricula='20240006'),
 '2026-06-20 08:30',
 NULL,
 '2026-06-23 18:00',
 NULL
);

-- ============================================================================
-- Objetivo: Popular empréstimos
-- ============================================================================

INSERT INTO biblioteca.tb_emprestimo
(
    id_exemplar,
    id_usuario_responsavel,
    id_usuario_registro,
    id_status,
    data_emprestimo,
    data_prevista_devolucao,
    data_devolucao
)
VALUES
(
 (SELECT id FROM biblioteca.tb_exemplar WHERE codigo_patrimonio='PAT000002'),
 (SELECT id FROM biblioteca.tb_usuario WHERE matricula='20240001'),
 (SELECT id FROM biblioteca.tb_usuario WHERE matricula='BIB001'),
 (SELECT id FROM biblioteca.tb_status WHERE tipo='EMPRESTIMO' AND status='ATIVO'),
 '2026-07-08 08:00',
 '2026-07-15 08:00',
 NULL
),
(
 (SELECT id FROM biblioteca.tb_exemplar WHERE codigo_patrimonio='PAT000004'),
 (SELECT id FROM biblioteca.tb_usuario WHERE matricula='20240002'),
 (SELECT id FROM biblioteca.tb_usuario WHERE matricula='BIB001'),
 (SELECT id FROM biblioteca.tb_status WHERE tipo='EMPRESTIMO' AND status='DEVOLVIDO'),
 '2026-06-10 09:00',
 '2026-06-17 09:00',
 '2026-06-16 14:00'
),
(
 (SELECT id FROM biblioteca.tb_exemplar WHERE codigo_patrimonio='PAT000009'),
 (SELECT id FROM biblioteca.tb_usuario WHERE matricula='20240007'),
 (SELECT id FROM biblioteca.tb_usuario WHERE matricula='BIB002'),
 (SELECT id FROM biblioteca.tb_status WHERE tipo='EMPRESTIMO' AND status='ATRASADO'),
 '2026-06-20 10:00',
 '2026-06-27 10:00',
 NULL
),
(
 (SELECT id FROM biblioteca.tb_exemplar WHERE codigo_patrimonio='PAT000003'),
 (SELECT id FROM biblioteca.tb_usuario WHERE matricula='20240008'),
 (SELECT id FROM biblioteca.tb_usuario WHERE matricula='BIB002'),
 (SELECT id FROM biblioteca.tb_status WHERE tipo='EMPRESTIMO' AND status='ATIVO'),
 '2026-07-09 14:00',
 '2026-07-16 14:00',
 NULL
);