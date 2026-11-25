SELECT
    a.nome AS aluno,
    c.nome AS curso,
    m.data_matricula
FROM matriculas m
JOIN alunos a ON a.id = m.aluno_id
JOIN cursos c ON c.id = m.curso_id
WHERE c.id = 1;
