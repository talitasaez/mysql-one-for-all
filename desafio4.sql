SELECT u.nome_usuario AS usuario,
IF(YEAR(MAX(h.data_reproducao)) < 2021, 'Usuário inativo', 'Usuário ativo') AS status_usuario
FROM  SpotifyClone.usuarios AS u
INNER JOIN  SpotifyClone.historico_reproducoes AS h
ON u.id_usuario = h.id_usuario
GROUP BY usuario
ORDER BY usuario;