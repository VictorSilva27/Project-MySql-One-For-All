SELECT
MIN(p.price) AS 'faturamento_minimo',
MAX(p.price) AS 'faturamento_maximo',
CONCAT(ROUND(AVG(p.price), 2)) AS 'faturamento_medio',
CONCAT(ROUND(SUM(p.price), 2)) AS 'faturamento_total'
FROM SpotifyClone.users u
INNER JOIN SpotifyClone.plans p ON u.id_plan = p.id_plan;