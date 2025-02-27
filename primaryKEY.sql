
USE women_of_marvel;

ALTER TABLE nombre_poder_total
ADD PRIMARY KEY (name);

ALTER TABLE nombres_genero
ADD PRIMARY KEY (Name);

ALTER TABLE popularidad
ADD PRIMARY KEY (Woman);

------------------------------------

ALTER TABLE nombres_genero
ADD CONSTRAINT fk_nombre_poder_total
FOREIGN KEY (Name) REFERENCES nombre_poder_total(name);

ALTER TABLE popularidad
ADD CONSTRAINT fk_nombre_poder_total_popularidad
FOREIGN KEY (Woman) REFERENCES nombre_poder_total(name);

---------------------------------------