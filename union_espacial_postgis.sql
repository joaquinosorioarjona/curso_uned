CREATE TABLE geom_sum_distritos_renta_15_enero AS
SELECT
	v.*,
	d.geom
FROM
	sum_distritos_15_enero v
JOIN
	distritos d
ON
	v.destino = d.id;
CREATE INDEX geom_sum_distritos_renta_15_enero_geom_idx ON geom_sum_distritos_renta_15_enero USING GIST(geom);