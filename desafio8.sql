SELECT 
Ar.nome_artista AS artista,
Al.nome_album AS album
FROM SpotifyClone.artistas AS Ar
INNER JOIN SpotifyClone.albuns AS Al
ON Ar.id_artista = Al.id_artista
WHERE Ar.nome_artista = "Elis Regina"
ORDER BY album;