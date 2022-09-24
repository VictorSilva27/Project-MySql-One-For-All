SELECT
u.name_user AS usuario,
IF(
MAX(YEAR(re.date_reproduction)) >= 2021,
'Usuário ativo',
'Usuário inativo'
) AS 'status_usuario'
FROM SpotifyClone.users u
INNER JOIN SpotifyClone.reproduction re ON u.id_user = re.id_user
INNER JOIN SpotifyClone.song s ON re.id_song = s.id_song
GROUP BY u.name_user
ORDER BY u.name_user ASC;