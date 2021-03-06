USE [Esercitazione]
GO
/****** Object:  UserDefinedFunction [dbo].[ufnFunzioneCalcoloPerGenere]    Script Date: 16/07/2021 14:50:45 ******/
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

ALTER FUNCTION [dbo].[ufnFunzioneCalcoloPerGenere]
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
