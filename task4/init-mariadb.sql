-- Archivo init.sql

-- Crea una tabla de ejemplo
CREATE TABLE IF NOT EXISTS devops (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
);

-- Inserta algunos datos de ejemplo
INSERT INTO devops (name) VALUES
('Pablo'),
('Lucho'),
('Flor'),
('Juan');
