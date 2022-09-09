SELECT * FROM heroi 

SELECT * FROM monstro 

SELECT * FROM batalhas

SELECT * FROM poder 


SELECT nome,defesa  FROM monstro
UNION
SELECT nome,forca FROM heroi
ORDER BY nome ASC


SELECT h.id AS h_id, h.nome AS h_nome, p.id AS p_id, p.tipo AS p_id
FROM heroi AS h
LEFT JOIN heroi_poder AS hp ON hp.heroi_id = h.id 
LEFT JOIN poder AS p ON p.id = hp.poder_id 
ORDER BY h.nome ASC 

SELECT m.id AS m_id, m.nome AS m_nome, p.id AS p_id, p.tipo AS p_id
FROM monstro AS m
LEFT JOIN monstro_poder AS mp ON mp.monstro_id  = m.id 
LEFT JOIN poder AS p ON p.id = mp.poder_id 
ORDER BY m.nome ASC


SELECT h.id AS h_i, h.nome AS h_heroi, b.id AS b_id, b."data" AS b_data, b.hora AS b_hora,
m.id AS m_id,m.nome AS m_nome, b.heroi_ganhou
FROM monstro_heroi_batalha AS mhb
LEFT JOIN batalhas AS b ON b.id = mhb.batalha_id 
LEFT JOIN heroi AS h ON h.id = mhb.heroi_id 
LEFT JOIN monstro AS m ON m.id = mhb.monstro_id 
ORDER BY b."data", b.hora, h.nome DESC 




SELECT h.id AS h_i, h.nome AS h_heroi, b.id AS b_id, b."data" AS b_data, b.hora AS b_hora,
m.id AS m_id,m.nome AS m_nome, b.heroi_ganhou
FROM monstro_heroi_batalha AS mhb
LEFT JOIN batalhas AS b ON b.id = mhb.batalha_id 
LEFT JOIN heroi AS h ON h.id = mhb.heroi_id 
LEFT JOIN monstro AS m ON m.id = mhb.monstro_id 
WHERE h.nivel < m.nivel AND b.heroi_ganhou = TRUE 
ORDER BY b."data", b.hora, h.nome DESC 
