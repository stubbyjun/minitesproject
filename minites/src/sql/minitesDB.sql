-- 사용자
create table minites_user(
  email varchar2(100) primary key,    -- 이메일
  name varchar2(50) not null,         -- 이름
  phone varchar2(50),				  -- 전화번호
  photo varchar2(50)				  -- 사진
);

-- 회의록
create table minites_meeting(
  meeting_no varchar2(100) primary key,					-- 회의록 번호
  title varchar2(100) not null,							-- 회의제목
  user_id VARCHAR2(50) not null,-- 사용자 이메일
  inputdate date default sysdate,						-- 작성 날짜
  meeting_start varchar2(50) not null,					-- 회의 시작시간
  meeting_end varchar2(50) not null,					-- 회의 끝난시간
  runtime number,										-- 회의시간
  goal varchar2(200),									-- 회의목표
  place varchar2(200),									-- 회의장소
  updater varchar2(100),								-- 수정한 사람
  update_time date default sysdate,						-- 수정한 시간
  CONSTRAINT fk_user_id foreign key (user_id) REFERENCES minites_user(email) ON DELETE CASCADE
);



-- 안건
create table minites_agenda (
  agenda_no varchar2(100) primary key,								-- 안건 번호
  contents varchar2(2000) not null,										-- 안건 s내용
  inputdate date default sysdate,									-- 안건 작성시간
  meeting_no varchar2(100) not null,	-- 회의록 번호
  CONSTRAINT fk_agenda_meeting_no foreign key (meeting_no) REFERENCES minites_meeting(meeting_no) ON DELETE CASCADE-- 수정한 시간
);

-- 참여자
create table minites_participants(
  email varchar2(100) primary key,							-- 참여자 이메일
  name varchar2(50),								-- 참여자 이름
  phone varchar2(50),										-- 참여자 전화번호
  photo varchar2(50),										-- 참여자 사진
  meeting_no varchar2(100),	-- 회의록 번호
  CONSTRAINT fk_participants_meeting_no foreign key (meeting_no) REFERENCES minites_meeting(meeting_no) ON DELETE CASCADE
);


-- 참가
create table minites_join (
  join_no number primary key,											-- 참가 번호
  participants_id varchar2(100) REFERENCES minites_participants(email) not null,-- 참가자 이메일
  user_id varchar2(100) REFERENCES minites_user(email) not null,				-- 사용자 이메일
  meeting_no varchar2(100) REFERENCES minites_meeting(meeting_no) not null		-- 회의록 번호
);


-- 초대
create table minites_invite (
  invite_no number primary key,											-- 초대 번호
  user_id varchar2(100) REFERENCES minites_user(email) not null, 				-- 사용자 이메일
  participants_id varchar2(100) REFERENCES minites_participants(email) not null -- 참여자 이메일
);

-- 발언
create table minites_statesment (
  stmt_no varchar2(100) primary key,							-- 발언 번호
  contents varchar2(4000),												-- 발언 내용
  inputdate date default sysdate,								-- 발언 작성날짜
  agenda_no varchar2(100) not null,-- 안건 번호
  CONSTRAINT fk_agenda_no foreign key (agenda_no) REFERENCES minites_agenda(agenda_no) ON DELETE CASCADE
);
select * from MINITES_todo;
-- 할일
create table minites_todo (
  todo_no varchar2(100) primary key,							   -- 할 일 번호
  stmt_no varchar2(100) not null,  -- 발언 번호
  todo_email varchar2(100) REFERENCES minites_participants(email) not null, -- 할 일 담당자
  todo_user varchar2(100),--커멘트 작성자 이름
  contents varchar2(1000),										   -- 할 일 내용
  inputdate date default sysdate,								   -- 할 일 작성시간
  duedate varchar2(50) not null, 								   -- 마감 날짜
  updater varchar2(100),                          				   -- 수정한 사람
  update_time date default sysdate,								   -- 수정한 시간
  CONSTRAINT fk_todo_stmt_no foreign key (stmt_no) REFERENCES minites_statesment(stmt_no) ON DELETE CASCADE
);
select * from minites_meeting;
-- 커멘트
create table minites_comment (
  comment_no varchar2(100) primary key,								 -- 커멘트 번호
  comment_email varchar2(100) REFERENCES minites_participants(email) not null,-- 커멘트 작성자 이메일
  comment_user varchar2(100),--커멘트 작성자 이름
  contents varchar2(1000),											 -- 커멘트 내용
  inputdate date default sysdate,									 -- 커멘트 작성시간
  stmt_no varchar2(100) not null, 	 -- 발언 번호
  updater varchar2(100),											 -- 수정한 사람
  update_time date default sysdate,									 -- 수정한 시간
  CONSTRAINT fk_comment_stmt_no foreign key (stmt_no) REFERENCES minites_statesment(stmt_no) ON DELETE CASCADE
);
-- 회의록 수정

create table minites_update (
  content_no varchar2(100) not null, -- 수정한 콘텐츠 종류
  users varchar2(100) not null,		 -- 수정한 사람
  inputdate date not null			 -- 수정한 시간
);


CREATE SEQUENCE seq_join INCREMENT BY 1 START WITH 1000; --JOIN 테이블 시퀀스테이블
 CREATE SEQUENCE seq_invite INCREMENT BY 1 START WITH 1000; -- INVITE 테이블 시퀀스 테이블


commit;

select * from minites_agenda;
select * from MINITES_STATESMENT;




desc minites_meeting;
desc minites_user;
drop table minites_update;
drop table minites_todo;
drop table minites_comment;
drop table minites_statesment;
drop table minites_agenda;
drop table minites_join;
drop table minites_invite;
drop table minites_participants;
drop table minites_meeting;
drop table minites_user;

commit;



