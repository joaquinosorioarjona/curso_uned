DROP TABLE IF EXISTS sum_distritos_15_enero;

CREATE TABLE sum_distritos_15_enero AS
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
        destino, actividad_destino, municipio_destino;
