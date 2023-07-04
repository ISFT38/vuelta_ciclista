select * from nacionalidades

INSERT INTO nacionalidades(nacionalidad_id, nacionalidad) VALUES 
	(1, 'Argentina'),
	(2, 'Uruguaya');

INSERT INTO ciclistas(nombre, nacionalidad_id) VALUES
	('Juan Perez', 1),
	('Maria Gomez', 2);

INSERT INTO equipos(nombre, nacionalidad_id, director) VALUES
	('Rayo', 1, 'Mc Queen'),
	('Nube', 2, 'Mc Goo');

INSERT INTO pruebas(nombre, edicion, etapas, kilometros) VALUES
  ('Vuelta de Cordoba', 2023, 4, 320);

INSERT INTO contratos(ciclista_id, equipo_id, f_inicio) VALUES
  (1, 1, '2021-05-10'),
  (2, 2, '2022-02-22');
  
 INSERT INTO equipos_pruebas(equipo_id, prueba_id, puesto) VALUES
  (2, 1, 1),
  (1, 1, 2);

UPDATE pruebas SET ganador = (SELECT ciclista_id FROM ciclistas WHERE nombre = 'Maria Gomez')
  WHERE prueba_id = 1;

-- UPDATE pruebas SET ganador = 5
--   WHERE prueba_id = 1;
  
-- DELETE FROM ciclistas WHERE ciclista_id = 2;

-- DROP TABLE equipos_pruebas;
-- DROP TABLE contratos;
-- DROP TABLE pruebas;
-- DROP TABLE equipos;
-- DROP TABLE ciclistas;