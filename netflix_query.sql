drop table if exists metadata;
drop table if exists titles;
drop table if exists credits;

create table metadata(
	budget INT,
	revenue NUMERIC(18,1),
	id INT,
	original_title VARCHAR,
	title VARCHAR
);

select *
from metadata

create table titles(
	type VARCHAR,
	title VARCHAR,
	director VARCHAR,
	country VARCHAR,
	release_year INT
);

select *
from titles

create table credits(
	movie_id INT,
	writer VARCHAR
);

select *
from credits

create view metadata_credits as
	select *
	from credits
	join metadata on metadata.id = credits.movie_id

select *
from metadata_credits
join titles on titles.title = metadata_credits.title

