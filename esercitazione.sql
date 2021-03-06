USE [master]
GO
/****** Object:  Database [Esercitazione]    Script Date: 16/07/2021 14:59:17 ******/
CREATE DATABASE [Esercitazione]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Esercitazione', FILENAME = N'C:\Users\princ\Esercitazione.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Esercitazione_log', FILENAME = N'C:\Users\princ\Esercitazione_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Esercitazione] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Esercitazione].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Esercitazione] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Esercitazione] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Esercitazione] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Esercitazione] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Esercitazione] SET ARITHABORT OFF 
GO
ALTER DATABASE [Esercitazione] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Esercitazione] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Esercitazione] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Esercitazione] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Esercitazione] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Esercitazione] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Esercitazione] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Esercitazione] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Esercitazione] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Esercitazione] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Esercitazione] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Esercitazione] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Esercitazione] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Esercitazione] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Esercitazione] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Esercitazione] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Esercitazione] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Esercitazione] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Esercitazione] SET  MULTI_USER 
GO
ALTER DATABASE [Esercitazione] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Esercitazione] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Esercitazione] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Esercitazione] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Esercitazione] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Esercitazione] SET QUERY_STORE = OFF
GO
USE [Esercitazione]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Esercitazione]
GO
/****** Object:  Table [dbo].[Band]    Script Date: 16/07/2021 14:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Band](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](100) NOT NULL,
	[NumeroComponenti] [int] NOT NULL,
 CONSTRAINT [PK_Band] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 16/07/2021 14:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BandID] [int] NOT NULL,
	[Titolo] [nvarchar](100) NOT NULL,
	[AnnoUscita] [int] NOT NULL,
	[CasaDiscografica] [nvarchar](50) NOT NULL,
	[Genere] [nvarchar](20) NOT NULL,
	[SupportoDistribuzione] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Titolo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brano]    Script Date: 16/07/2021 14:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brano](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [nvarchar](100) NOT NULL,
	[Durata] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Brano] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumBrano]    Script Date: 16/07/2021 14:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumBrano](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BranoID] [int] NOT NULL,
	[AlbumID] [int] NOT NULL,
 CONSTRAINT [PK_AlbumBrano] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vista_albumcompleti]    Script Date: 16/07/2021 14:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Creare una view che mostri i dati completi dell’album, della band e dei brani contenuti in esso.

CREATE VIEW [dbo].[vista_albumcompleti] AS
SELECT 
b.Nome AS [Band]
,b.NumeroComponenti
,a.Titolo AS [Titolo Album]
,a.AnnoUscita
,a.CasaDiscografica
,a.Genere
,a.SupportoDistribuzione
,br.Titolo AS [Brano]
,br.Durata
FROM Band b
 INNER JOIN Album a
 ON b.ID = a.BandID
	INNER JOIN AlbumBrano ab
	ON a.ID = ab.AlbumID
		INNER JOIN	Brano br
		ON br.ID = ab.BranoID
GO
/****** Object:  UserDefinedFunction [dbo].[ufnFunzioneCalcoloPerGenere]    Script Date: 16/07/2021 14:59:17 ******/
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

CREATE FUNCTION [dbo].[ufnFunzioneCalcoloPerGenere]
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
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_Album] FOREIGN KEY([BandID])
REFERENCES [dbo].[Band] ([ID])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_Album]
GO
ALTER TABLE [dbo].[AlbumBrano]  WITH CHECK ADD  CONSTRAINT [FK_AlbumBrano_Album] FOREIGN KEY([AlbumID])
REFERENCES [dbo].[Album] ([ID])
GO
ALTER TABLE [dbo].[AlbumBrano] CHECK CONSTRAINT [FK_AlbumBrano_Album]
GO
ALTER TABLE [dbo].[AlbumBrano]  WITH CHECK ADD  CONSTRAINT [FK_AlbumBrano_Brano] FOREIGN KEY([BranoID])
REFERENCES [dbo].[Brano] ([ID])
GO
ALTER TABLE [dbo].[AlbumBrano] CHECK CONSTRAINT [FK_AlbumBrano_Brano]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [CK_Genere] CHECK  (([Genere]='Metal' OR [Genere]='Rock' OR [Genere]='Pop' OR [Genere]='Jazz' OR [Genere]='Classico'))
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [CK_Genere]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [CK_Supporto] CHECK  (([SupportoDistribuzione]='Streaming' OR [SupportoDistribuzione]='Vinile' OR [SupportoDistribuzione]='CD'))
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [CK_Supporto]
GO
/****** Object:  StoredProcedure [dbo].[AlbumPerAutore]    Script Date: 16/07/2021 14:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AlbumPerAutore]
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
GO
USE [master]
GO
ALTER DATABASE [Esercitazione] SET  READ_WRITE 
GO
