-- Archivo init.sql

-- Crea una tabla de ejemplo
CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    email VARCHAR(100)
);

-- Inserta algunos datos de ejemplo
INSERT INTO usuarios (nombre, email) VALUES
    ('Usuario1', 'usuario1@example.com'),
    ('Usuario2', 'usuario2@example.com');
