create table if not exists genre (
	Id serial primary key,
	Name_of_genre text unique not null
);

create table if not exists musician(
	id serial primary key,
	nickname text unique
);

create table if not exists genre_musician (
	genre_id integer references genre(id),
	musician_id integer references musician(id),
	constraint gm primary key(genre_id, musician_id)
);


create table if not exists album (
	id serial primary key,
	name_album text not null, 
	year_album integer
);

create table if not exists musician_album (
	album_id integer references album(id),
	musician_id integer references musician(id),
	constraint ma primary key(album_id, musician_id)
);

create table if not exists composition (
	id serial primary key,
	name_composition text not null,
	lenght integer,
	id_album integer references album(id)
);

create table if not exists collection (
	id serial primary key,
	name_collection text not null unique,
	year_collection integer
);

create table if not exists composition_collection (
	id_composition integer references composition(id),
	id_collection integer references collection (id),
	constraint cc primary key(id_composition, id_collection)
);