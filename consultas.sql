-- Listar todos os pacientes
SELECT * FROM Paciente;

-- Listar todos os médicos
SELECT * FROM Medico;

-- Listar consultas com nome do paciente e médico
SELECT 
    p.nome AS paciente,
    m.nome AS medico,
    c.data_consulta,
    c.horario,
    c.status
FROM Consulta c
JOIN Paciente p ON c.id_paciente = p.id_paciente
JOIN Medico m ON c.id_medico = m.id_medico;

-- Consultas agendadas
SELECT * 
FROM Consulta
WHERE status = 'agendada';

-- Total de consultas por médico
SELECT 
    m.nome,
    COUNT(c.id_consulta) AS total_consultas
FROM Medico m
LEFT JOIN Consulta c ON m.id_medico = c.id_medico
GROUP BY m.nome;

-- Pagamentos realizados
SELECT 
    p.id_pagamento,
    p.valor,
    p.data_pagamento,
    c.id_consulta
FROM Pagamento p
JOIN Consulta c ON p.id_consulta = c.id_consulta;
