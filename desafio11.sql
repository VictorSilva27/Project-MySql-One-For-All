SELECT 
s.name_song AS nome_musica,
CASE
	WHEN s.name_song LIKE '%Bard%' THEN REPLACE(s.name_song, 'Bard', 'QA')
    WHEN s.name_song LIKE '%Amar%' THEN REPLACE(s.name_song, 'Amar', 'Code Review')
    WHEN s.name_song LIKE '%Pais%' THEN REPLACE(s.name_song, 'Pais', 'Pull Requests')
    WHEN s.name_song LIKE '%SOUL%' THEN REPLACE(s.name_song, 'SOUL', 'CODE')
    WHEN s.name_song LIKE '%SUPERSTAR%' THEN REPLACE(s.name_song, 'SUPERSTAR', 'SUPERDEV')
END AS novo_nome
FROM SpotifyClone.song s
ORDER BY novo_nome DESC
LIMIT 5;