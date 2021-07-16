-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE AlbumPerAutore
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

END
GO
