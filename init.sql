CREATE TABLE Artists (
    id      SERIAL,
    name    TEXT    NOT NULL UNIQUE,
    PRIMARY KEY(id)
);

CREATE TABLE Genres (
    id      SERIAL,
    name    TEXT    NOT NULL UNIQUE,
    PRIMARY KEY(id)
);

CREATE TABLE Releases (
    id      SERIAL,
    artist  INTEGER NOT NULL,
    name    TEXT    NOT NULL,
    genre   INTEGER NOT NULL,
    FOREIGN KEY(genre)  REFERENCES Genres(id),
    FOREIGN KEY(artist) REFERENCES Artists(id),
    PRIMARY KEY(id)
);

