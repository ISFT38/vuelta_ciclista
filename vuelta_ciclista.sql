-- CREATE USER vuelta_ciclista PASSWORD 'secreto';
-- CREATE DATABASE vuelta_ciclista OWNER vuelta_ciclista;
-- \connect vuelta_ciclista

BEGIN;

CREATE TABLE nacionalidades (
	nacionalidad_id  INTEGER PRIMARY KEY,
	nacionalidad     VARCHAR(128)
);

CREATE TABLE ciclistas (
	ciclista_id		SERIAL PRIMARY KEY,
	nombre			VARCHAR(256),
	nacionalidad_id INTEGER REFERENCES nacionalidades,
	f_nacimiento    DATE
);

CREATE TABLE equipos (
	equipo_id		SERIAL PRIMARY KEY,
	nombre          VARCHAR(256),
	nacionalidad_id INTEGER REFERENCES nacionalidades,
	director        VARCHAR(256)
);

CREATE TABLE pruebas (
	prueba_id		SERIAL PRIMARY KEY,
	nombre			VARCHAR(256) UNIQUE,
	edicion         INTEGER,
	etapas			INTEGER,
	kilometros		REAL,
	ganador         INTEGER REFERENCES ciclistas(ciclista_id)
);

CREATE TABLE contratos (
	ciclista_id		INTEGER REFERENCES ciclistas,
	equipo_id		INTEGER REFERENCES equipos,
	f_inicio		DATE NOT NULL,
	f_fin			DATE
);

CREATE TABLE equipos_pruebas (
	equipo_id		INTEGER REFERENCES equipos,
	prueba_id		INTEGER REFERENCES pruebas,
	puesto			INTEGER,
	UNIQUE (equipo_id, prueba_id)
);

COMMIT;