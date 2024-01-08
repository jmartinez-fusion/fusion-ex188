CREATE TABLE IF NOT EXISTS devops (
    id SERIAL PRIMARY KEY,
    name varchar(32) NOT NULL
);


INSERT INTO devops (name) VALUES
('Pablo'),
('Lucho'),
('Flor'),
('Juan');
