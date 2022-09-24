SELECT
count(re.id_song) AS 'quantidade_musicas_no_historico'
FROM SpotifyClone.users u
INNER JOIN SpotifyClone.reproduction re ON u.id_user = re.id_user
WHERE u.name_user = 'Barbara Liskov';