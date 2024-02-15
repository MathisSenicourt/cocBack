-- Création de la base de données
CREATE DATABASE IF NOT EXISTS coc;

-- Utilisation de la base de données
USE coc;

-- Suppression des tables si elles existent
DROP TABLE IF EXISTS worker_list;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS logins;

-- Création de la table logins
CREATE TABLE logins
(
    user_login VARCHAR(255) PRIMARY KEY,
    password   VARCHAR(255)
);

-- Insertion des valeurs dans la table logins
INSERT INTO logins
VALUES ('XtremeNeox', 'MDPXtreme');

-- Création de la table accounts
CREATE TABLE IF NOT EXISTS accounts
(
    account_id VARCHAR(255) PRIMARY KEY,
    user_login VARCHAR(255),
    FOREIGN KEY (user_login) REFERENCES logins (user_login)
);

-- Insertion des valeurs dans la table accounts
INSERT INTO accounts
VALUES ('Xtreme', 'XtremeNeox'),
       ('X/treme', 'XtremeNeox'),
       ('X.treme', 'XtremeNeox'),
       ('X:treme', 'XtremeNeox'),
       ('X-treme', 'XtremeNeox');

-- Création de la table worker_list
CREATE TABLE IF NOT EXISTS worker_list
(
    worker_id    VARCHAR(255) PRIMARY KEY,
    account_id   VARCHAR(255),
    worker       ENUM ('worker_main', 'lab_main', 'animals_main', 'worker_builder', 'lab_builder'),
    work_end     DATETIME,
    work_context VARCHAR(255),
    FOREIGN KEY (account_id) REFERENCES accounts (account_id)
);

-- Insertion des valeurs dans la table worker_list
INSERT INTO worker_list (worker_id, account_id, worker, work_end, work_context)
VALUES
    -- Xtreme
    ('1WM1', 'Xtreme', 'worker_main', NOW(), 'premiere insertion'),
    ('1WM2', 'Xtreme', 'worker_main', NOW(), 'premiere insertion'),
    ('1WM3', 'Xtreme', 'worker_main', NOW(), 'premiere insertion'),
    ('1WM4', 'Xtreme', 'worker_main', NOW(), 'premiere insertion'),
    ('1WM5', 'Xtreme', 'worker_main', NOW(), 'premiere insertion'),
    ('1WM6', 'Xtreme', 'worker_main', NOW(), 'premiere insertion'),
    ('1LM', 'Xtreme', 'lab_main', NOW(), 'premiere insertion'),
    ('1AM', 'Xtreme', 'animals_main', NOW(), 'premiere insertion'),
    ('1WB1', 'Xtreme', 'worker_builder', NOW(), 'premiere insertion'),
    ('1WB2', 'Xtreme', 'worker_builder', NOW(), 'premiere insertion'),
    ('1LB', 'Xtreme', 'lab_builder', NOW(), 'premiere insertion'),

    -- X/treme
    ('2WM1', 'X/treme', 'worker_main', NOW(), 'premiere insertion'),
    ('2WM2', 'X/treme', 'worker_main', NOW(), 'premiere insertion'),
    ('2WM3', 'X/treme', 'worker_main', NOW(), 'premiere insertion'),
    ('2WM4', 'X/treme', 'worker_main', NOW(), 'premiere insertion'),
    ('2WM5', 'X/treme', 'worker_main', NOW(), 'premiere insertion'),
    ('2LM', 'X/treme', 'lab_main', NOW(), 'premiere insertion'),
    ('2WB1', 'X/treme', 'worker_builder', NOW(), 'premiere insertion'),
    ('2WB2', 'X/treme', 'worker_builder', NOW(), 'premiere insertion'),
    ('2LB', 'X/treme', 'lab_builder', NOW(), 'premiere insertion'),

    -- X.treme
    ('3WM1', 'X.treme', 'worker_main', NOW(), 'premiere insertion'),
    ('3WM2', 'X.treme', 'worker_main', NOW(), 'premiere insertion'),
    ('3WM3', 'X.treme', 'worker_main', NOW(), 'premiere insertion'),
    ('3WM4', 'X.treme', 'worker_main', NOW(), 'premiere insertion'),
    ('3WM5', 'X.treme', 'worker_main', NOW(), 'premiere insertion'),
    ('3LM', 'X.treme', 'lab_main', NOW(), 'premiere insertion'),
    ('3AM', 'X.treme', 'animals_main', NOW(), 'premiere insertion'),
    ('3WB1', 'X.treme', 'worker_builder', NOW(), 'premiere insertion'),
    ('3WB2', 'X.treme', 'worker_builder', NOW(), 'premiere insertion'),
    ('3LB', 'X.treme', 'lab_builder', NOW(), 'premiere insertion'),

    -- X:treme
    ('4WM1', 'X:treme', 'worker_main', NOW(), 'premiere insertion'),
    ('4WM2', 'X:treme', 'worker_main', NOW(), 'premiere insertion'),
    ('4WM3', 'X:treme', 'worker_main', NOW(), 'premiere insertion'),
    ('4WM4', 'X:treme', 'worker_main', NOW(), 'premiere insertion'),
    ('4WM5', 'X:treme', 'worker_main', NOW(), 'premiere insertion'),
    ('4LM', 'X:treme', 'lab_main', NOW(), 'premiere insertion'),
    ('4WB1', 'X:treme', 'worker_builder', NOW(), 'premiere insertion'),
    ('4WB2', 'X:treme', 'worker_builder', NOW(), 'premiere insertion'),
    ('4LB', 'X:treme', 'lab_builder', NOW(), 'premiere insertion'),

    -- X-treme
    ('5WM1', 'X-treme', 'worker_main', NOW(), 'premiere insertion'),
    ('5WM2', 'X-treme', 'worker_main', NOW(), 'premiere insertion'),
    ('5WM3', 'X-treme', 'worker_main', NOW(), 'premiere insertion'),
    ('5WM4', 'X-treme', 'worker_main', NOW(), 'premiere insertion'),
    ('5WM5', 'X-treme', 'worker_main', NOW(), 'premiere insertion'),
    ('5WM6', 'X-treme', 'worker_main', NOW(), 'premiere insertion'),
    ('5LM', 'X-treme', 'lab_main', NOW(), 'premiere insertion'),
    ('5WB1', 'X-treme', 'worker_builder', NOW(), 'premiere insertion'),
    ('5WB2', 'X-treme', 'worker_builder', NOW(), 'premiere insertion'),
    ('5LB', 'X-treme', 'lab_builder', NOW(), 'premiere insertion');
