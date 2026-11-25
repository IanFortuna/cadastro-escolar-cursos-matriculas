
-- Banco de dados: cadastro escolar de cursos e matrículas
-- Compatível com MySQL 8

CREATE DATABASE IF NOT EXISTS banco_cursos_matriculas;

USE banco_cursos_matriculas;

CREATE TABLE alunos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE cursos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    carga_horaria INT NOT NULL CHECK (carga_horaria > 0)
);

CREATE TABLE matriculas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT NOT NULL,
    curso_id INT NOT NULL,
    data_matricula DATE NOT NULL,

    FOREIGN KEY (aluno_id) REFERENCES alunos(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id),
    UNIQUE (aluno_id, curso_id)
);

INSERT INTO alunos (nome, email) VALUES
('Ian Fortuna', 'ian.fortuna@outlook.com'),
('Arrascaeta', 'arrascaeta@outlook.com'),
('Bruno Henrique', 'bruno.henrique@outlook.com'),
('Samu Lino', 'samu.lino@outlook.com'),
('Eduarda Costa', 'eduarda.costa@outlook.com');

INSERT INTO cursos (nome, carga_horaria) VALUES
('Inglês', 80),
('Informática Básica', 60),
('Reforço de Matemática', 40);

INSERT INTO matriculas (aluno_id, curso_id, data_matricula) VALUES
(1, 1, '2026-02-10'),
(2, 1, '2026-02-11'),
(3, 2, '2026-02-12'),
(4, 2, '2026-02-13'),
(5, 3, '2026-02-14'),
(1, 3, '2026-02-15');


SELECT *
FROM alunos
ORDER BY id;


SELECT
    a.nome AS aluno,
    c.nome AS curso,
    m.data_matricula
FROM matriculas m
JOIN alunos a ON a.id = m.aluno_id
JOIN cursos c ON c.id = m.curso_id
WHERE c.id = 1
ORDER BY a.nome;


SELECT
    a.nome AS aluno,
    c.nome AS curso,
    m.data_matricula
FROM matriculas m
INNER JOIN alunos a ON a.id = m.aluno_id
INNER JOIN cursos c ON c.id = m.curso_id
ORDER BY m.id;


SELECT
    c.nome AS curso,
    COUNT(m.id) AS quantidade_matriculas
FROM cursos c
LEFT JOIN matriculas m ON m.curso_id = c.id
GROUP BY c.id, c.nome
ORDER BY c.id;



UPDATE alunos
SET email = 'ian.fortuna.novo@outlook.com'
WHERE id = 1;


SELECT id, nome, email
FROM alunos
WHERE id = 1;


SELECT id, nome, carga_horaria
FROM cursos
ORDER BY id;
