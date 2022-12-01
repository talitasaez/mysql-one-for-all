SELECT DISTINCT u.nome_usuario AS usuario,
COUNT(h.id_musica) AS qt_de_musicas_ouvidas,
ROUND(SUM(m.duracao_segundos / 60), 2) AS total_minutos
FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.historico_reproducoes AS h
ON u.id_usuario = h.id_usuario
INNER JOIN SpotifyClone.musicas AS m
ON h.id_musica = m.id_musica
GROUP BY usuario
ORDER BY usuario;