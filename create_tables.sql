--1. Record label
CREATE TABLE recordLabel(
    companyName text,
    dateEstablished date,
    labelLocation text,
    recordLabelId smallint not null,
    PRIMARY KEY (recordLabelId)
);
-- 2. Publishes
CREATE TABLE publishes(
    albumId smallint not null,
    recordLabelId smallint not null,
    PRIMARY KEY (albumId, recordLabelId)
);
--4. artist
CREATE TABLE artist(
    artistId smallint not null,
    artistName text,
    age integer,
    PRIMARY KEY (artistId)
);
--5. musician
CREATE TABLE musician(
    artistId smallint not null,
    musicianId smallint not null,
    instrument text,
    band text,
    PRIMARY KEY (artistId, musicianId)
);
--6. Played
CREATE TABLE played(
    albumId smallint not null,
    musicianId smallint not null,
    PRIMARY KEY (albumId, musicianId)
);
--7. album
CREATE TABLE album(
    albumDuration integer,
    albumId smallint not null,
    title text,
    coverArtURL text,
    PRIMARY KEY (albumId)
);
--8. song
CREATE TABLE song(
    title text,
    genre text,
    songDuration integer,
    songId smallint not null,
    sourceLink text,
    releaseYear integer,
    PRIMARY KEY (songId)
);
--9. Contains
CREATE TABLE contains(
    albumId smallint not null,
    songId smallint not null,
    PRIMARY KEY (songId, albumId)
);
--10. made
CREATE TABLE made(
    knownFor text,
    albumId smallint not null,
    artistId smallint not null,
    PRIMARY KEY (albumId, artistId),
    FOREIGN KEY (albumId) REFERENCES album(albumId),
    FOREIGN KEY (artistId) REFERENCES artist(artistId)
);
--3. Rating
CREATE TABLE rating(
    numOfRating integer,
    averageRating decimal,
    userRating integer,
    albumId smallint not null,
    songId smallint not null,
    PRIMARY KEY (albumId, songId),
    FOREIGN KEY (songId) REFERENCES song(songId),
    FOREIGN KEY (albumId) REFERENCES album(albumId)
);