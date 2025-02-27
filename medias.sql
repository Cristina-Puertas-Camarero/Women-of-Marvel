USE women_of_marvel;

-- Vamos a sacar las medias para obtener las últimas conclusiones.
-- Con las tablas que hemos creado a través de los joins generados.

SELECT 
    AVG(Intelligence) AS media_inteligencia,
    AVG(Strength) AS media_fortaleza,
    AVG(Speed) AS media_velocidad,
    AVG(Durability) AS media_vida,
    AVG(Power) AS media_poder,
    AVG(Combat) AS media_combate,
    AVG(Total) AS media_total,
    AVG(ventas_totales_woman) AS media_ventas_mujeres,
    AVG(ventas_totales_man) AS media_ventas_hombres
FROM tabla_comparativa_hombres_buenos;

SELECT 
    AVG(Intelligence) AS media_inteligencia,
    AVG(Strength) AS media_fortaleza,
    AVG(Speed) AS media_velocidad,
    AVG(Durability) AS media_vida,
    AVG(Power) AS media_poder,
    AVG(Combat) AS media_combate,
    AVG(Total) AS media_total,
    AVG(ventas_totales_woman) AS media_ventas_mujeres,
    AVG(ventas_totales_man) AS media_ventas_hombres
FROM tabla_comparativa_hombres_maloss;

SELECT 
    AVG(Intelligence) AS media_inteligencia,
    AVG(Strength) AS media_fortaleza,
    AVG(Speed) AS media_velocidad,
    AVG(Durability) AS media_vida,
    AVG(Power) AS media_poder,
    AVG(Combat) AS media_combate,
    AVG(Total) AS media_total,
    AVG(ventas_totales_woman) AS media_ventas_mujeres,
    AVG(ventas_totales_man) AS media_ventas_hombres
FROM tabla_comparativa_mujeres_buenos;

SELECT 
    AVG(Intelligence) AS media_inteligencia,
    AVG(Strength) AS media_fortaleza,
    AVG(Speed) AS media_velocidad,
    AVG(Durability) AS media_vida,
    AVG(Power) AS media_poder,
    AVG(Combat) AS media_combate,
    AVG(Total) AS media_total,
    AVG(ventas_totales_woman) AS media_ventas_mujeres,
    AVG(ventas_totales_man) AS media_ventas_hombres
FROM tabla_comparativa_mujeres_malas;