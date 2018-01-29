-- 주별 통계
/*ceil: 소수점이 있는 경우 주어진 값보다 큰 정수값을 출력해줌
  substrb: byte단위로 자름, 참고: substr은 글자 단위로 자름
   날짜함수 d: 해당 날짜의 요일을 숫자로 출력. 예) 일요일 1
  식: (현재 날짜  + 7 - 해당 날짜의 요일) / 7  *표준 계산법에 따르려면 +7 을 빼줘야함(검토 필요), 그러나 일상적으로 표준계산법에 따르지않고 사용 
  표준계산법: 국가표준의 " 날짜 및 시간 표기기준에 의하면 한주의 첫날은 월요일 입니다.
		   첫번째 주를 정하는 기준은  "첫번째 주는 4일을 포함한다"   
*/
SELECT 
    TO_CHAR(inputdate,'YYYYMMDD') AS "날짜", to_char(inputdate,'dy'), count(meeting_no) 
    ,CEIL((TO_NUMBER(SUBSTRB(TO_CHAR(inputdate,'YYYYMMDD'), -2, 2)) + 7 - TO_NUMBER(TO_CHAR(TO_DATE(TO_CHAR(inputdate,'YYYYMMDD'),'YYYYMMDD'),'D')))/7) AS "a"
FROM meeting  group by inputdate  

-- 월별 통계
/*월별 통계:
count 함수를 이용해서 횟수를 구한다. 
아래의 두 가지 방법이있다.
1.날짜의 경우 meeting 테이블의 inputdate 작성날짜컬럼이 기준

이 된다.
inputdate 출력된 날짜를 substr로 (예:198511) 월 단위로 끊어서
출력한다.

2. to_char(inputdate,'mm')을 이용하면 char형으로 월을 숫자로 

반환한다.

그럼 출력된 데이터는 월 단위로 출력

month count(meeting_no)
1	1
2	5
3	6
.	.
/*
 * 
 */*
 * 개최자 참석자 타이틀 날짜
 *select distinct m.title, m.user_id, j.PARTICIPANTS_ID, j.meeting_no
from minites_meeting m, MINITES_INVITE i, minites_join j
where m.USER_ID=i.USER_ID 
and j.MEETING_NO=m.MEETING_NO
and j.USER_ID='ady851124@gmail.com'
order by m.title; 
*/
 */
 
 
 <?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<!-- 회의록 관련 맵퍼 -->
<mapper namespace="StatMapper">

<!-- 이번 달 -> 총 통계 --> 
<select id="month_total_list" resultType="stat" parameterType="string">
select 
      substr(sysdate,1,2) year_month,
      substr(sysdate,4,2) month_month,
      count(distinct m.goal) total_title_month
      ,count(distinct m.meeting_no) total_count_month
      ,trunc(sum((to_number(substr(m.meeting_end,12,2))*60+to_number(substr(m.meeting_end,15,2)))
			-(to_number(substr(m.meeting_start,12,2))*60+to_number(substr(m.meeting_start,15,2))))/60,1) total_time_month 
from minites_meeting m
where m.user_id=#{value}
and substr(inputdate,4,2)=substr(sysdate,4,2)
group by substr(sysdate,4,2)
 </select>
 
 <!-- 이번 달 -> 몇 명 만났나 -->
<select id="howmanymonth" resultType="string" parameterType="string">
select count(distinct i.participants_id) total_person_month
from minites_meeting m, minites_invite i 
where m.user_id=#{value}
and m.user_id=i.user_id
and substr(m.inputdate,4,2)=substr(sysdate,4,2)
</select>



<!-- 이번 달 -> 그래프 -->
<!-- 1월 -->
<select id="month_graph_list_1" resultType="stat" parameterType="string">
	select 
			'1월' graph_month,
			nvl(count(meeting_no),0) graph_count_month,
			nvl(trunc(sum((to_number(substr(meeting_end,12,2))*60+to_number(substr(meeting_end,15,2)))
			-(to_number(substr(meeting_start,12,2))*60+to_number(substr(meeting_start,15,2))))/60,1),0) graph_time_month 
	from
		 	 minites_meeting
	where    		
			user_id=#{value}
	and 			
			substr(inputdate,4,2)=1			
</select>
<!-- 2월 -->
<select id="month_graph_list_2" resultType="stat" parameterType="string">
	select 
			'2월' graph_month,
			nvl(count(meeting_no),0) graph_count_month,
			nvl(trunc(sum((to_number(substr(meeting_end,12,2))*60+to_number(substr(meeting_end,15,2)))
			-(to_number(substr(meeting_start,12,2))*60+to_number(substr(meeting_start,15,2))))/60,1),0) graph_time_month 
	from
		 	 minites_meeting
	where    		
			user_id=#{value}
	and 			
			substr(inputdate,4,2)=2			
</select>
<!-- 3월 -->
<select id="month_graph_list_3" resultType="stat" parameterType="string">
	select 
			'3월' graph_month,
			nvl(count(meeting_no),0) graph_count_month,
			nvl(trunc(sum((to_number(substr(meeting_end,12,2))*60+to_number(substr(meeting_end,15,2)))
			-(to_number(substr(meeting_start,12,2))*60+to_number(substr(meeting_start,15,2))))/60,1),0) graph_time_month 
	from
		 	 minites_meeting
	where    		
			user_id=#{value}
	and 			
			substr(inputdate,4,2)=3			
</select>
<!-- 4월 -->
<select id="month_graph_list_4" resultType="stat" parameterType="string">
	select 
			'4월' graph_month,
			nvl(count(meeting_no),0) graph_count_month,
			nvl(trunc(sum((to_number(substr(meeting_end,12,2))*60+to_number(substr(meeting_end,15,2)))
			-(to_number(substr(meeting_start,12,2))*60+to_number(substr(meeting_start,15,2))))/60,1),0) graph_time_month 
	from
		 	 minites_meeting
	where    		
			user_id=#{value}
	and 			
			substr(inputdate,4,2)=4			
</select>
<!-- 5월 -->
<select id="month_graph_list_5" resultType="stat" parameterType="string">
	select 
			'5월' graph_month,
			nvl(count(meeting_no),0) graph_count_month,
			nvl(trunc(sum((to_number(substr(meeting_end,12,2))*60+to_number(substr(meeting_end,15,2)))
			-(to_number(substr(meeting_start,12,2))*60+to_number(substr(meeting_start,15,2))))/60,1),0) graph_time_month 
	from
		 	 minites_meeting
	where    		
			user_id=#{value}
	and 			
			substr(inputdate,4,2)=5			
</select>
<!-- 6월 -->
<select id="month_graph_list_6" resultType="stat" parameterType="string">
	select 
			'6월' graph_month,
			nvl(count(meeting_no),0) graph_count_month,
			nvl(trunc(sum((to_number(substr(meeting_end,12,2))*60+to_number(substr(meeting_end,15,2)))
			-(to_number(substr(meeting_start,12,2))*60+to_number(substr(meeting_start,15,2))))/60,1),0) graph_time_month 
	from
		 	 minites_meeting
	where    		
			user_id=#{value}
	and 			
			substr(inputdate,4,2)=6			
</select>
<!-- 7월 -->
<select id="month_graph_list_7" resultType="stat" parameterType="string">
	select 
			'7월' graph_month,
			nvl(count(meeting_no),0) graph_count_month,
			nvl(trunc(sum((to_number(substr(meeting_end,12,2))*60+to_number(substr(meeting_end,15,2)))
			-(to_number(substr(meeting_start,12,2))*60+to_number(substr(meeting_start,15,2))))/60,1),0) graph_time_month 
	from
		 	 minites_meeting
	where    		
			user_id=#{value}
	and 			
			substr(inputdate,4,2)=7			
</select>
<!-- 8월 -->
<select id="month_graph_list_8" resultType="stat" parameterType="string">
	select 
			'8월' graph_month,
			nvl(count(meeting_no),0) graph_count_month,
			nvl(trunc(sum((to_number(substr(meeting_end,12,2))*60+to_number(substr(meeting_end,15,2)))
			-(to_number(substr(meeting_start,12,2))*60+to_number(substr(meeting_start,15,2))))/60,1),0) graph_time_month 
	from
		 	 minites_meeting
	where    		
			user_id=#{value}
	and 			
			substr(inputdate,4,2)=8			
</select>
<!-- 9월 -->
<select id="month_graph_list_9" resultType="stat" parameterType="string">
	select 
			'9월' graph_month,
			nvl(count(meeting_no),0) graph_count_month,
			nvl(trunc(sum((to_number(substr(meeting_end,12,2))*60+to_number(substr(meeting_end,15,2)))
			-(to_number(substr(meeting_start,12,2))*60+to_number(substr(meeting_start,15,2))))/60,1),0) graph_time_month 
	from
		 	 minites_meeting
	where    		
			user_id=#{value}
	and 			
			substr(inputdate,4,2)=9			
</select>
<!-- 10월 -->
<select id="month_graph_list_10" resultType="stat" parameterType="string">
	select 
			'10월' graph_month,
			nvl(count(meeting_no),0) graph_count_month,
			nvl(trunc(sum((to_number(substr(meeting_end,12,2))*60+to_number(substr(meeting_end,15,2)))
			-(to_number(substr(meeting_start,12,2))*60+to_number(substr(meeting_start,15,2))))/60,1),0) graph_time_month 
	from
		 	 minites_meeting
	where    		
			user_id=#{value}
	and 			
			substr(inputdate,4,2)=10		
</select>
<!-- 11월 -->
<select id="month_graph_list_11" resultType="stat" parameterType="string">
	select 
			'11월' graph_month,
			nvl(count(meeting_no),0) graph_count_month,
			nvl(trunc(sum((to_number(substr(meeting_end,12,2))*60+to_number(substr(meeting_end,15,2)))
			-(to_number(substr(meeting_start,12,2))*60+to_number(substr(meeting_start,15,2))))/60,1),0) graph_time_month 
	from
		 	 minites_meeting
	where    		
			user_id=#{value}
	and 			
			substr(inputdate,4,2)=11			
</select>
<!-- 12월 -->
<select id="month_graph_list_12" resultType="stat" parameterType="string">
	select 
			'12월' graph_month,
			nvl(count(meeting_no),0) graph_count_month,
			nvl(trunc(sum((to_number(substr(meeting_end,12,2))*60+to_number(substr(meeting_end,15,2)))
			-(to_number(substr(meeting_start,12,2))*60+to_number(substr(meeting_start,15,2))))/60,1),0) graph_time_month 
	from
		 	 minites_meeting
	where    		
			user_id=#{value}
	and 			
			substr(inputdate,4,2)=12			
</select>


<!--  이번 주 -> 총 통계 -->
<select id="week_total_list" resultType="stat" parameterType="string">

select 
    substr(inputdate,4,2) AS "month_week",
    count(meeting_no) as "total_count_week",
    count(distinct goal) as "total_title_week",
    sum((to_number(substr(meeting_end,12,2))*60+to_number(substr(meeting_end,15,2)))
			-(to_number(substr(meeting_start,12,2))*60+to_number(substr(meeting_start,15,2)))) total_time_week,
    CEIL((TO_NUMBER(SUBSTRB(TO_CHAR(inputdate,'YYYYMMDD'), -2, 2))+7
    - TO_NUMBER(TO_CHAR(TO_DATE(TO_CHAR(inputdate,'YYYYMMDD'),'YYYYMMDD'),'D')))/7) AS "week_week"
from 
    minites_meeting
where
    substr(sysdate,4,2)=substr(inputdate,4,2)
and 
    CEIL((TO_NUMBER(SUBSTRB(TO_CHAR(inputdate,'YYYYMMDD'), -2, 2))+7
    - TO_NUMBER(TO_CHAR(TO_DATE(TO_CHAR(inputdate,'YYYYMMDD'),'YYYYMMDD'),'D')))/7)=
    CEIL((TO_NUMBER(SUBSTRB(TO_CHAR(sysdate,'YYYYMMDD'), -2, 2))+7
    - TO_NUMBER(TO_CHAR(TO_DATE(TO_CHAR(sysdate,'YYYYMMDD'),'YYYYMMDD'),'D')))/7)
and
	user_id=#{value}    
group by
    CEIL((TO_NUMBER(SUBSTRB(TO_CHAR(inputdate,'YYYYMMDD'), -2, 2))+7
    - TO_NUMBER(TO_CHAR(TO_DATE(TO_CHAR(inputdate,'YYYYMMDD'),'YYYYMMDD'),'D')))/7),substr(inputdate,4,2) 
	
</select>

 <!-- 이번 주ㅡ -> 몇 명 만났나 -->
<select id="howmanyweek" resultType="string" parameterType="string">
select 
     count(distinct i.participants_id) total_person_month
from 
   minites_meeting m, minites_invite i 
where
	m.USER_ID=i.USER_ID
and 
    CEIL((TO_NUMBER(SUBSTRB(TO_CHAR(m.inputdate,'YYYYMMDD'), -2, 2))
    - TO_NUMBER(TO_CHAR(TO_DATE(TO_CHAR(m.inputdate,'YYYYMMDD'),'YYYYMMDD'),'D')))/7)=
    CEIL((TO_NUMBER(SUBSTRB(TO_CHAR(sysdate,'YYYYMMDD'), -2, 2))
    - TO_NUMBER(TO_CHAR(TO_DATE(TO_CHAR(sysdate,'YYYYMMDD'),'YYYYMMDD'),'D')))/7)
and
	m.user_id=#{value}
group by
    CEIL((TO_NUMBER(SUBSTRB(TO_CHAR(m.inputdate,'YYYYMMDD'), -2, 2))
    - TO_NUMBER(TO_CHAR(TO_DATE(TO_CHAR(m.inputdate,'YYYYMMDD'),'YYYYMMDD'),'D')))/7)
</select>

<!-- 이번 주 -> 그래프 -->
<select id="week_graph_list" resultType="stat" parameterType="string">
 select
 to_char(inputdate,'dy') "graph_we",
    to_char(inputdate,'d') "graph_wed"
 	  ,count(inputdate) "graph_count_week"
 	  ,sum((to_number(substr(meeting_end,12,2))*60+to_number(substr(meeting_end,15,2)))
		-(to_number(substr(meeting_start,12,2))*60+to_number(substr(meeting_start,15,2)))) "graph_time_week"
     ,CEIL((TO_NUMBER(SUBSTRB(TO_CHAR(inputdate,'YYYYMMDD'), -2, 2))
      - TO_NUMBER(TO_CHAR(TO_DATE(TO_CHAR(inputdate,'YYYYMMDD'),'YYYYMMDD'),'D')))/7) "week_week"
from
    minites_meeting
where
	CEIL((TO_NUMBER(SUBSTRB(TO_CHAR(inputdate,'YYYYMMDD'), -2, 2))
    - TO_NUMBER(TO_CHAR(TO_DATE(TO_CHAR(inputdate,'YYYYMMDD'),'YYYYMMDD'),'D')))/7)=
    CEIL((TO_NUMBER(SUBSTRB(TO_CHAR(sysdate,'YYYYMMDD'), -2, 2))
    - TO_NUMBER(TO_CHAR(TO_DATE(TO_CHAR(sysdate,'YYYYMMDD'),'YYYYMMDD'),'D')))/7)
and
	user_id=#{value}
	
group by
    to_char(inputdate,'d'),CEIL((TO_NUMBER(SUBSTRB(TO_CHAR(inputdate,'YYYYMMDD'), -2, 2))
    - TO_NUMBER(TO_CHAR(TO_DATE(TO_CHAR(inputdate,'YYYYMMDD'),'YYYYMMDD'),'D')))/7),
    to_char(inputdate,'dy')
order by
	to_char(inputdate,'d') asc
</select>

<!-- 안건 별 그래프 -->
<select id="agenda" resultType="stat" parameterType="string">
select
 		 substr(inputdate,4,2) month_agenda
 		 ,title title_agenda
 		 ,count(title) count_agenda,
 		 sum((to_number(substr(meeting_end,12,2))*60+to_number(substr(meeting_end,15,2)))
		-(to_number(substr(meeting_start,12,2))*60+to_number(substr(meeting_start,15,2)))) runtime_agenda
from
 		  minites_meeting 
where 
 		  substr(inputdate,4,2)=substr(sysdate,4,2)
and
		user_id=#{value} 		   
group by 	
 		  title
 		  ,substr(inputdate,4,2)
order by 
		  substr(inputdate,4,2) asc
<!-- where user id 추가 -->
</select>

<!-- 지난 달 통계 -->
<select id="last_month" parameterType="hashmap" resultType="stat">
select 
      substr(m.inputdate,1,2) year_month,
      substr(m.inputdate,4,2) month_month,
      count(distinct m.goal) total_title_month
      ,count(distinct m.meeting_no) total_count_month
      ,trunc(sum((to_number(substr(m.meeting_end,12,2))*60+to_number(substr(m.meeting_end,15,2)))
			-(to_number(substr(m.meeting_start,12,2))*60+to_number(substr(m.meeting_start,15,2))))/60,1) total_time_month 
from minites_meeting m
where 
	m.user_id=#{user_email} 
and 
	substr(m.inputdate,4,2)=#{lastmonth}
group by substr(m.inputdate,4,2), substr(m.inputdate,1,2)
</select>

<!-- 지난 달 몇명 -->
<select id="last_met_people" resultType="string" parameterType="hashmap">
select count(distinct i.participants_id) total_person_month
from minites_meeting m, minites_invite i 
where m.user_id=#{user_email}
and substr(m.inputdate,4,2)=#{lastmonth}
and m.user_id=i.user_id
</select>

<!-- 다음 달 통계 -->
<select id="next_month" parameterType="hashmap" resultType="stat">
select 
      substr(m.inputdate,1,2) year_month,
      substr(m.inputdate,4,2) month_month,
      count(distinct m.goal) total_title_month
      ,count(distinct m.meeting_no) total_count_month
      ,trunc(sum((to_number(substr(m.meeting_end,12,2))*60+to_number(substr(m.meeting_end,15,2)))
			-(to_number(substr(m.meeting_start,12,2))*60+to_number(substr(m.meeting_start,15,2))))/60,1) total_time_month 
from minites_meeting m
where 
	m.user_id=#{user_email} 
and 
	substr(m.inputdate,4,2)=#{nextmonth}
group by substr(m.inputdate,4,2), substr(m.inputdate,1,2)
</select>

<!-- 다음 달 몇명 -->
<select id="next_met_people" resultType="string" parameterType="hashmap">
select count(distinct i.participants_id) total_person_month
from minites_meeting m, minites_invite i 
where m.user_id=#{user_email}
and substr(m.inputdate,4,2)=#{nextmonth}
and m.user_id=i.user_id
</select>

<!-- 이번 달; 통계 테이블 정보 -->
<select id="month_table_list" resultType="stat" parameterType="string">
select distinct m.title, m.user_id, j.PARTICIPANTS_ID, j.meeting_no, m.INPUTDATE,
        m.place, substr(m.MEETING_START,12,5) starttime, substr(m.MEETING_END,12,5) endtime
from minites_meeting m, MINITES_INVITE i, minites_join j
where m.USER_ID=i.USER_ID 
and j.MEETING_NO=m.MEETING_NO
and j.USER_ID=#{value}
and substr(m.inputdate,4,2)=substr(sysdate,4,2)
order by m.title
</select>

</mapper>



