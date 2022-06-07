CREATE TABLE user(
	id	int	not null auto_increment primary key,
	username	VARCHAR(10)	not null,
	age	int	not null,
	gender	VARCHAR(5)	not null,
	country	VARCHAR(10)	not null
);
CREATE TABLE Movie (
	id	int	not null  auto_increment primary key,
	title	VARCHAR(20)	not null,
	overview	TEXT	not null,
	relese_date	date	not null,
	popularity	int	not null,
	vote_average	int	not null,
	country	VARCHAR(10)	not null
);
CREATE TABLE Movie_Genre (
	movie_id	int	not null,
	genre_id	int	not null
);
CREATE TABLE Actor (
	id	int	not null auto_increment primary key,
	name	VARCHAR(20)	not null,
	profile_path	VARCHAR(20)	not null,
	Moive_character	VARCHAR(20)	not null
);
CREATE TABLE Genre (
	id	int	not null auto_increment primary key,
	name	VARCHAR(20)	not null
);


CREATE TABLE Crew (
	id	int	not null auto_increment primary key,
	name	VARCHAR(20)	not null,
	profile_path	VARCHAR(20)	null
);
CREATE TABLE Movie_Actor (
	movie_id	int	not null,
	actor_id	int	not null
);

drop table if exists Movie_Crew;

CREATE TABLE Movie_Crew (
	movie_id	int	not null,
	crew_id	int	not null
);


CREATE TABLE Review (
	user_id	int	not null,
	movie_id int	not null,
	score	int	not null,
	comment	VARCHAR(100)	null
);
CREATE TABLE User_info (
	user_id	int	not null,
	Genre_id	int	not null
);



ALTER TABLE Movie_Genre ADD CONSTRAINT PK_MOVIE_GENRE PRIMARY KEY (
	movie_id,
	genre_id
);

ALTER TABLE Movie_Actor ADD CONSTRAINT PK_MOVIE_ACTOR PRIMARY KEY (
	movie_id,
	actor_id
);
ALTER TABLE Movie_Crew ADD CONSTRAINT PK_MOVIE_CREW PRIMARY KEY (
	movie_id,
	crew_id
);
ALTER TABLE Review ADD CONSTRAINT PK_Review PRIMARY KEY (
	user_id,
	movie_id
);

ALTER TABLE User_info ADD CONSTRAINT PK_USER_INFO PRIMARY KEY (
	user_id,
	Genre_id
);

ALTER TABLE Movie_Genre ADD CONSTRAINT FK_Movie_TO_Movie_Genre_1 FOREIGN KEY (
	movie_id
)
REFERENCES Movie (
	id
);
ALTER TABLE Movie_Genre ADD CONSTRAINT FK_Genre_TO_Movie_Genre_1 FOREIGN KEY (
	genre_id
)
REFERENCES Genre (
	id
);
ALTER TABLE Movie_Actor ADD CONSTRAINT FK_Movie_TO_Movie_Actor_1 FOREIGN KEY (
	movie_id
)
REFERENCES Movie (
	id
);
ALTER TABLE Movie_Actor ADD CONSTRAINT FK_Actor_TO_Movie_Actor_1 FOREIGN KEY (
	actor_id
)
REFERENCES Actor (
	id
);
ALTER TABLE Movie_Crew ADD CONSTRAINT FK_Movie_TO_Movie_Crew_1 FOREIGN KEY (
	movie_id
)
REFERENCES Movie (
	id
);

ALTER TABLE Movie_Crew ADD CONSTRAINT FK_Crew_TO_Movie_Crew_1 FOREIGN KEY (
	crew_id
)
REFERENCES Crew (
	id
);
ALTER TABLE Review ADD CONSTRAINT FK_user_TO_Review_1 FOREIGN KEY (
	user_id
)
REFERENCES user (
	id
);
ALTER TABLE Review ADD CONSTRAINT FK_Movie_TO_Review_1 FOREIGN KEY (
	movie_id
)
REFERENCES Movie (
	id
);
ALTER TABLE User_info ADD CONSTRAINT FK_user_TO_User_info_1 FOREIGN KEY (
	user_id
)
REFERENCES user (
	id
);
ALTER TABLE User_info ADD CONSTRAINT FK_Genre_TO_User_info_1 FOREIGN KEY (
	Genre_id
)
REFERENCES Genre (
	id
);

-- 동일 계정의 동일 영화에 대한 리뷰 허용을 위한 hotfix 

alter table Review drop constraint FK_user_TO_Review_1;

alter table Review drop constraint FK_Movie_TO_Review_1;

alter table Review drop primary key;

ALTER TABLE Review ADD CONSTRAINT FK_user_TO_Review_1 FOREIGN KEY (
	user_id
)
REFERENCES user (
	id
);
ALTER TABLE Review ADD CONSTRAINT FK_Movie_TO_Review_1 FOREIGN KEY (
	movie_id
)
REFERENCES Movie (
	id
)ON DELETE CASCADE ON UPDATE CASCADE;

desc review;

-- 외래키참조 테이블 제약조건 변경 hotfix (부모테이블 변경 시 데이터 자동 변경) review Table 제외됨 ! 

-- movie_actor

alter table movie_actor drop constraint FK_Movie_TO_Movie_Actor_1;

alter table movie_actor drop constraint FK_Actor_TO_Movie_Actor_1;

alter table movie_actor drop primary key;

ALTER TABLE movie_actor ADD CONSTRAINT FK_Movie_TO_Movie_Actor_1 FOREIGN KEY (
	movie_id
)
REFERENCES movie (
	id
)ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE movie_actor ADD CONSTRAINT FK_Actor_TO_Movie_Actor_1 FOREIGN KEY (
	actor_id
)
REFERENCES actor (
	id
)ON DELETE CASCADE ON UPDATE CASCADE;



select * from movie_actor;
select * from movie;

desc movie_crew ;
-- movie_crew

alter table Movie_Crew drop constraint FK_Movie_TO_Movie_Crew_1;

alter table Movie_Crew drop constraint FK_Crew_TO_Movie_Crew_1;

alter table Movie_Crew drop primary key;

ALTER TABLE Movie_Crew ADD CONSTRAINT FK_Movie_TO_Movie_Crew_1 FOREIGN KEY (
	movie_id
)
REFERENCES Movie (
	id
)ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Movie_Crew ADD CONSTRAINT FK_Crew_TO_Movie_Crew_1 FOREIGN KEY (
	crew_id
)
REFERENCES Crew (
	id
)ON DELETE CASCADE ON UPDATE CASCADE;

desc Movie_Genre ;

-- Movie_Genre

alter table Movie_Genre drop constraint FK_Movie_TO_Movie_Genre_1;

alter table Movie_Genre drop constraint FK_Genre_TO_Movie_Genre_1;

alter table Movie_Genre drop primary key;

ALTER TABLE Movie_Genre ADD CONSTRAINT FK_Movie_TO_Movie_Genre_1 FOREIGN KEY (
	movie_id
)
REFERENCES Movie (
	id
)ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Movie_Genre ADD CONSTRAINT FK_Genre_TO_Movie_Genre_1 FOREIGN KEY (
	genre_id
)
REFERENCES Genre (
	id
)ON DELETE CASCADE ON UPDATE CASCADE;

desc user_info ;
-- user_info

alter table User_info drop constraint FK_user_TO_User_info_1;

alter table User_info drop constraint FK_Genre_TO_User_info_1;

alter table User_info drop primary key;


ALTER TABLE User_info ADD CONSTRAINT FK_user_TO_User_info_1 FOREIGN KEY (
	user_id
)
REFERENCES user (
	id
)ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE User_info ADD CONSTRAINT FK_Genre_TO_User_info_1 FOREIGN KEY (
	Genre_id
)
REFERENCES Genre (
	id
)ON DELETE CASCADE ON UPDATE CASCADE;

-- 수정완료

-- 트리거, 프로시저 추가

-- 유저 백업
-- backup_user table 생성
drop table if exists backup_user;
create table backup_user (
	id int,
	username varchar(10),
	age int,
	gender varchar(5),
	country varchar(10),
	times date
);

-- userbackup trigger 생성
drop trigger if exists userbackup;

delimiter $$
	create trigger userbackup
	after insert on user
	for each row
	begin 
		insert into backup_user 
		values (new.id, new.username, new.age, new.gender, new.country, curdate());
	end $$
delimiter ;


-- 영화 백업

-- Movie backup table
drop table if exists backup_movie;
create table backup_movie (
	id	int,
	title	VARCHAR(20),
	overview	TEXT,
	relese_date	date,
	popularity	int,
	vote_average	int,
	country	VARCHAR(10),
	time date
);
select * from backup_user;
desc backup_user;

-- Review backup table
drop table if exists backup_review;
create table backup_review as select * from review where 1=0;

-- Movie_crew backup table
drop table if exists backup_MC;
create table backup_MC as select * from movie_crew where 1=0;

-- Movie_actor backup table
drop table if exists backup_MA;
create table backup_MA as select * from movie_actor where 1=0;

-- Movie_genre backup table
drop table if exists backup_MG;
create table backup_MG as select * from movie_genre where 1=0;


-- trigger
drop trigger if exists check_remove_movie;

DELIMITER $$
CREATE TRIGGER check_remove_movie
	before delete  			
	ON movie
    FOR EACH ROW			

BEGIN
	INSERT INTO backup_movie
		VALUES (old.id, old.title, old.overview, old.relese_date, old.popularity, old.vote_average, old.country, curdate());
	INSERT INTO backup_review
		select * from review where movie_id = old.id;
	INSERT INTO backup_MC
		select * from Movie_Crew where movie_id = old.id;
	INSERT INTO backup_MA
		select * from movie_actor where movie_id = old.id;
	INSERT INTO backup_MG
		select * from Movie_Genre where movie_id = old.id;	
end $$ 
DELIMITER ;

-- procedure
drop procedure if exists rollback_movie;

delimiter $$
create procedure rollback_movie(
	in v_id int
)
	begin 
		insert into movie select id, title, overview, relese_date, popularity, vote_average, country from backup_movie;
		insert into review select * from backup_review;
		insert into movie_crew select * from backup_MC;
		insert into movie_actor select * from backup_MA;
		insert into movie_genre  select * from backup_MG;
		delete from backup_movie where id = v_id;
		delete from backup_review where movie_id = v_id;
		delete from backup_MC where movie_id = v_id;
		delete from backup_MA where movie_id = v_id;
		delete from backup_MG where movie_id = v_id;
	end $$
delimiter ;
