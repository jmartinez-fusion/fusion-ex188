CREATE TABLE IF NOT EXISTS test (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(32) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO test (name) VALUES
('Pablo'),
('Lucho'),
('Flor'),
('Juan');