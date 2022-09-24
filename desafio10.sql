SELECT
s.name_song AS nome,
COUNT(re.id_song) AS reproducoes
FROM SpotifyClone.song s
INNER JOIN SpotifyClone.reproduction re ON s.id_song = re.id_song
INNER JOIN SpotifyClone.users u ON re.id_user = u.id_user
WHERE u.id_plan IN (1, 4)
GROUP BY s.name_song
ORDER BY s.name_song ASC;