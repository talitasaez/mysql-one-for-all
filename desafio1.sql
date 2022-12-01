DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.usuarios(
id_usuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
nome_usuario VARCHAR(50) NOT NULL,
idade_usuario TINYINT NOT NULL
)engine = InnoDB;

INSERT INTO SpotifyClone.usuarios(nome_usuario, idade_usuario)
VALUES 
('Barbara Liskov', 82),
('Robert Cecil Martin', 58),
('Ada Lovelace', 37),
('Martin Fowler', 46),
('Sandi Metz', 58),
('Paulo Freire', 19),
('Bell Hooks', 26),
('Christopher Alexander', 85),
('Judith Butler', 45),
('Jorge Amado', 58);

CREATE TABLE SpotifyClone.plano(
id_plano INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
tipo_plano CHAR(50) NOT NULL,
valor_plano DECIMAL(6,2)
)engine = InnoDB;

INSERT INTO SpotifyClone.plano(tipo_plano, valor_plano) 
VALUES 
('gratuito', '0.00'),
('familiar', '7.99'),
('universitário', '5.99'),
('pessoal', '6.99');

CREATE TABLE SpotifyClone.artistas(
id_artista INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
nome_artista VARCHAR(200) NOT NULL
)engine = InnoDB;

INSERT INTO SpotifyClone.artistas(nome_artista) 
VALUES 
('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');


CREATE TABLE SpotifyClone.albuns(
id_album INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
nome_album VARCHAR(250) NOT NULL,
id_artista INT NOT NULL,
FOREIGN KEY (id_artista) REFERENCES artistas(id_artista)
)engine = InnoDB;

INSERT INTO SpotifyClone.albuns(nome_album, id_artista) 
VALUES 
('Renaissance', '1'),
('Jazz', '2'),
('Hot Space', '2'),
('Falso Brilhante', '3'),
('Vento de Maio', '3'),
('QVVJFA?', '4'),
('Somewhere Far Beyond', '5'),
('I Put A Spell On You', '6');



CREATE TABLE SpotifyClone.artistas_seguidos(
id_usuario INTEGER,
id_artista INTEGER,
CONSTRAINT PRIMARY KEY (id_usuario, id_artista),
FOREIGN KEY (id_usuario) REFERENCES SpotifyClone.usuarios(id_usuario),
FOREIGN KEY (id_artista) REFERENCES SpotifyClone.artistas(id_artista)
)engine = InnoDB;

INSERT INTO SpotifyClone.artistas_seguidos(id_usuario, id_artista) 
VALUES 
('1', '1'),
('1', '2'),
('1', '3'),
('2', '1'),
('2', '3'),
('3', '2'),
('4', '4'),
('5', '5'),
('5', '6'),
('6', '6'),
('6', '1'),
('7', '6'),
('9', '3'),
('10', '2');


CREATE TABLE SpotifyClone.musicas(
id_musica INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome_musica VARCHAR(200) NOT NULL,
duracao_segundos DECIMAL NOT NULL,
ano_lancamento YEAR NOT NULL,
id_album INT NOT NULL,
FOREIGN KEY (id_album) REFERENCES albuns(id_album)
)engine = InnoDB;

INSERT INTO SpotifyClone.musicas(nome_musica, duracao_segundos, ano_lancamento, id_album) 
VALUES 
("BREAK MY SOUL", 279, 2022, 1),
("VIRGO’S GROOVE", 369, 2022, 1),
("ALIEN SUPERSTAR", 116, 2022, 1),
("Don’t Stop Me Now", 203, 1978, 2),
("Under Pressure",	152, 1982, 3),
("Como Nossos Pais", 105, 1998, 4),
("O Medo de Amar é o Medo de Ser Livre", 207, 2001, 5),
("Samba em Paris", 267,	2003, 6),
("The Bard’s Song",	24,	2007, 7),
("Feeling Good", 100, 2012, 8);



CREATE TABLE SpotifyClone.historico_reproducoes(
data_reproducao DATETIME,
id_musica INT NOT NULL,
id_usuario INT NOT NULL,
CONSTRAINT PRIMARY KEY (id_musica, id_usuario),
FOREIGN KEY (id_musica) REFERENCES SpotifyClone.musicas(id_musica),
FOREIGN KEY (id_usuario) REFERENCES SpotifyClone.usuarios(id_usuario)
)engine = InnoDB;

INSERT INTO SpotifyClone.historico_reproducoes(id_usuario, id_musica,data_reproducao) 
VALUES 
( 1, 8, '2022-02-28 10:45:55'),
( 1, 2, '2020-05-02 05:30:35'),
( 1, 10, '2020-03-06 11:22:33'),
( 2, 10, '2022-08-05 08:05:17'),
( 2, 7, '2020-01-02 07:40:33'),
( 3, 10, '2020-11-13 16:55:13'),
( 3, 2, '2020-12-05 18:38:30'),
( 4, 8, '2021-08-15 17:10:10'),
( 5, 8, '2022-01-09 01:44:33'),
( 5, 5, '2020-08-06 15:23:43'),
( 6, 7, '2017-01-24 00:31:17'),
( 6, 1, '2017-10-12 12:35:20'),
( 7, 4, '2011-12-15 22:30:49'),
( 8, 4, '2012-03-17 14:56:41'),
( 9, 9, '2022-02-24 21:14:22'),
( 10, 3, '2015-12-13 08:30:22');