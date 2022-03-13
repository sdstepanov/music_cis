select name_of_genre, count(nickname) as count_musician
from genre_musician gm 
	join musician m on gm.musician_id = m.id
	join genre g on gm.genre_id = g.id
group by name_of_genre;

select count(c.id) as count_composition
from composition c join album a on c.id_album = a.id 
where year_album between 2019 and 2020;

select name_album, avg(lenght)
from composition c join album a on c.id_album = a.id
group by name_album;

select distinct nickname
from musician
where nickname not in (
	select distinct nickname
	from musician m
		left join musician_album ma on ma.musician_id  = m.id
		left join album a  on ma.album_id  = a.id
	where year_album = (2020))
order by nickname;

select distinct name_collection
from musician m 
	join musician_album ma on ma.musician_id  = m.id
	join album a on ma.album_id = a.id 
	join composition c on a.id = c.id_album 
	join composition_collection cc on c.id = cc.id_composition 
	join collection c2 on cc.id_collection = c2.id 
where nickname = 'Eminem';

select m.id, nickname, count(name_of_genre) 
	from genre_musician gm 
	join musician m on gm.musician_id = m.id
	join genre g on gm.genre_id = g.id
group by m.id , nickname
having count(name_of_genre) > 1;

select name_composition 
from composition c 
	left join composition_collection cc on c.id = cc.id_composition
	left join collection c2 on cc.id_collection = c2.id 
where id_collection is null;

select nickname
from musician m 
		join musician_album ma on ma.musician_id  = m.id
		join album a on ma.album_id = a.id 
		join composition c on a.id = c.id_album
where lenght in (select min(lenght)
	from composition);

select distinct name_album 
from album a join composition c on a.id = c.id_album
where c.id_album in (
	select id_album 
	from composition c2
	group by id_album
	having count(c2.id) in (
		select count(id)
		from composition
		group by id_album
		order by count(id) 
		limit 1));




	
