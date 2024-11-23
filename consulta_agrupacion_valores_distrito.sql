DROP TABLE IF EXISTS sum_distritos_15_agosto;

CREATE TABLE sum_distritos_15_agosto AS
    SELECT 
        destino, 
        renta, 
		provincia_destino,
        SUM(viajes) AS total_poblacion
    FROM 
        viajes_distritos_15_agosto
    GROUP BY 
        destino, renta, provincia_destino;