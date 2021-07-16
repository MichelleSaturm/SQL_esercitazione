
--BAND - CREA TABELLA
CREATE TABLE Band (
ID int IDENTITY (1,1) NOT NULL
,Nome nvarchar (100) NOT NULL
,NumeroComponenti int NOT NULL
,CONSTRAINT PK_Band PRIMARY KEY (ID)
)

--ALBUM - CREA TABELLA
CREATE TABLE Album (
ID int IDENTITY (1,1) NOT NULL
,BandID int NOT NULL
,Titolo nvarchar (100) NOT NULL UNIQUE
,AnnoUscita int NOT NULL
,CasaDiscografica nvarchar(50) NOT NULL
,Genere nvarchar(20) NOT NULL
,SupportoDistribuzione varchar(20) NOT NULL
,CONSTRAINT PK_Album PRIMARY KEY (ID)
,CONSTRAINT FK_Album FOREIGN KEY (BandID) REFERENCES Band(ID)
,CONSTRAINT CK_Genere CHECK (Genere IN ('Classico', 'Jazz', 'Pop', 'Rock', 'Metal'))
,CONSTRAINT CK_Supporto CHECK (SupportoDistribuzione IN ('CD', 'Vinile', 'Streaming'))
)

--BRANO - CREA TABELLA
CREATE TABLE Brano (
ID int IDENTITY (1,1) NOT NULL
,Titolo nvarchar (100) NOT NULL
,Durata decimal(18,2) NOT NULL
,CONSTRAINT PK_Brano PRIMARY KEY (ID)
)

-- ALBUMBRANO - CREA BRIDGE TABLE
CREATE TABLE AlbumBrano (
ID int IDENTITY (1,1) NOT NULL
,BranoID int NOT NULL
,AlbumID int NOT NULL
,CONSTRAINT PK_AlbumBrano PRIMARY KEY (ID)
,CONSTRAINT FK_AlbumBrano_Album FOREIGN KEY(AlbumID) REFERENCES Album(ID)
,CONSTRAINT FK_AlbumBrano_Brano FOREIGN KEY(BranoID) REFERENCES Brano(ID),
)
