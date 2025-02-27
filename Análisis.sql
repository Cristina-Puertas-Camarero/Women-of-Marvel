-- Análisis

-- 1. ¿Cual es el porcentaje de mujeres?
-- Número de Superhéroes

SELECT COUNT(*) AS total_héroes
FROM nombres_genero;

-- Número mujeres

SELECT COUNT(*) AS total_mujeres
FROM nombres_genero
WHERE Gender = 'Female';

-- Calcular porcentaje
SELECT (total_mujeres / total_individuos) * 100 AS porcentaje_mujeres
FROM (
    SELECT 
        (SELECT COUNT(*) FROM nombres_genero) AS total_individuos,
        (SELECT COUNT(*) FROM nombres_genero WHERE Gender = 'Female') AS total_mujeres
) AS counts;


-- 2 Comparativa entre el hombre más fuerte y la mujer más fuerte

-- Hombre más fuerte

-- Encontrar al super más fuerte
SELECT nombre_poder_total.name, nombres_genero.Gender, nombre_poder_total.Strength
FROM nombre_poder_total
JOIN nombres_genero ON nombre_poder_total.name = nombres_genero.Name
WHERE nombres_genero.Gender = 'Male'
ORDER BY nombre_poder_total.Strength DESC
LIMIT 1;

-- Encontrar a la SUperHeroína más fuerte

SELECT nombre_poder_total.name, nombres_genero.Gender, nombre_poder_total.Strength
FROM nombre_poder_total
JOIN nombres_genero ON nombre_poder_total.name = nombres_genero.Name
WHERE nombres_genero.Gender = 'Female'
ORDER BY nombre_poder_total.Strength DESC
LIMIT 1;

-- Ahora haremos lo contrario buscando a los menos fuertes
-- Encontrar al Superhéroe Hombre Menos Fuerte

SELECT nombre_poder_total.name, nombres_genero.Gender, nombre_poder_total.Strength
FROM nombre_poder_total
JOIN nombres_genero ON nombre_poder_total.name = nombres_genero.Name
WHERE nombres_genero.Gender = 'Male'
ORDER BY nombre_poder_total.Strength ASC
LIMIT 100;

-- Ahora con la superherína

SELECT nombre_poder_total.name, nombres_genero.Gender, nombre_poder_total.Strength
FROM nombre_poder_total
JOIN nombres_genero ON nombre_poder_total.name = nombres_genero.Name
WHERE nombres_genero.Gender = 'Female'
ORDER BY nombre_poder_total.Strength ASC
LIMIT 100;

-- 3 Porcentaje, 'buenos y malos' según el género.alter

-- Número de mujeres
SELECT COUNT(*) AS total_mujeres
FROM nombres_genero
WHERE Gender = 'Female';

-- Número total, mujeres ' Malas'

SELECT COUNT(*) AS total_mujeres_malas
FROM nombres_genero
JOIN nombre_poder_total ON nombres_genero.Name = nombre_poder_total.name
WHERE nombres_genero.Gender = 'Female' AND nombre_poder_total.Alignment = 'bad';

-- Calcular el porcentaje de mujeres 'Malas'

SELECT (total_mujeres_malas / total_mujeres) * 100 AS porcentaje_mujeres_malas
FROM (
    SELECT 
        (SELECT COUNT(*) FROM nombres_genero WHERE Gender = 'Female') AS total_mujeres,
        (SELECT COUNT(*) FROM nombres_genero
         JOIN nombre_poder_total ON nombres_genero.Name = nombre_poder_total.name
         WHERE nombres_genero.Gender = 'Female' AND nombre_poder_total.Alignment = 'bad') AS total_mujeres_malas
) AS counts;

-- Ahora con hombres

SELECT COUNT(*) AS total_hombres
FROM nombres_genero
WHERE Gender = 'Male';

SELECT COUNT(*) AS total_hombres_malos
FROM nombres_genero
JOIN nombre_poder_total ON nombres_genero.Name = nombre_poder_total.name
WHERE nombres_genero.Gender = 'Male' AND nombre_poder_total.Alignment = 'bad';

SELECT (total_hombres_malos / total_hombres) * 100 AS porcentaje_hombres_malos
FROM (
    SELECT 
        (SELECT COUNT(*) FROM nombres_genero WHERE Gender = 'Male') AS total_hombres,
        (SELECT COUNT(*) FROM nombres_genero
         JOIN nombre_poder_total ON nombres_genero.Name = nombre_poder_total.name
         WHERE nombres_genero.Gender = 'Male' AND nombre_poder_total.Alignment = 'bad') AS total_hombres_malos
) AS counts;


-- 4 Hablamos de ventas, que porcentaje hay de mujeres respecto a hombres...alter

-- 

SELECT COUNT(*) AS total_superhéroes
FROM (
    SELECT Woman AS name, ventas_totales_woman AS ventas FROM popularidad
    UNION ALL
    SELECT men_m AS name, ventas_totales_man AS ventas FROM popularidad
    ORDER BY ventas DESC
    LIMIT 10
    ) AS top_vendidos;

SELECT Woman, ventas_totales_woman
FROM popularidad
ORDER BY ventas_totales_woman DESC
LIMIT 10; 

SELECT men_m, ventas_totales_man
FROM popularidad
ORDER BY ventas_totales_man DESC
LIMIT 10;

-- Calculamos el porcentaje

SELECT (total_mujeres / total_superhéroes) * 100 AS porcentaje_mujeres
FROM (
    SELECT 
        (SELECT COUNT(*) 
         FROM (
             SELECT Woman AS name, ventas_totales_woman AS ventas FROM popularidad
             UNION ALL
             SELECT men_m AS name, ventas_totales_man AS ventas FROM popularidad
             ORDER BY ventas DESC
             LIMIT 10
         ) AS sub1) AS total_superhéroes,
        (SELECT COUNT(*) 
         FROM (
             SELECT Woman AS name, ventas_totales_woman AS ventas FROM popularidad
             UNION ALL
             SELECT men_m AS name, ventas_totales_man AS ventas FROM popularidad
             ORDER BY ventas DESC
             LIMIT 10
         ) AS sub2
         WHERE name IN (SELECT Woman FROM popularidad)) AS total_mujeres
) AS counts;



-- 5 Encontremos al top five  de superhéroe `'buenos' hombre y al top ten superherína mujer y comparémolos.

SELECT nombre_poder_total.name, nombres_genero.Gender, nombre_poder_total.Total
FROM nombre_poder_total
JOIN nombres_genero ON nombre_poder_total.name = nombres_genero.Name
WHERE nombres_genero.Gender = 'Male' AND nombre_poder_total.Alignment = 'good'
ORDER BY nombre_poder_total.Total DESC
LIMIT 20;

SELECT nombre_poder_total.name, nombres_genero.Gender, nombre_poder_total.Total
FROM nombre_poder_total
JOIN nombres_genero ON nombre_poder_total.name = nombres_genero.Name
WHERE nombres_genero.Gender = 'Female' AND nombre_poder_total.Alignment = 'good'
ORDER BY nombre_poder_total.Total DESC
LIMIT 20;

-- Pasamos a los villanos

SELECT nombre_poder_total.name, nombres_genero.Gender, nombre_poder_total.Total
FROM nombre_poder_total
JOIN nombres_genero ON nombre_poder_total.name = nombres_genero.Name
WHERE nombres_genero.Gender = 'Male' AND nombre_poder_total.Alignment = 'bad'
ORDER BY nombre_poder_total.Total DESC
LIMIT 20;

SELECT nombre_poder_total.name, nombres_genero.Gender, nombre_poder_total.Total
FROM nombre_poder_total
JOIN nombres_genero ON nombre_poder_total.name = nombres_genero.Name
WHERE nombres_genero.Gender = 'Female' AND nombre_poder_total.Alignment = 'bad'
ORDER BY nombre_poder_total.Total DESC
LIMIT 20;

-- Ahora crearemos una tabla pra poder relacionarlos.

SELECT *
FROM nombre_poder_total
WHERE name IN ('thor','iron_man''silver_surfer','vision','hercules','hulk','jean_grey','phoenix','thor_girl','marvel_girl','she_hulk');

SELECT nombre_poder_total.*, nombres_genero.Gender, popularidad.ventas_totales_woman, popularidad.ventas_totales_man
FROM nombre_poder_total
JOIN nombres_genero ON nombre_poder_total.name = nombres_genero.Name
LEFT JOIN popularidad ON nombre_poder_total.name = popularidad.Woman OR nombre_poder_total.name = popularidad.men_m
WHERE nombre_poder_total.name IN ('thor','ironman''silver_surfer','vision','hercules','hulk');

SELECT nombre_poder_total.*, nombres_genero.Gender, popularidad.ventas_totales_woman, popularidad.ventas_totales_man
FROM nombre_poder_total
JOIN nombres_genero ON nombre_poder_total.name = nombres_genero.Name
LEFT JOIN popularidad ON nombre_poder_total.name = popularidad.Woman OR nombre_poder_total.name = popularidad.men_m
WHERE nombre_poder_total.name IN ('jean_grey','phoenix','thor_girl','marvel_girl','she_hulk');

-- Ahora obtendremos resultados de los villanos

SELECT nombre_poder_total.*, nombres_genero.Gender, popularidad.ventas_totales_woman, popularidad.ventas_totales_man
FROM nombre_poder_total
JOIN nombres_genero ON nombre_poder_total.name = nombres_genero.Name
LEFT JOIN popularidad ON nombre_poder_total.name = popularidad.Woman OR nombre_poder_total.name = popularidad.men_m
WHERE nombre_poder_total.name IN ('frenzy','callisto','mystique','scarlet_witch','goblin_queen');

SELECT nombre_poder_total.*, nombres_genero.Gender, popularidad.ventas_totales_woman, popularidad.ventas_totales_man
FROM nombre_poder_total
JOIN nombres_genero ON nombre_poder_total.name = nombres_genero.Name
LEFT JOIN popularidad ON nombre_poder_total.name = popularidad.Woman OR nombre_poder_total.name = popularidad.men_m
WHERE nombre_poder_total.name IN ('galactus','dormamu','doomsday','thanos','ultron');
