USE [Esercitazione]
GO
/****** Object:  StoredProcedure [dbo].[AlbumPerAutore]    Script Date: 16/07/2021 14:47:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[AlbumPerAutore]
	-- Add the parameters for the stored procedure here
	@nome nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT 
		b.Nome AS [Autore]
		,a.Titolo AS [Titolo Album]
		FROM Band b
		INNER JOIN Album a
		ON a.BandID = b.ID
		WHERE b.Nome = @nome
	RETURN 0;
END
