-- Movie query
-- mysql Team_P/teamproject

use team_project;

-- 1. 성별 및 연령대별 선호 장르 및 해당 영화

-- 제대로 검색되는지 테스트를 위한 임시 데이터 생성
insert into user_info values(1,1);
insert into movie_genre values(1,1);
insert into movie_genre values(2,1),(3,1);
rollback;

select
	case 
		when age between 1 and 19 then '10대이하'
		when age between 20 and 29 then '20대'
		when age between 30 and 39 then '30대'
		when age between 40 and 49 then '40대'
		when age is null then '알수없음'
		else '50대 이상'
	end as ages, gender, name as genre, count(distinct u.id) as count, 
		   group_concat(title separator ', ') as movies
from user u, genre g, User_info ui, Movie m, Movie_Genre mg 
where user_id = u.id and g.id = ui.genre_id = mg.genre_id and m.id = mg.movie_id 
group by ages, gender, name
order by ages, gender desc;



-- 2. 성별 및 연령대별 영화별 리뷰 갯수 내림차순
select title,
	case 
		when age between 1 and 19 then '10대이하'
		when age between 20 and 29 then '20대'
		when age between 30 and 39 then '30대'
		when age between 40 and 49 then '40대'
		when age is null then '알수없음'
		else '50대 이상'
	end as ages, gender, count(*) as review_cnt
from user u, Movie m, Review r 
where user_id = u.id and movie_id = m.id
group by ages, gender, title
order by ages, gender, count(*) desc;



-- 3. 특정 영화의 배우 및 제작진이 참여한 다른 영화

-- 제대로 검색되는지 테스트를 위한 임시 데이터 생성
insert into Movie_Actor values (1,1),(2,1),(3,1);
insert into Movie_crew values (1,1),(2,1);
rollback;

SELECT m.*, a.name as actor, c.name as crew
from Movie m
inner join Movie_Actor ma
	on m.id = ma.movie_id 
inner join Movie_Crew mc
	on m.id = mc.movie_id
inner join Actor a
	on a.id = ma.actor_id 
inner join Crew c
	on c.id = mc.crew_id;



-- 4. 유저 국가별 최다 시청 영화

-- 정상 검색 확인용 데이터
insert into review values (2,1,9,'good');
rollback;

select u.country, title, count(*) as count
from user u, Movie m, review r
where m.id = r.movie_id and u.id = r.user_id 
group by 1,2
order by 1,2,3 desc;



-- 5. 리뷰의 키워드를 이용하여 호평, 악평이 가장 많은 영화 검색
-- 개선사항 : 키워드 추가, 특정 키워드에 한정된 검색결과라 신뢰성이 높지 않음, 애매한 리뷰들은 어떻게 처리할지?, 점수별로 하기?
select title,
	count(case when comment like '%꿀잼%' then 1 end) as likes,
	count(case when comment like '%노잼%' then 1 end) as dislikes
from movie m, review r
where m.id = r.movie_id
group by 1
order by likes desc, dislikes desc;
