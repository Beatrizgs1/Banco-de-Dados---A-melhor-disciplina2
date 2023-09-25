-- Lista 2 de exercícios de banco de dados


-- 1. Listagem de Autores:

DELIMITER //

CREATE PROCEDURE sp_ListarAutores()
BEGIN
    SELECT * FROM Autor;
END//

DELIMITER ;
