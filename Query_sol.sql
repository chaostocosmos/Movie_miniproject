use team_project;
show tables;

select * from actor a ;
-- 이경영 6번 
select * from movie m ;
-- 
select * from movie_actor ma ;
select * from user_info ui ;
select * from user;

-- Q1 
select * from movie m where m.title like '%맨'; 


-- Q2 
select * from movie m , movie_genre mg where m.id = mg.movie_id 
and mg.genre_id  = 4 and m.title like '%맨';


-- Q3 
select m.* from movie m , movie_genre mg where m.id = mg.movie_id 
and mg.genre_id  = 4 and m.title like '%맨'
and m.id  in (select m.id from review r inner join movie m on r.movie_id = m.id 
where r.score > 8 and m.vote_average > 7)
and m.relese_date > '2000-01-01';


select * from movie m , movie_actor ma where m.id = ma.movie_id 
and ma.actor_id = (select a.id from actor a where a.name  like '이경영');

-- Q4
delete from m , ma
	using movie as m
	left join movie_actor as ma
	on m.id = ma.movie_id
where ma.actor_id = (select a.id from actor a where a.name  like '이경영');
-- 이러면 외래키 cascade 조건 하 이거 좀 애매헌딩

select * from movie m ;


-- Q5
CREATE VIEW CleanReView AS
SELECT *
FROM Review r
where r.comment not like '%2류%';

select * from CleanReView;
select * from ReView;

 