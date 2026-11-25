SELECT
    c.nome AS curso,
    COUNT(m.id) AS quantidade_matriculas
FROM cursos c
LEFT JOIN matriculas m ON m.curso_id = c.id
GROUP BY c.id, c.nome;