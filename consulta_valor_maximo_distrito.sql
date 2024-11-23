DROP TABLE IF EXISTS sum_distritos_15_enero;

CREATE TABLE sum_distritos_15_enero AS
WITH max_poblacion_por_distrito AS (
    SELECT 
        destino, 
        sexo, 
	provincia_destino,
        SUM(viajes) AS total_poblacion
    FROM 
        viajes_distritos_15_enero
    GROUP BY 
        destino, sexo, provincia_destino
), max_sexo_por_distrito AS (
    SELECT 
        destino, 
        sexo, 
	provincia_destino,
        total_poblacion
    FROM (
        SELECT 
            destino, 
            sexo, 
	    provincia_destino,
            total_poblacion,
            ROW_NUMBER() OVER (PARTITION BY destino ORDER BY total_poblacion DESC) AS rn
        FROM 
            max_poblacion_por_distrito
    ) subquery
    WHERE rn = 1
)
SELECT * 
FROM max_sexo_por_distrito;
