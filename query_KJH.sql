-- Movie query
-- mysql Team_P/teamproject

use team_project;

-- 1. 성별 및 연령대별 선호 장르 및 해당 영화 제목 검색
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
/* case ~ when ~ then 이용하여 나이대 분류
 * group_concat() 이용하여 컬럼의 데이터들을 하나의 열에 나열
 * 이때 count(*) 이용시 합쳐진 열 개수 만큼 추가되므로 중복을 제거한 user.id를 카운트해줌
 */


-- 2. 영화별 특정 성별 및 연령대에서의 리뷰 개수 내림차순 검색
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
/* case ~ when ~ then 이용하여 나이대 분류
 * review table에서 user.id와 movie.id가 일치하는 항목 카운트해서 리뷰개수 파악
 */


-- 3. 특정 영화의 배우 및 제작진이 참여한 다른 영화 검색
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
/* inner join 이용해서 배우와 제작진이 일치하는 영화 검색
 * 
 */


-- 4. 유저 국가별 최다 리뷰 영화 파악
select u.country, title, count(*) as count
from user u, Movie m, review r
where m.id = r.movie_id and u.id = r.user_id 
group by 1,2
order by 1,3 desc;
/* review table에서 user.id와 movie.id가 일치하는 항목 카운트해서 리뷰개수 파악 후 내림차순으로 정렬
 * 
 */


-- 5. 리뷰의 키워드를 이용하여 호평, 악평이 가장 많은 영화 검색
-- 개선사항 : 특정 키워드에 한정된 검색결과라 신뢰성이 높지 않음, 애매한 리뷰들은 어떻게 처리할지? - 현재는 무시, 점수별 분류?
select title,
	count(case when comment like '%꿀잼%' then 1 
			   when comment like '%잼이따%' then 1 
			   when comment like '%개추%' then 1 end) as likes,
	count(case when comment like '%노잼%' then 1 
			   when comment like '%싫어%' then 1 end) as dislikes
from movie m, review r
where m.id = r.movie_id
group by 1
order by likes desc, dislikes desc;
/* count내에 case~when~then 이용하여 특정 키워드가 들어간 리뷰 개수 검색
 * 
 */