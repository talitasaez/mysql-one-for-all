SELECT 
Ar.nome_artista AS artista,
Al.nome_album AS album,
COUNT(S.id_artista) AS seguidores
FROM SpotifyClone.artistas AS Ar
INNER JOIN SpotifyClone.albuns AS Al
ON Ar.id_artista = Al.id_artista
INNER JOIN SpotifyClone.artistas_seguidos AS S
ON S.id_artista = Ar.id_artista
GROUP BY artista, album
ORDER BY seguidores DESC, artista ASC, album ASC;