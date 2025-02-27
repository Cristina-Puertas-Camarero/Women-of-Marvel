USE women_of_marvel;

SELECT *
FROM nombres_genero;

SELECT *
FROM popularidad;

SELECT *
FROM nombre_poder_total;

-----------------------------------------------
-- visualizaciones conjuntas.

SELECT * 
FROM nombres_genero
WHERE Name NOT IN (SELECT name FROM nombre_poder_total);

SELECT Woman 
FROM popularidad
WHERE Woman NOT IN (SELECT name FROM nombre_poder_total);

-------------------------------------------------
-- Visualizaciones de tablas creadas en sql

SELECT *
FROM tabla_comparativa_hombres_buenos;

SELECT *
FROM tabla_comparativa_hombres_maloss;

SELECT *
FROM tabla_comparativa_mujeres_buenos;

SELECT *
FROM tabla_comparativa_mujeres_malas
