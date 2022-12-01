SELECT m.nome_musica AS cancao,
COUNT(h.id_musica) AS reproducoes
FROM SpotifyClone.musicas AS m
INNER JOIN SpotifyClone.historico_reproducoes AS h
ON m.id_musica = h.id_musica
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;