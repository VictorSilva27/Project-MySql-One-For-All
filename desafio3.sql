SELECT
u.name_user AS usuario,
COUNT(re.id_song) AS 'qt_de_musicas_ouvidas',
ROUND(SUM(s.duration_seconds / 60), 2) AS 'total_minutos'
FROM SpotifyClone.users u
INNER JOIN SpotifyClone.reproduction re ON u.id_user = re.id_user
INNER JOIN SpotifyClone.song s ON re.id_song = s.id_song
GROUP BY u.name_user
ORDER BY u.name_user ASC;