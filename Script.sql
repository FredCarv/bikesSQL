-- Entendeu a base de dados
SELECT 
	*
FROM trips
limit 10

--quantas corridas nós temos
SELECT 
	COUNT(DISTINCT id) as qtd_corridas_total
from trips
WHERE duration >= 300

--tempo médio dessas corridas
SELECT 
	COUNT(DISTINCT id) as qtd_corridas_total,
	MIN(duration) /60 as menor_tempo,
	AVG(duration) /60 as tempo_medio,
	MAX(duration) /60 as maior_tempo,
	STDEV(duration) as desvio_padrao
FROM trips 
WHERE duration >= 300
and duration <= 500000

-- quais são nossos melhores meses
SELECT
	SUBSTR(start_date,1, 7) as year_month, 
	COUNT(DISTINCT id) as qtd_corridas_total
FROM trips
where duration >= 300
and duration <= 500000
GROUP BY year_month
ORDER BY qtd_corridas_total DESC 
LIMIT 1


-- hora de pico
SELECT
	SUBSTR(start_date, 12, 2) as hora,
	COUNT(DISTINCT id) as qtd_corridas_total 
FROM trips
WHERE duration >= 300
and duration  <= 500000
and SUBSTR(start_date, 1, 7) = '2014-10' 
GROUP BY hora
ORDER BY qtd_corridas_total DESC 
LIMIT 5

