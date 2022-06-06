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

drop table Review;
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

select * from User_info;


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
);

desc review;
