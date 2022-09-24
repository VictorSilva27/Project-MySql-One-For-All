SELECT 
s.name_song AS cancao,
COUNT(re.id_song) AS reproducoes
FROM SpotifyClone.song s
INNER JOIN SpotifyClone.reproduction re ON s.id_song = re.id_song
GROUP BY s.name_song
ORDER BY COUNT(re.id_song) DESC, s.name_song ASC
LIMIT 2;