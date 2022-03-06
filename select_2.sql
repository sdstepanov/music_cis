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

select nickname, year_album
from musician_album ma
	join musician m on ma.musician_id  = m.id
	join album a  on ma.album_id  = a.id
where year_album not in (2020);

select name_collection
from musician m 
	join musician_album ma on ma.musician_id  = m.id
	join album a on ma.album_id = a.id 
	join composition c on a.id = c.id_album 
	join composition_collection cc on c.id = cc.id_composition 
	join collection c2 on cc.id_collection = c2.id 
where nickname = 'Eminem'
group by name_collection;


select m.id, nickname, count(name_of_genre) 
	from genre_musician gm 
	join musician m on gm.musician_id = m.id
	join genre g on gm.genre_id = g.id
group by m.id , nickname
having count(name_of_genre) > 1;

select name_album 
from (select m.id, nickname, count(name_of_genre) 
	from genre_musician gm 
		join musician m on gm.musician_id = m.id
		join genre g on gm.genre_id = g.id
	group by m.id , nickname
	having count(name_of_genre) > 1) mus
join musician_album ma on mus.id = ma.musician_id 
join album a on ma.album_id = a.id;

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


select name_album, cnm
from (select name_album, count(name_composition) as cnm
		from album a join composition c on a.id = c.id_album
		group by name_album) count_composition 
order by cnm
limit 1





	
