--Scrivere una query che restituisca i titoli degli album di Franco Battiato;
SELECT 
b.Nome AS [Autore]
,a.Titolo AS [Titolo Album]
FROM Band b
INNER JOIN Album a
ON a.BandID = b.ID
WHERE b.Nome = 'Franco Battiato'


--Selezionare tutti gli album editi dalla casa editrice nell’anno specificato;
SELECT * FROM Album
WHERE AnnoUscita = '2000'
ORDER BY CasaDiscografica

--Scrivere una query che restituisca tutti i titoli delle canzoni dei U2 appartenenti ad album pubblicati prima del 1990;
SELECT 
b.Nome AS [Band]
,a.Titolo AS [Titolo Album]
,a.AnnoUscita
,br.Titolo AS [Brano]
FROM Band b
 INNER JOIN Album a
 ON b.ID = a.BandID
	INNER JOIN AlbumBrano ab
	ON a.ID = ab.AlbumID
		INNER JOIN	Brano br
		ON br.ID = ab.BranoID
WHERE b.Nome = 'U2' AND a.AnnoUscita < 1990

--Individuare tutti gli album in cui è contenuta la canzone “Imagine”;
SELECT 
a.Titolo AS [Titolo Album]
,br.ID
FROM Album a
INNER JOIN AlbumBrano ab
ON a.ID = ab.AlbumID
	INNER JOIN	Brano br
	ON br.ID = ab.BranoID
WHERE br.Titolo = 'Imagine'

--Restituire il numero totale di canzoni eseguite dai Pooh;
SELECT
	COUNT (*) AS [Numero Canzoni]
FROM Band b
 INNER JOIN Album a
 ON b.ID = a.BandID
	INNER JOIN AlbumBrano ab
	ON a.ID = ab.AlbumID
		INNER JOIN	Brano br
		ON br.ID = ab.BranoID
WHERE b.Nome = 'Pooh'


--Contare per ogni album, la somma dei minuti dei brani contenuti
SELECT 
a.Titolo AS [Titolo Album]
,SUM(br.Durata) AS [Totale]
FROM Album a
INNER JOIN AlbumBrano ab
ON a.ID = ab.AlbumID
	INNER JOIN Brano br
	ON ab.BranoID = br.ID
GROUP BY a.Titolo


