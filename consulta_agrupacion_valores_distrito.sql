DROP TABLE IF EXISTS sum_distritos_15_enero;

CREATE TABLE sum_distritos_15_enero AS
    SELECT 
        destino, 
        hora, 
	municipio_destino,
	gau_destino,
        SUM(viajes) AS total_poblacion
    FROM 
        viajes_distritos_15_enero
    GROUP BY 
        destino, hora, municipio_destino, gau_destino;
