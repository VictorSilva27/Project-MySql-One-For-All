SELECT
COUNT(DISTINCT s.id_song) AS cancoes,
COUNT(DISTINCT ar.id_artist) AS artistas,
COUNT(DISTINCT al.id_album) AS albuns
FROM SpotifyClone.artist ar
INNER JOIN SpotifyClone.album al ON ar.id_artist = al.id_artist
INNER JOIN SpotifyClone.song s ON al.id_album = s.id_album;