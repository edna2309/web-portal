CREATE DATABASE `dbnovosti_38` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE dbnovosti_38;

CREATE TABLE `korisnik` (
  `korisnikid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `uloga` varchar(45) NOT NULL,
  `aktivan` varchar(10) NOT NULL,
  PRIMARY KEY (`korisnikid`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `novost` (
  `novostid` int NOT NULL AUTO_INCREMENT,
  `datum` varchar(45) NOT NULL,
  `sadrzaj` text NOT NULL,
  `naslov` varchar(45) NOT NULL,
  `preview` text,
  PRIMARY KEY (`novostid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `komentar` (
  `komentarid` int NOT NULL AUTO_INCREMENT,
  `korisnikid` int NOT NULL,
  `novostid` int NOT NULL,
  `sadrzaj` text NOT NULL,
  `datum` varchar(45) NOT NULL,
  PRIMARY KEY (`komentarid`,`korisnikid`,`novostid`),
  KEY `novostid_idx` (`novostid`),
  KEY `korisnikid_idx` (`korisnikid`),
  CONSTRAINT `korisnikid` FOREIGN KEY (`korisnikid`) REFERENCES `korisnik` (`korisnikid`),
  CONSTRAINT `novostid` FOREIGN KEY (`novostid`) REFERENCES `novost` (`novostid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO korisnik (username, password, ime, prezime, email, uloga, aktivan) 
VALUES 
('admin', 'admin', 'admin', 'admin', 'admin@gmail.com', 'admin', 'aktivan'),
('urednik', 'urednik', 'urednik', 'urednik', 'urednik@gmail.com', 'urednik', 'aktivan');

INSERT INTO novost(sadrzaj, naslov, preview, datum) values ('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum at blandit eros. Praesent mauris ipsum, tempor non efficitur eget, ornare id nisl. Suspendisse ligula nulla, pretium vitae eros eget, sagittis imperdiet nisl. Aenean tristique eleifend arcu, sit amet pellentesque est venenatis at. Curabitur eu feugiat urna, imperdiet tincidunt enim. Fusce mi risus, egestas et feugiat vel, lacinia in turpis. Donec sed blandit tellus. Nullam velit mi, consectetur ac pulvinar at, egestas id dui. Quisque mi nunc, condimentum pretium orci vitae, fermentum malesuada ligula. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In hac habitasse platea dictumst.

Sed nec ex erat. Mauris interdum sapien non pharetra volutpat. Integer fermentum egestas ipsum, at consectetur massa tincidunt vitae. Integer nec auctor lacus. Aliquam in ornare dui. Mauris diam dui, consequat vel diam et, fermentum finibus nunc. Curabitur imperdiet feugiat risus sed ornare. Cras lacinia eget nibh sed ultrices. Nullam elit libero, laoreet sed commodo a, porta eget nisl. Aenean ante lectus, blandit vel accumsan nec, commodo vitae metus. Nam cursus mi quis neque suscipit efficitur.

In sit amet augue gravida, elementum augue et, rhoncus lectus. Nullam interdum, felis nec volutpat congue, ante felis consequat enim, ac interdum ante erat aliquet quam. Pellentesque lorem metus, feugiat a ultricies quis, luctus at mi. Sed eleifend justo sed orci sollicitudin dignissim. Integer eget velit nulla. Nunc fringilla diam rutrum orci ultricies, vitae congue nulla ornare. Duis venenatis turpis enim. Vestibulum sed odio posuere odio vestibulum ultricies et tincidunt enim. Maecenas non euismod felis. Donec ut mauris.', 'novost 1 lorem ipsum', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...', CURDATE());


