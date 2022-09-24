SELECT 
ar.name_artist AS artista,
al.name_album AS album
FROM SpotifyClone.artist ar
INNER JOIN SpotifyClone.album al ON ar.id_artist = al.id_artist
WHERE ar.name_artist = 'Elis Regina'
GROUP BY ar.name_artist, al.name_album
ORDER BY ar.name_artist;