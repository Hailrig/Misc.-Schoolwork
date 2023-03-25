CREATE DATABASE FilmRegistry;
USE FilmRegistry;

CREATE TABLE Directors (
	DirectorID INT NOT NULL AUTO_INCREMENT,
	DirectorName VARCHAR(255),
	DirectorAge INT(3),
    Nationality VARCHAR(255),
	PRIMARY KEY (DirectorID)
);

CREATE TABLE Movies (
	MovieID INT NOT NULL AUTO_INCREMENT,
    MovieName VARCHAR(255),
	Genre VARCHAR(255),
    ReleaseYear INT(4),
    DirectorID INT,
	FOREIGN KEY (DirectorID) REFERENCES Directors(DirectorID),
	PRIMARY KEY (MovieID)
);

CREATE TABLE Actors (
	ActorID INT NOT NULL AUTO_INCREMENT,
	Fname VARCHAR(255),
    Lname VARCHAR(255),
    Age INT(3),
	PRIMARY KEY (ActorID)
);

CREATE TABLE Parts (
	PartID INT NOT NULL AUTO_INCREMENT,
    ActorID INT,
	MovieID INT,
	FOREIGN KEY (ActorID) REFERENCES Actors(ActorID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
	FilmCharacter VARCHAR(255),
	PRIMARY KEY (PartID)
);

CREATE TABLE DVDs (
	DVDID INT NOT NULL AUTO_INCREMENT,
    MovieID INT,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    Price INT,
    PRIMARY KEY (DVDID)
);

INSERT INTO Directors (DirectorName, DirectorAge, Nationality) VALUES ("Kenji Nagasaki", 42, "Japanese");
INSERT INTO Directors (DirectorName, DirectorAge, Nationality) VALUES ("Daisuke Nishio", 62, "Japanese");
INSERT INTO Directors (DirectorName, DirectorAge, Nationality) VALUES ("Takuya Igarashi", 55, "Japanese");
INSERT INTO Directors (DirectorName, DirectorAge, Nationality) VALUES ("Hiroshi Hamasaki", 61, "Japanese");
INSERT INTO Directors (DirectorName, DirectorAge, Nationality) VALUES ("Noriyuki Abe", 60, "Japanese");
INSERT INTO Directors (DirectorName, DirectorAge, Nationality) VALUES ("Ei Aoki", 48, "Japanese");
INSERT INTO Directors (DirectorName, DirectorAge, Nationality) VALUES ("Tatsuro Araki", 44, "Japanese");
INSERT INTO Directors (DirectorName, DirectorAge, Nationality) VALUES ("Shinichirō Watanabe", 56, "Japanese");
INSERT INTO Directors (DirectorName, DirectorAge, Nationality) VALUES ("Masaya Fujimori", 57, "Japanese");
INSERT INTO Directors (DirectorName, DirectorAge, Nationality) VALUES ("Takeo Takahashi", 74, "Japanese");

INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("My Hero Academia", "Action", 2016, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Kenji Nagasaki'));
INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("Bleach", "Action", 2004, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Noriyuki Abe'));
INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("Soul Eater", "Action", 2008, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Takuya Igarashi'));
INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("Stein's; Gate", "Mystery", 2011, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Hiroshi Hamasaki'));
INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("Black Butler", "Drama", 2008, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Noriyuki Abe'));
INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("FATE/ZERO", "Action", 2011, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Ei Aoki'));
INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("Attack on Titan", "Action", 2013, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Tatsuro Araki'));
INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("Cowboy Bebop", "Drama", 1998, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Shinichirō Watanabe'));
INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("Fairy Tail", "Action", 2009, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Masaya Fujimori'));
INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("Spice and Wolf", "Mystery", 2006, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Takeo Takahashi'));
INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("DBZ", "Action", 1989, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Daisuke Nishio'));
INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("Ouron", "Comedy", 2006, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Takuya Igarashi'));
INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("Redline", "Racing", 2009, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Hiroshi Hamasaki'));
INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("Arslan", "Fantasy", 2015, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Noriyuki Abe'));
INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("Garden of Sinners", "Mystery", 2007, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Ei Aoki'));
INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("Kabeneri of the Iron Fortress", "Action", 2016, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Tatsuro Araki'));
INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("Samurai Champloo", "Action", 2005, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Shinichirō Watanabe'));
INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("Izetta", "Action", 2016, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Masaya Fujimoriv'));
INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("Spice and Wolf 2", "Mystery", 2009, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Takeo Takahashi'));
INSERT INTO Movies (MovieName, Genre, ReleaseYear, DirectorID) VALUES ("Bungo Stray Dogs", "Action", 2016, (SELECT DirectorID FROM Directors WHERE DirectorName = 'Takuya Igarashi'));

INSERT INTO DVDs (MovieID, Price) VALUES ((SELECT MovieID FROM Movies WHERE MovieName = 'My Hero Academia'), 10);
INSERT INTO DVDs (MovieID, Price) VALUES ((SELECT MovieID FROM Movies WHERE MovieName = 'Bleach'), 5);
INSERT INTO DVDs (MovieID, Price) VALUES ((SELECT MovieID FROM Movies WHERE MovieName = 'Soul Eater'), 7);
INSERT INTO DVDs (MovieID, Price) VALUES ((SELECT MovieID FROM Movies WHERE MovieName = "Stein's; Gate"), 10);
INSERT INTO DVDs (MovieID, Price) VALUES ((SELECT MovieID FROM Movies WHERE MovieName = 'Black Butler'), 6);
INSERT INTO DVDs (MovieID, Price) VALUES ((SELECT MovieID FROM Movies WHERE MovieName = 'FATE/ZERO'), 20);
INSERT INTO DVDs (MovieID, Price) VALUES ((SELECT MovieID FROM Movies WHERE MovieName = 'Cowboy Bebop'), 15);
INSERT INTO DVDs (MovieID, Price) VALUES ((SELECT MovieID FROM Movies WHERE MovieName = 'Fairy Tail'), 5);
INSERT INTO DVDs (MovieID, Price) VALUES ((SELECT MovieID FROM Movies WHERE MovieName = 'Spice and Wolf'), 13);
INSERT INTO DVDs (MovieID, Price) VALUES ((SELECT MovieID FROM Movies WHERE MovieName = 'DBZ'), 6);
INSERT INTO DVDs (MovieID, Price) VALUES ((SELECT MovieID FROM Movies WHERE MovieName = 'Ouron'), 11);
INSERT INTO DVDs (MovieID, Price) VALUES ((SELECT MovieID FROM Movies WHERE MovieName = 'Redline'), 16);
INSERT INTO DVDs (MovieID, Price) VALUES ((SELECT MovieID FROM Movies WHERE MovieName = 'Arslan'), 8);
INSERT INTO DVDs (MovieID, Price) VALUES ((SELECT MovieID FROM Movies WHERE MovieName = 'Garden of Sinners'), 14);
INSERT INTO DVDs (MovieID, Price) VALUES ((SELECT MovieID FROM Movies WHERE MovieName = 'Kabeneri of the Iron Fortress'), 8);
INSERT INTO DVDs (MovieID, Price) VALUES ((SELECT MovieID FROM Movies WHERE MovieName = 'Samurai Champloo'), 13);
INSERT INTO DVDs (MovieID, Price) VALUES ((SELECT MovieID FROM Movies WHERE MovieName = 'Izetta'), 5);
INSERT INTO DVDs (MovieID, Price) VALUES ((SELECT MovieID FROM Movies WHERE MovieName = 'Spice and Wolf 2'), 10);
INSERT INTO DVDs (MovieID, Price) VALUES ((SELECT MovieID FROM Movies WHERE MovieName = 'Bungo Stray dogs'), 6);

INSERT INTO Actors (Fname, Lname, Age) VALUES ("Christopher", "Sabat", 48);
INSERT INTO Actors (Fname, Lname, Age) VALUES ("Johnny", "Yong Bosch", 45);
INSERT INTO Actors (Fname, Lname, Age) VALUES ("Colleen", "Clinkenbeard", 41);
INSERT INTO Actors (Fname, Lname, Age) VALUES ("Todd", "Haberkorn", 39);
INSERT INTO Actors (Fname, Lname, Age) VALUES ("Cherami", "Leigh", 33);
INSERT INTO Actors (Fname, Lname, Age) VALUES ("J", "Michael Tatum", 45);
INSERT INTO Actors (Fname, Lname, Age) VALUES ("Chrispin", "Freemen", 49);
INSERT INTO Actors (Fname, Lname, Age) VALUES ("Trina", "Nishimura", 38);
INSERT INTO Actors (Fname, Lname, Age) VALUES ("Wendee", "Lee", 61);
INSERT INTO Actors (Fname, Lname, Age) VALUES ("Brina", "Palencia", 37);
INSERT INTO Actors (Fname, Lname, Age) VALUES ("Monica", "Rial", 46);

INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Christopher'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'My Hero Academia'), "All Might");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Colleen'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'My Hero Academia'), "Momo Yaoyorozu");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'J'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'My Hero Academia'), "Tenya Iida");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Monica'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'My Hero Academia'), "Tsuyu Asui");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Johnny'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Bleach'), "Ichigo Kurosaki");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Wendee'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Bleach'), "Tatsuki Arisawa");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Todd'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Soul Eater'), "Death the Kid");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Monica'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Soul Eater'), "Tsubaki Nakatsukasa");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Trina'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Soul Eater'), "Arisa");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Christopher'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Soul Eater'), "Eibon");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'J'), 
(SELECT MovieID FROM Movies WHERE MovieName = "Stein's Gate;"), "Rintaro Okabe");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Trina'), 
(SELECT MovieID FROM Movies WHERE MovieName = "Stein's Gate;"), "Kurisu Makise");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'J'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Black Butler'), "Sebastian Michaelis");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Brina'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Black Butler'), "Ciel Phantomhive");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Cherami'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Black Butler'), "Elizabeth");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Chrispin'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'FATE/ZERO'), "Kirei Kotomine");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Trina'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Attack on Titan'), "Mikasa Ackerman");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'J'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Attack on Titan'), "Erwin Smith");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Wendee'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Cowboy Bebop'), "Faye Valentine");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Cherami'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Fairy Tail'), "Lucy Heartfilia");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Colleen'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Fairy Tail'), "Erza Scarlet");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Todd'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Fairy Tail'), "Natsu Dragneel");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'J'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Spice and Wolf'), "Kraft Lawrence");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Brina'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Spice and Wolf'), "Holo");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'J'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Spice and Wolf 2'), "Kraft Lawrence");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Brina'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Spice and Wolf 2'), "Holo");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'J'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Spice and Wolf'), "Kraft Lawrence");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Christopher'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'DBZ'), "Vegeta");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Christopher'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'DBZ'), "Piccolo");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'J'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Ouron'), "Kyoya Otori");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Todd'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Ouron'), "Hikaru Hitachiin");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Christopher'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Izetta'), "Baer");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Johnny'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Samurai Champloo'), "Shinsuke");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Wendee'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Samurai Champloo'), "Hotaru");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Todd'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Bungo Stray Dogs'), "Edgar Allen Poe");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Colleen'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Soul Eater'), "Marie Mjolnir");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'J'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Soul Eater'), "Giriko");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Trina'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Soul Eater'), "Mizune");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'J'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Fairy Tail'), "Acnologia");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Christopher'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Fairy Tail'), "Elfman Strauss");
INSERT INTO Parts (ActorID, MovieID, FilmCharacter) VALUES ((SELECT ActorID FROM Actors WHERE Fname = 'Brina'), 
(SELECT MovieID FROM Movies WHERE MovieName = 'Fairy Tail'), "Juvia Lockser");


SELECT MovieName FROM Movies WHERE ReleaseYear < 2020 AND ReleaseYear > 2009;
SELECT DISTINCT DirectorName FROM Directors, Movies WHERE Movies.ReleaseYear > 2009 AND Movies.ReleaseYear < 2020 AND Directors.DirectorID = Movies.DirectorID;
SELECT DISTINCT DirectorName FROM Directors INNER JOIN Movies ON Directors.DirectorID=Movies.DirectorID WHERE Movies.ReleaseYear > 2009 AND Movies.ReleaseYear < 2020;
SELECT DISTINCT DirectorName FROM Directors WHERE Directors.DirectorID IN (SELECT DirectorID FROM Movies WHERE ReleaseYear < 2020 AND ReleaseYear > 2009);
SELECT MovieName FROM Actors, Parts, Movies, Directors WHERE Actors.Fname = "Christopher" AND Directors.DirectorName = "Kenji Nagasaki"
AND Movies.DirectorID = Directors.DirectorID AND Parts.MovieID = Movies.MovieID AND Parts.ActorID = Actors.ActorID;

SELECT MovieName, ReleaseYear FROM Movies ORDER BY ReleaseYear ASC;
SELECT ReleaseYear, COUNT(*) AS YEAR_NUMBER FROM Movies GROUP BY ReleaseYear;
SELECT AVG(Count) as AVG_NUMBER FROM (SELECT COUNT(*) AS COUNT FROM Movies GROUP BY ReleaseYear) as AVG_NUMBER_TABLE;
SELECT Price, MovieName FROM DVDs INNER JOIN Movies ON DVDs.MovieID=Movies.MovieID WHERE Price = (SELECT MAX(Price) FROM DVDs) or Price = (SELECT MIN(Price) FROM DVDs);
SELECT A.MovieID AS MovieOneID, B.MovieID AS MovieTwoID, A.Price FROM DVDs A INNER JOIN DVDs B ON A.Price=B.Price AND A.MovieID < B.MovieID ORDER BY A.MovieID, B.MovieID;
