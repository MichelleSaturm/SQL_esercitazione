--Creare una view che mostri i dati completi dell’album, della band e dei brani contenuti in esso.

CREATE VIEW vista_albumcompleti AS
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