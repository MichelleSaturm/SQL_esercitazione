-- ================================================
-- Template generated from Template Explorer using:
-- Create Inline Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
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


--Scrivere una funzione utente che calcoli per ogni genere musicale quanti album sono inseriti in catalogo.

CREATE FUNCTION dbo.ufnFunzioneCalcoloPerGenere
(
	-- Add the parameters for the function here
	@genere nvarchar(20)
)
RETURNS TABLE 
AS
	RETURN 
	(SELECT 
COUNT (*) AS [Numero Canzoni] 
FROM album a
WHERE a.Genere = @genere
)


