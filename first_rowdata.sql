delete from Review;
delete from user_info ;
delete from movie_actor ;
delete from movie_crew ;
delete from movie_genre ;
delete from `user` ;
delete from actor ;
delete from genre ;
delete from movie ;
delete from crew ;
delete from crew ;

insert into movie values(1, '범죄도시2', '마동석이대충깡패족치는내용', '2022-05-01', 8500000, 8.8, 'Korea');
insert into movie values(2, '주라기월드:도미니언', '주인공이대충공룡족치는내용', '2022-05-02', 5500000, 8.1, 'America');
insert into movie values(3, '닥터스트레인지', '마법사가대충악당족치는내용', '2022-05-03', 1230000, 8.8, 'America');
insert into movie values(4, '아이언맨', '아이언맨이대충악당족치는내용', '2015-08-11', 18500000, 9, 'America');
insert into movie values(5, '스퍼이더맨', '스파이더맨이대충악당족치는내용', '2002-02-05', 5500000, 8, 'America');
insert into movie values(6, '수퍼맨', '수퍼맨이대충악당족치는내용', '1999-03-31', 5060000, 8, 'America');
insert into movie values(7, '킹스맨', '킹스맨이대충악당족치는내용', '2012-11-01', 8003451, 8, 'America');
insert into movie values(8, '베트맨', '베트맨이대충악당족치는내용', '2005-06-13', 5507708, 8, 'America');
insert into movie values(9, '앤트맨', '앤트맨이대충악당족치는내용', '2016-07-03', 1230050, 7, 'America');
insert into movie values(10,'아쿠아맨', '아쿠아맨이대충악당족치는내용', '2017-07-13', 4487000, 7, 'America');
insert into movie values(11, '오맨', '악마가나오고암튼무서움', '1998-07-03', 444444, 4, 'America');
insert into movie values(12,'퍼팩트맨', '조진웅설경구의브로맨스', '2015-07-13', 7387000, 8, 'korea');
insert into movie values(13,'범죄도시 1', '마동석이대충깡패족치는내용', '2017-02-27', 6879841, 8.3, 'Korea');
insert into movie values(14,'악인전', '마동석이칼맞고복수하는내용', '2018-07-31',	3351454 , 7.9, 'Korea');
insert into movie values(15,'챔피언', '마동석이팔씨름하는내용', '2018-05-01',	1120000 , 6.9, 'Korea');
insert into movie values(16,'동내사람들', '체육교사마동석의실종자찾기', '2017-07-21',	461693 , 5.3, 'Korea');
insert into movie values(17,'범죄와의 전쟁', '학연지연혈연흡연 끝판왕', '2012-02-02',	4720050 , 9.1, 'Korea');
insert into movie values(18,'회사원', '평범한 킬러회사 퇴사기', '2012-10-11',	1110523 , 6.4, 'Korea');
insert into movie values(19,'도둑들', '다이야털기', '2012-06-14',	12983821 , 9.3, 'Korea');


insert into genre (name) values('코미디(Comedy)');
insert into genre (name) values('멜로(Romance)');
insert into genre (name) values('스릴러(Thriller)');
insert into genre (name) values('액션(Action)');
insert into genre (name) values('모험(Adventure)');
insert into genre (name) values('애니메이션(Animation)');
insert into genre (name) values('전기(Bioghraphy)');
insert into genre (name) values('범죄(Crime)');
insert into genre (name) values('다큐멘터리(Documentary)');
insert into genre (name) values('드라마(Drama)');
insert into genre (name) values('판타지(Fantasy)');
insert into genre (name) values('역사(History)');
insert into genre (name) values('공포(Horror)');
insert into genre (name) values('가족(family)');
insert into genre (name) values('뮤지컬(Musical)');
insert into genre (name) values('미스터리(Mystery)');
insert into genre (name) values('SF(Sci fi)');
insert into genre (name) values('전쟁(War)');
commit;
ALTER TABLE genre AUTO_INCREMENT=1;
SET @COUNT = 0;
UPDATE genre SET id = @COUNT:=@COUNT+1;


insert into Movie_Genre values(1, 8);
insert into Movie_Genre values(2, 5);
insert into Movie_Genre values(3, 4);
insert into Movie_Genre values(4, 4);
insert into Movie_Genre values(5, 4);
insert into Movie_Genre values(6, 4);
insert into Movie_Genre values(7, 4);
insert into Movie_Genre values(8, 4);
insert into Movie_Genre values(9, 4);
insert into Movie_Genre values(10, 4);
insert into Movie_Genre values(11, 13);
insert into Movie_Genre values(12, 1);
insert into Movie_Genre values(13, 8);
insert into Movie_Genre values(14, 3);
insert into Movie_Genre values(15, 1);
insert into Movie_Genre values(16, 14);
insert into Movie_Genre values(17, 8);
insert into Movie_Genre values(18, 4);
insert into Movie_Genre values(19, 1);


insert into user (username, age, gender, country) values('KIM', 13, 'M', 'Korea');
insert into user (username, age, gender, country) values('PARK', 21, 'M', 'Korea');
insert into user (username, age, gender, country) values('MIKE', 35, 'M', 'USA');
insert into user (username, age, gender, country) values('CHOI', 29, 'M', 'Korea');
insert into user (username, age, gender, country) values('SUZUKI', 22, 'F', 'Japan');
insert into user (username, age, gender, country) values('YANG', 38, 'M', 'Korea');
insert into user (username, age, gender, country) values('ITO', 18, 'M', 'Japan');
insert into user (username, age, gender, country) values('SEO', 42, 'F', 'Korea');
insert into user (username, age, gender, country) values('OH', 55, 'M', 'Korea');
insert into user (username, age, gender, country) values('WANG', 24, 'M', 'China');
insert into user (username, age, gender, country) values('KANG', 67, 'F', 'Korea');
insert into user (username, age, gender, country) values('HONG', 33, 'M', 'Korea');
insert into user (username, age, gender, country) values('CHO', 47, 'F', 'Korea');
insert into user (username, age, gender, country) values('TOM', 17, 'M', 'USA');
insert into user (username, age, gender, country) values('SATO', 27, 'F', 'Japan');
insert into user (username, age, gender, country) values('RYU', 24, 'F', 'Korea');
insert into user (username, age, gender, country) values('EMMA', 23, 'F', 'USA');
insert into user (username, age, gender, country) values('LEE', 17, 'F', 'Korea');
insert into user (username, age, gender, country) values('SON', 25, 'F', 'Korea');
insert into user (username, age, gender, country) values('XIAO', 41, 'M', 'China');
commit;
ALTER TABLE user AUTO_INCREMENT=1;
SET @COUNT = 0;
UPDATE user SET id = @COUNT:=@COUNT+1;


insert into Review values(1,1,8,'엥');
insert into Review values(1,2,9,'오 좀 잼이따');
insert into Review values(2,10,9,'노잼');
insert into Review values(2,9,10,'꿀잼');
insert into Review values(2,8,9,'핵노잼');
insert into Review values(3,5,9,'ㅋㅋ나만볼수 없지');
insert into Review values(3,6,1,'이 점수는 사실 11점이다');
insert into Review values(3,7,9,'킹스맨 죽음');
insert into Review values(4,7,1,'로다주 개싫어');
insert into Review values(4,7,1,'로다주 개싫어');
insert into Review values(4,7,1,'로다주 개싫어');
insert into Review values(4,7,1,'로다주 개싫어');
insert into Review values(5,17,10,'인생영화 개추요!!');
insert into Review values(6,12,3,'뻔한 스토리 개노잼');
insert into Review values(7,10,9,'볼만하네');
insert into Review values(8,15,10,'호두과자~~~');
insert into Review values(9,13,8,'마형 팔뚝보소');



insert into actor(name, profile_path, Moive_character) values('마동석', '배우', '폭군');
insert into actor(name, profile_path, Moive_character) values('원빈', '배우', '잘생김');
insert into actor(name, profile_path, Moive_character) values('현빈', '배우', '사랑꾼');
insert into actor(name, profile_path, Moive_character) values('손석구', '배우', '살인마');
insert into actor(name, profile_path, Moive_character) values('이병헌', '배우', '깡패');
insert into actor(name, profile_path, Moive_character) values('이경영', '배우', '기업인');
insert into actor(name, profile_path, Moive_character) values('조승우', '배우', '형사');
insert into actor(name, profile_path, Moive_character) values('류승범', '배우', '양아치');
insert into actor(name, profile_path, Moive_character) values('정우성', '배우', '검사');
insert into actor(name, profile_path, Moive_character) values('강동원', '배우', '범죄자');
insert into actor(name, profile_path, Moive_character) values('손석구', '배우', '사이코');
insert into actor(name, profile_path, Moive_character) values('박지환', '배우', '왜나만가지고그럽니까');
insert into actor(name, profile_path, Moive_character) values('하준', '배우', '경찰');
insert into actor(name, profile_path, Moive_character) values('최귀화', '배우', '보스');
insert into actor(name, profile_path, Moive_character) values('음문석', '배우', '깡패');
insert into actor(name, profile_path, Moive_character) values('허동원', '배우', '보스 부하');
commit;
ALTER TABLE genre AUTO_INCREMENT=1;
SET @COUNT = 0;
UPDATE actor SET id = @COUNT:=@COUNT+1;


insert into crew(name,profile_path) values('봉준호', '감독');
insert into crew(name,profile_path) values('박찬욱', '감독');
insert into crew(name,profile_path) values('임권택', '감독');
insert into crew(name,profile_path) values('김기영', '감독');
insert into crew(name,profile_path) values('류승완', '감독');
insert into crew(name,profile_path) values('박광수', '감독');
insert into crew(name,profile_path) values('강우석', '감독');
insert into crew(name,profile_path) values('김지운', '감독');
insert into crew(name,profile_path) values('변영주', '감독');
insert into crew(name,profile_path) values('김태용', '감독');
commit;
ALTER TABLE crew AUTO_INCREMENT=1;
SET @COUNT = 0;
UPDATE crew SET id = @COUNT:=@COUNT+1;


-- 쿼리문 사용에 필요한 내용 추가합니다 ( 진원 ) 
insert into movie values(20,'내부자들', '이병헌과조승우가악당들조지는내용', '2015-11-14',	7072507 , 9.3, 'Korea');
insert into movie values(21,'자전차왕엄복동', '비가자전거뽀려서친일파조지는내용', '2019-10-04',	170000 , 10, 'Korea');
insert into movie values(22,'부당거래', '호이가계속되면둘리인줄알아요', '2016-02-04',	9954358 , 8, 'Korea');
insert into movie values(23,'죽거나혹은나쁘거나', '나쁜게 낫지그래도?', '2019-02-04',	912345 , 7, 'Korea');

insert into Review values(18,22,2,'류+류 = 2류 작품도 2류 엌ㅋㅋ');
insert into Review values(18,22,2,'류+류 = 2류 작품도 2류 엌ㅋㅋ');
insert into Review values(18,23,2,'류+류 = 2류 작품도 2류 엌ㅋㅋ');
insert into Review values(18,23,2,'류+류 = 2류 작품도 2류 엌ㅋㅋ');

insert into movie_actor values(20,6);
insert into movie_actor values(21,6);