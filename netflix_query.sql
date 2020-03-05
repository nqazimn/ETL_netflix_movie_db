drop table metadata;

create table metadata(
	budget INT,
	revenue NUMERIC(18,1),
	id INT,
	original_title VARCHAR,
	title VARCHAR
);

select *
from metadata

drop table titles;

create table titles(
	type VARCHAR,
	title VARCHAR,
	director VARCHAR,
	country VARCHAR,
	release_year INT
);

select *
from titles

drop table credits;

create table credits(
	movie_id INT,
	writer VARCHAR
);

select *
from credits

create view metadata_credits as

select *
from credits
join metadata
on metadata.id = credits.movie_id

select *
from metadata_credits

select *
from metadata_credits
join titles
on titles.title = metadata_credits.title
