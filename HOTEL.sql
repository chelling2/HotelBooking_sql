DROP DATABASE IF exists HOTEL;
DROP USER IF EXISTS HOTEL@localhost;

create user HOTEL@localhost identified WITH mysql_native_password  by 'HOTEL';
create database HOTEL;
grant all privileges on HOTEL.* to HOTEL@localhost with grant option;
commit;
 
USE HOTEL;

CREATE TABLE member (
   member_id   VARCHAR(15)   NOT NULL,
    member_name   VARCHAR(7)   NOT NULL,
   member_phone_number   VARCHAR(15)   NOT NULL,
   birth   VARCHAR(10) NOT NULL,
   mileage   INTEGER NOT NULL   COMMENT '가지고 있는 마일리지는 현금처럼 사용가능',
     grade   VARCHAR(5)   NOT NULL,
     PRIMARY KEY (member_id,member_name)
);

CREATE TABLE hotel (
   hotel_name   VARCHAR(50)   NOT NULL,
   address    VARCHAR(50)   NOT NULL,
   name   VARCHAR(7)   NOT NULL,
   phone_number   VARCHAR(15)   NOT NULL,
   email   VARCHAR(30)   NULL,
    PRIMARY KEY (hotel_name)
);

CREATE TABLE hotelRoom_information (
   room_identification   INTEGER   NOT NULL   COMMENT '사업장내 방타입 구분 번호',
   hotel_name   VARCHAR(50)   NOT NULL,
   room_type    VARCHAR(10)   NOT NULL   COMMENT '방 얼마인지',
   room_su   INTEGER   NOT NULL,
   charge   INTEGER   NOT NULL,
    FOREIGN KEY (hotel_name) REFERENCES hotel(hotel_name),
    PRIMARY KEY (room_identification,hotel_name)
);
CREATE TABLE review (
   review_num   INTEGER   NOT NULL,
   member_id   VARCHAR(15)   NOT NULL,
    member_name   VARCHAR(7)   NOT NULL,
    hotel_name   VARCHAR(50)   NOT NULL,
   room_identification   INTEGER   NOT NULL   COMMENT '사업장내 방타입 구분 번호',
   review   VARCHAR(100) NOT NULL,
   rating   DOUBLE   NOT NULL,
   PRIMARY KEY (review_num),
   FOREIGN KEY (member_id,member_name) REFERENCES member(member_id,member_name),
   FOREIGN KEY (room_identification,hotel_name) REFERENCES hotelRoom_information(room_identification,hotel_name)
);

CREATE TABLE booking (
   booking_num   INTEGER   NOT NULL,
    member_id   VARCHAR(15)   NOT NULL,
   member_name VARCHAR(7)   NOT NULL,
    hotel_name   VARCHAR(50)   NOT NULL,
  room_identification   INTEGER   NOT NULL   COMMENT '사업장내 방타입 구분 번호',
   orderdate   VARCHAR(20)   NOT NULL,
   amount   INTEGER   NOT NULL   COMMENT '등급에 따른 금액',
    PRIMARY KEY (booking_num),
   FOREIGN KEY (member_id,member_name) REFERENCES member(member_id,member_name),
   FOREIGN KEY (room_identification,hotel_name) REFERENCES hotelRoom_information(room_identification,hotel_name)
);
commit;

INSERT INTO member values("seico","김도지","010-1456-3369","980216",16000,'S');
INSERT INTO member values("poison654","소나무","010-3665-4552","640405",10500,'A');
INSERT INTO member values("ley45","박지성","010-9989-5456","841115",1500,'B');
INSERT INTO member values("asdf1234","한국민","010-1212-9898","780826",300,'B');
INSERT INTO member values("chu7777","손흥민","010-6645-3326","930619",3600,'A');
INSERT INTO member values("sunmoon42","권지용","010-6645-3326","890926",15000,'S');
INSERT INTO member values("maria99","김머니","010-4565-5478","990226",45000,'S');
INSERT INTO member values("korean00","최민식","010-2122-3325","701223",900,'A');
INSERT INTO member values("horison","하정우","010-6645-3326","830417",3050,'B');
INSERT INTO member values("appletree","김선문","010-9969-0032","850920",650,'C');
INSERT INTO member values("smart123","이철학","010-7856-3369","770706",8000,'A');
INSERT INTO member values("strong11","강혁","010-8958-1441","950301",800,'C');
INSERT INTO member values("honaldu1","호날두","010-6345-5596","860714",4500,'B');
INSERT INTO member values("imseoul","이한강","010-7787-4655","891206",2500,'A');
INSERT INTO member values("memeo44","박하준","010-2218-3369","931010",1000,'C');

insert into hotel values ('신라스테이 천안', '충남 천안시 서북구 동서대로 177', '박상오', '010-2387-3514', 'SHILLA@naver.com');
insert into hotel values ('스톰호텔', '충남 천안시 동남구 미나릿길 28', '김상철', '010-2344-3452', 'storm@naver.com');
insert into hotel values ('소노벨 천안', '충남 천안시 동남구 성남면 종합휴양지로 200', '이진성', '010-4214-4642', 'sonohotel@naver.com');
insert into hotel values ('파라스파라', '서울 강북구 삼양로 689', '유빛나', '010-7345-2634', 'youstar@naver.com');
insert into hotel values ('라마다 인천 호텔', '인천광역시 남동구 소래역로 36', '최동수', '010-4657-1377', 'cds3636@naver.com');
insert into hotel values ('유탑 유블레스호텔', '제주 제주시 조천읍 조함해안로 502', '지수빈', '010-9762-5367', 'subin9672@naver.com');
insert into hotel values ('어라이브 전주 호텔 시화연풍', '전북 전주시 완산구 풍남문3길 9-5', '유한길', '010-5275-7544', 'oneroad44@naver.com');
insert into hotel values ('시그니엘 부산', '부산 해운대구 달맞이길 30', '김태열', '010-7553-1537', 'tae10@naver.com');
insert into hotel values ('씨크루즈호텔', '강원 속초시 청초호반로 273', '강석대', '010-7436-5536', 'kang73@naver.com');
insert into hotel values ('팜비치 호텔&리조트', '경상남도 통영시 도남로 257-45', '노승민', '010-4474-4586', 'winmin@naver.com');


insert into hotelRoom_information values (1,"신라스테이 천안","디럭스",7,50000);
insert into hotelRoom_information values (2,"신라스테이 천안","럭셔리",4,65000);
insert into hotelRoom_information values (3,"신라스테이 천안","스위트",2,100000);

insert into hotelRoom_information values (1,"스톰호텔","디럭스",10,40000);
insert into hotelRoom_information values (2,"스톰호텔","럭셔리",3,80000);
insert into hotelRoom_information values (3,"스톰호텔","스위트",4,120000);

insert into hotelRoom_information values (1,"소노벨 천안","디럭스",1,70000);
insert into hotelRoom_information values (2,"소노벨 천안","럭셔리",3,100000);
insert into hotelRoom_information values (3,"소노벨 천안","스위트",4,150000);

insert into hotelRoom_information values (1,"파라스파라","디럭스",2,80000);
insert into hotelRoom_information values (2,"파라스파라","럭셔리",6,150000);
insert into hotelRoom_information values (3,"파라스파라","스위트",7,180000);

insert into hotelRoom_information values (1,"라마다 인천 호텔","디럭스",3,100000);
insert into hotelRoom_information values (2,"라마다 인천 호텔","럭셔리",5,150000);
insert into hotelRoom_information values (3,"라마다 인천 호텔","스위트",8,210000);

insert into hotelRoom_information values (1,"유탑 유블레스호텔","디럭스",4,90000);
insert into hotelRoom_information values (2,"유탑 유블레스호텔","럭셔리",4,120000);
insert into hotelRoom_information values (3,"유탑 유블레스호텔","스위트",9,150000);

insert into hotelRoom_information values (1,"어라이브 전주 호텔 시화연풍","디럭스",10,150000);
insert into hotelRoom_information values (2,"어라이브 전주 호텔 시화연풍","럭셔리",6,250000);
insert into hotelRoom_information values (3,"어라이브 전주 호텔 시화연풍","스위트",15,320000);

insert into hotelRoom_information values (1,"시그니엘 부산","디럭스",0,380000);
insert into hotelRoom_information values (2,"시그니엘 부산","럭셔리",1,420000);
insert into hotelRoom_information values (3,"시그니엘 부산","스위트",2,480000);

insert into hotelRoom_information values (1,"씨크루즈호텔","디럭스",2,210000);
insert into hotelRoom_information values (2,"씨크루즈호텔","럭셔리",2,300000);
insert into hotelRoom_information values (3,"씨크루즈호텔","스위트",4,380000);

insert into hotelRoom_information values (1,"팜비치 호텔&리조트","디럭스",3,400000);
insert into hotelRoom_information values (2,"팜비치 호텔&리조트","럭셔리",6,520000);
insert into hotelRoom_information values (3,"팜비치 호텔&리조트","스위트",4,850000);


insert into review values (1, "chu7777", "손흥민", "유탑 유블레스호텔",3, "깔끔하고 분위기 좋고 나중에 대표팀 숙소로 한 번 잡아도 될 거 같아요", 4.8);
insert into review values (2, 'honaldu1', '호날두', '시그니엘 부산',1, '나는 한국이 싫어. 그래서 부산 싫어', 1.0);
insert into review values (3, 'ley45', '박지성', '시그니엘 부산',3, '시그니엘 역시 믿고오네요, 와이프랑 왔다가 잘쉬고 가요.', 5.0);
insert into review values (4, 'sunmoon42', '권지용', '팜비치 호텔&리조트',3, 'G O O D', 5.0);
insert into review values (5, 'sunmoon42', '권지용', '시그니엘 부산',3, 'G O O D', 5.0);
insert into review values (6, 'sunmoon42', '권지용', '씨크루즈호텔',2, 'G O O D', 5.0);
insert into review values (7, 'smart123', '이철학', '스톰호텔',2, '.', 3.0);
insert into review values (8, 'memeo44', '박하준', '소노벨 천안',3, '편하게 잘 있다 갑니다.', 5.0);
insert into review values (9, 'memeo44', '박하준', '신라스테이 천안',1, '조식이 맛있어요.', 5.0);
insert into review values (10, 'maria99', '김머니', '라마다 인천 호텔',2, '다음에 또 쉬고싶어요.', 4.5);
insert into review values (11, 'strong11', '강혁', '파라스파라',3, '헬스장도 있어서 너무 좋았어요. 강추!', 5.0);
insert into review values (12, 'korean00', '최민식', '어라이브 전주 호텔 시화연풍',2, '아따 전주 한옥마을 쥑이네요', 4.8);
insert into review values (13, 'horison', '하정우', '어라이브 전주 호텔 시화연풍',1, '영화촬영 때문에 잠시 들렸는데 괜찮아요', 5.0);

