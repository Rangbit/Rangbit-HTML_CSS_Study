-- Board 게시판 테이블 생성
-- auto_increment 값을 넣지않아도 자동으로 +1
-- default now() 기본값으로 현재값 넣기
-- 작성할 때 드래그해서 alt + X
create table board(
	idx int not null auto_increment,
	title varchar(100) not null,
	content varchar(2000) not null,
	writer varchar(100) not null,
	indate datetime default now(),
	count int default 0,
	primary key(idx)
)

-- test data insert
insert into board(title, content, writer)
values('월요일은 집에가고싶어', '월요일 좋아~ 아니야 안좋아~', 'Me');
insert into board(title, content, writer)
values('화요일은 집에가고싶어', '화요일 좋아~ 아니야 안좋아~', 'Me');
insert into board(title, content, writer)
values('수요일은 집에가고싶어', '수요일 좋아~ 아니야 안좋아~', 'Me');

-- 값 조회하기
select * from board;


drop table member;
-- 회원 테이블 생성하기
create table member(
	memIdx int auto_increment,
	memId varchar(20) not null unique,
	memPw varchar(20) not null,
	memName varchar(20) not null,
	memAge int,
	memGender varchar(20),
	memEmail varchar(20),
	memProfile varchar(50),
	primary key(memIdx)
);

insert into member(memId, memPw, memName, memAge, memGender, memEmail)
values('test1', '1234', 'tester1', 20, 'male', 'test@gmail.com');
insert into member(memId, memPw, memName, memAge, memGender, memEmail)
values('test2', '1234', 'tester2', 21, 'female', 'test@gmail.com');
insert into member(memId, memPw, memName, memAge, memGender, memEmail)
values('test3', '1234', 'tester3', 22, 'male', 'test@gmail.com');

select * from member;














