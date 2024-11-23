DROP TABLE IF EXISTS sum_distritos_15_enero;

CREATE TABLE sum_distritos_15_enero AS
WITH filtrado_por_horas AS (
    SELECT 
        destino, 
        actividad_destino,
        municipio_destino,
        SUM(viajes) AS total_poblacion
    FROM 
        viajes_distritos_15_enero
    WHERE 
        hora IN (8, 9) 
    GROUP BY 
        destino, actividad_destino, municipio_destino
), actividad_maxima_por_distrito AS (
    SELECT 
        destino, 
        actividad_destino, 
        municipio_destino,
        total_poblacion
    FROM (
        SELECT 
            destino, 
            actividad_destino, 
            municipio_destino,
            total_poblacion,
            ROW_NUMBER() OVER (
                PARTITION BY destino 
                ORDER BY total_poblacion DESC
            ) AS rn
        FROM 
            filtrado_por_horas
    ) subquery
    WHERE rn = 1 
)
SELECT * 
FROM actividad_maxima_por_distrito;