-- Criação de utilizadores
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
CREATE USER 'geral'@'localhost' IDENTIFIED BY 'geral';

-- Definição de Privilégios
GRANT ALL ON TPBD.* TO 'admin'@'localhost';
GRANT SELECT ON TPBD.* TO 'geral'@'localhost';

