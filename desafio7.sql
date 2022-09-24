SELECT 
ar.name_artist AS artista,
al.name_album AS album,
COUNT(DISTINCT fl.id_user) AS seguidores
FROM SpotifyClone.artist ar
INNER JOIN SpotifyClone.album al ON ar.id_artist = al.id_artist
INNER JOIN SpotifyClone.following fl ON ar.id_artist = fl.id_artist
GROUP BY ar.name_artist, al.name_album
ORDER BY COUNT(DISTINCT fl.id_user) DESC;