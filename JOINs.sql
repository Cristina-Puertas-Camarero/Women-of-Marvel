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

-- Calcular el porcentaje de mujeres 'Malas'

SELECT (total_mujeres_malas / total_mujeres) * 100 AS porcentaje_mujeres_malas
FROM (
    SELECT 
        (SELECT COUNT(*) FROM nombres_genero WHERE Gender = 'Female') AS total_mujeres,
        (SELECT COUNT(*) FROM nombres_genero
         JOIN nombre_poder_total ON nombres_genero.Name = nombre_poder_total.name
         WHERE nombres_genero.Gender = 'Female' AND nombre_poder_total.Alignment = 'bad') AS total_mujeres_malas
) AS counts;

SELECT COUNT(*) AS total_hombres_malos
FROM nombres_genero
JOIN nombre_poder_total ON nombres_genero.Name = nombre_poder_total.name
WHERE nombres_genero.Gender = 'Male' AND nombre_poder_total.Alignment = 'bad';



