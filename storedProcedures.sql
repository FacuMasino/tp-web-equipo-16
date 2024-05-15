USE CATALOGO_P3_DB
GO

-- Procedimiento almacenado para listar articulos
CREATE OR ALTER PROCEDURE SP_List_Articles
AS
BEGIN
	SELECT Id, Codigo, Nombre, Descripcion, IdMarca, IdCategoria, Precio
	FROM Articulos
END
GO
-- Test
EXEC SP_List_Articles