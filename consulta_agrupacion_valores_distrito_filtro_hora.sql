DROP TABLE IF EXISTS sum_distritos_15_enero;

CREATE TABLE sum_distritos_15_enero AS
    SELECT 
        destino, 
        actividad_destino,
        municipio_destino,
        SUM(viajes) AS total_poblacion,
        CASE
            WHEN hora = 8 THEN '8'
            WHEN hora = 9 THEN '9'
        END AS rango_hora
    FROM 
        viajes_distritos_15_enero
    WHERE 
        hora IN (8, 9)
    GROUP BY 
        destino, actividad_destino, municipio_destino, 
        CASE
            WHEN hora = 8 THEN '8'
            WHEN hora = 9 THEN '9'
        END;