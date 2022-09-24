DROP DATABASE IF EXISTS SpotifyClone;
  CREATE DATABASE IF NOT EXISTS SpotifyClone;
  CREATE TABLE SpotifyClone.plans(
	id_plan INT PRIMARY KEY,
	name_plan VARCHAR(100) NOT NULL,
	price INT NOT NULL
  ) engine = InnoDB;

INSERT INTO SpotifyClone.plans(id_plan, name_plan, price)
VALUES
    (1 , 'gratuito', 0.00),
    (2, 'familiar', 7.99),
    (3, 'universitário', 5.99),
    (4, 'pessoal', 6.99);

CREATE TABLE SpotifyClone.artist(
	id_artist INT PRIMARY KEY,
	name_artist VARCHAR(100) NOT NULL
) engine = InnoDB;

  INSERT INTO SpotifyClone.artist(id_artist, name_artist)
  VALUES
    (1, 'Beyoncé'),
    (2, 'Queen'),
    (3, 'Elis Regina'),
    (4, 'Baco Exu do Blues'),
    (5, 'Blind Guardian'),
    (6, 'Nina Simone');
    
CREATE TABLE SpotifyClone.album(
	id_album INT PRIMARY KEY,
    name_album VARCHAR(100) NOT NULL,
    release_year YEAR NOT NULL,
    id_artist INT NOT NULL,
    FOREIGN KEY (id_artist) REFERENCES SpotifyClone.artist(id_artist)
) engine = InnoDB;
    
INSERT INTO SpotifyClone.album(id_album, name_album, release_year, id_artist)
VALUES
	(1, 'Renaissance', 2022, 1),
	(2, 'Jazz', 1978, 2),
    (3, 'Hot Space', 1982, 2),
    (4, 'Falso Brilhante', 1998, 3),
    (5, 'Vento de Maio', 2001, 3),
    (6, 'QVVJFA?', 2003, 4),
    (7, 'Somewhere Far Beyond', 2007, 5),
    (8, 'I Put A Spell On You', 2012, 6);
    
CREATE TABLE SpotifyClone.song(
	id_song INT PRIMARY KEY,
	name_song VARCHAR(100) NOT NULL,
    id_album INT,
	duration_seconds INT NOT NULL,
    FOREIGN KEY (id_album) REFERENCES SpotifyClone.album(id_album)
) engine = InnoDB;

INSERT INTO SpotifyClone.song(id_song, name_song, duration_seconds, id_album)
  VALUES
    (1, 'BREAK MY SOUL', 279, 1),
    (2, 'VIRGO’S GROOVE', 369, 1),
    (3, 'ALIEN SUPERSTAR', 116, 1),
    (4, 'Don’t Stop Me Now', 203, 2),
    (5, 'Under Pressure', 152, 3),
    (6, 'Como Nossos Pais', 105, 4),
    (7, 'O Medo de Amar é o Medo de Ser Livre', 207, 5),
    (8, 'Samba em Paris', 267, 6),
    (9, 'The Bard’s Song', 244, 7),
    (10, 'Feeling Good', 100, 8);

CREATE TABLE SpotifyClone.users(
	id_user INT PRIMARY KEY,
	name_user VARCHAR(100) NOT NULL,
    year_user INT NOT NULL,
    id_plan INT NOT NULL,
	date_plans DATE NOT NULL,
    FOREIGN KEY (id_plan) REFERENCES SpotifyClone.plans(id_plan)
) engine = InnoDB;
    
INSERT INTO SpotifyClone.users(id_user, name_user, year_user, id_plan, date_plans)
  VALUES
    (1, 'Barbara Liskov', 82, 1, '2019-10-20'),
    (2, 'Robert Cecil Martin', 58, 1, '2017-01-06'),
    (3, 'Ada Lovelace', 37, 2, '2017-12-30'),
    (4, 'Martin Fowler', 46, 2, '2017-01-17'),
    (5, 'Sandi Metz', 58, 2, '2018-04-29'),
    (6, 'Paulo Freire', 19, 3, '2018-02-14'),
    (7, 'Bell Hooks', 26, 3, '2018-01-05'),
    (8, 'Christopher Alexander', 85, 4, '2019-06-05'),
    (9, 'Judith Butler', 45, 4, '2020-05-13'),
    (10, 'Jorge Amado', 58, 4, '2017-02-17');
    
CREATE TABLE SpotifyClone.reproduction(
	id_user INT NOT NULL,
	id_song INT NOT NULL,
    date_reproduction DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY (id_user, id_song),  
    FOREIGN KEY (id_user) REFERENCES SpotifyClone.users(id_user),
    FOREIGN KEY (id_song) REFERENCES SpotifyClone.song(id_song)
) engine = InnoDB;

INSERT INTO SpotifyClone.reproduction(id_user, id_song, date_reproduction)
VALUES
	(1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');

CREATE TABLE SpotifyClone.following(
    id_user INT NOT NULL,
	id_artist INT NOT NULL,
    CONSTRAINT PRIMARY KEY (id_user, id_artist),
    FOREIGN KEY (id_user) REFERENCES SpotifyClone.users(id_user),
    FOREIGN KEY (id_artist) REFERENCES SpotifyClone.artist(id_artist)
) engine = InnoDB;

INSERT INTO SpotifyClone.following(id_user, id_artist)
VALUES
	(1, 1), (1, 2), (1, 3),
    (2, 1), (2, 3),
    (3, 2),
    (4, 4),
    (5, 5), (5, 6),
    (6, 6), (6, 1),
    (7, 6),
    -- (8, NULL),
    (9, 3),
    (10, 2);
    