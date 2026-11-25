SELECT
    a.nome AS aluno,
    c.nome AS curso,
    m.data_matricula
FROM matriculas m
INNER JOIN alunos a ON a.id = m.aluno_id
INNER JOIN cursos c ON c.id = m.curso_id;