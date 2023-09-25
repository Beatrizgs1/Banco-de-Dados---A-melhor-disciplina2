-- Lista 2 de exercícios de banco de dados


-- 1. Listagem de Autores:

DELIMITER //

CREATE PROCEDURE sp_ListarAutores()
BEGIN
    SELECT * FROM Autor;
END//

DELIMITER ;



-- 2. Livros por Categoria:

DELIMITER //

CREATE PROCEDURE sp_LivrosPorCategoria(IN categoria_nome VARCHAR(100))
BEGIN
    SELECT Livro.Titulo, Autor.Nome, Autor.Sobrenome
    FROM Livro
    JOIN Autor_Livro ON Livro.Livro_ID = Autor_Livro.Livro_ID
    JOIN Autor ON Autor_Livro.Autor_ID = Autor.Autor_ID
    JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoria_nome;
END//

DELIMITER ;


-- 3. Contagem de Livros por Categoria:

DELIMITER //

CREATE PROCEDURE sp_ContarLivrosPorCategoria(IN categoria_nome VARCHAR(100), OUT total_livros INT)
BEGIN
    SELECT COUNT(*) INTO total_livros
    FROM Livro
    JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoria_nome;
END//

DELIMITER ;


-- 4. Verificação de Livros por Categoria:

DELIMITER //

CREATE PROCEDURE sp_VerificarLivrosCategoria(IN categoria_nome VARCHAR(100), OUT possui_livros BOOLEAN)
BEGIN
    DECLARE total INT;
    
    SELECT COUNT(*) INTO total
    FROM Livro
    JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoria_nome;
    
    IF total > 0 THEN
        SET possui_livros = TRUE;
    ELSE
        SET possui_livros = FALSE;
    END IF;
END//

DELIMITER ;


