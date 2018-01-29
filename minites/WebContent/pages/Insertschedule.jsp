<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" media="all" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
	type="text/javascript"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"
	type="text/javascript"></script>

<!-- Bootstrap core CSS -->
<link href="../assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="../assets/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="../assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="../assets/js/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css"
	href="../assets/lineicons/style.css">

<!-- 전체캘린더 -->
<!-- <link rel="stylesheet" type="text/css" href="../assets/js/fullcalendar/bootstrap-fullcalendar.css"/> -->

<!-- Custom styles for this template -->
<link href="../assets/css/style.css" rel="stylesheet">
<link href="../assets/css/style-responsive.css" rel="stylesheet">


<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="../assets/js/chart-master/Chart.js"></script>
<title>회의 일정 등록</title>
<script>
	// 회의 시작 시간 
	$(function() {
		$("#meeting_start0").datepicker(
				{
					closeText : '닫기',
					dateFormat : 'yy-mm-dd',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년'
				});

		//회의 끝 시간 텍스트 필드 누르면 달력 뜸 
		$("#meeting_end0").datepicker(
				{
					closeText : '닫기',
					dateFormat : 'yy-mm-dd',
					prevText : '이전 달',
					nextText : '다음 달',
					monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월',
							'8월', '9월', '10월', '11월', '12월' ],
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					showMonthAfterYear : true,
					yearSuffix : '년'
				});
	});
</script>

<script type="text/javascript">
	var CLIENT_ID = '309038424016-bi3dtsk9fbm4cv8armq7j6i1bkt2qd1p.apps.googleusercontent.com';

	var SCOPES = [ "https://www.googleapis.com/auth/calendar" ];

	/**
	 * 현재 사용자가 이 프로그램을 승인했는지 체크
	 */
	function checkAuth() {
		gapi.auth.authorize({
			'client_id' : CLIENT_ID,
			'scope' : SCOPES.join(' '),
			'immediate' : true
		// 승인했으면 
		}, handleAuthResult); // handleAuthResult실행
	}

	/** 권한 서버에서 응답 처리*/
	function handleAuthResult(authResult) {
		//var authorizeDiv = document.getElementById('authorize-div');
		//if (authResult && !authResult.error) {
		//   authorizeDiv.style.display = 'none';
		loadCalendarApi();
		// } else {
		//  authorizeDiv.style.display = 'inline';
		// }
	}

	function loadCalendarApi() { // 구글 캘린더 클라이언트 라이브러리 로드, 업커밍 이벤트 로드
		var title = document.getElementById('title').value;

		var meeting_start0 = document.getElementById('meeting_start0').value;
		var meeting_start1 = document.getElementById('meeting_start1').value;
		var meeting_start2 = document.getElementById('meeting_start2').value;

		var meeting_end0 = document.getElementById('meeting_end0').value;
		var meeting_end1 = document.getElementById('meeting_end1').value;
		var meeting_end2 = document.getElementById('meeting_end2').value;

		var place = document.getElementById('place').value;

		var meeting_start = meeting_start0 + 'T' + meeting_start1 + ':'
				+ meeting_start2 + ':00';
		var meeting_end = meeting_end0 + 'T' + meeting_end1 + ':'
				+ meeting_end2 + ':00';

		var meeting_participants = document.getElementById('participants').value;

		// 폼쳌
		if (title != '' && place != '' && meeting_start != ''
				&& meeting_end != '' && meeting_participants != '') {
			gapi.client.load('calendar', 'v3', createEvent);
		} else {
			return false;
		}
	}

	function createEvent() {
		// Refer to the JavaScript quickstart on how to setup the environment:
		// https://developers.google.com/google-apps/calendar/quickstart/js
		// Change the scope to 'https://www.googleapis.com/auth/calendar' and delete any
		// stored credentials.
		var title = document.getElementById('title').value;//회의제목

		var meeting_start0 = document.getElementById('meeting_start0').value; //달력
		var meeting_start1 = document.getElementById('meeting_start1').value; // 시
		var meeting_start2 = document.getElementById('meeting_start2').value; // 분

		var meeting_end0 = document.getElementById('meeting_end0').value; // 달력
		var meeting_end1 = document.getElementById('meeting_end1').value; // 시
		var meeting_end2 = document.getElementById('meeting_end2').value; // 분

		var place = document.getElementById('place').value; // 회의 제목

		// 미팅 시작 시간, 끝시간을 정해진 구글이 원하는 포맷으로 보내주기
		var meeting_start = meeting_start0 + 'T' + meeting_start1 + ':'
				+ meeting_start2 + ':00';//회의 시작 시간
		var meeting_end = meeting_end0 + 'T' + meeting_end1 + ':'
				+ meeting_end2 + ':00'; // 회의 끝 시간

		var meeting_participants = document.getElementById('participants').value; //참석자들
		var userId =  "<%=session.getAttribute("user_email")%>"
		var participants = meeting_participants.split(',');
		var part_no = participants.length;
		participants[part_no] = userId;
		console.log('participants');
		/* 
		var userId = '@Request.RequestContext.HttpContext.Session["user_email"]';
		var participants = ['seekmj21@gmail.com',  'aileen1908@naver.com', 'gangsgm@gmail.com']; */

		// 미팅 일정
		var event = {
			'summary' : title,//미팅 제목
			'location' : place,//장소
			//'description': 'A chance to hear more about Google\'s developer products.',
			'start' : {//시작시간
				'dateTime' : meeting_start,
				'timeZone' : 'Asia/Seoul'
			},
			'end' : {// 끝시간
				'dateTime' : meeting_end,
				'timeZone' : 'Asia/Seoul'
			},
			'attendees' : [//참가자

			//{ 'email' : '이메일주소'}

			],
			'reminders' : {//알림기능
				'useDefault' : false,
				'overrides' : [ {
					'method' : 'email',
					'minutes' : 1
				}, //1분전
				{
					'method' : 'popup',
					'minutes' : 1
				} ]
			}
		};
		//참석자 포문!
		for (var cnt = 0; cnt < participants.length; cnt++) {
			event.attendees.push({
				"email" : participants[cnt]
			});
		}

		var request = gapi.client.calendar.events.insert({
			'sendNotifications' : true,// 참가자들에게 초대메일 보내기
			'calendarId' : 'primary',
			'resource' : event
		});

		request.execute(function(event) {
			appendPre('Event created: ' + event.htmlLink);
		});
		
		this.close();//창닫기
		// 일정만 등록할 때
		location.href = "../Meeting/insertschedule.action?title=" + title+ "&meeting_start=" + meeting_start + "&meeting_end="
				+ meeting_end + "&place=" + place ;
		
		opener.location.reload();//새로고침

	}
	
</script>
<script src="https://apis.google.com/js/client.js?onload=checkAuth"></script>
</head>
<body>
	<div class="container">
		<table class="table table-hover" style="width: 700px" align="center">
			<tr>
				<td colspan="4" align="left">
					<h1>회의 일정 등록</h1>
				</td>
			</tr>

			<tr>
				<td style="font-size: x-large; width: 200px">회의 제목</td>
				<td colspan="3"><input type="text" name="title" id="title"
					class="form-control"
					style="height: 40px; width: 485px; font-size: 18px" /></td>

			</tr>
			<tr>
				<td style="font-size: x-large;">장소</td>
				<td colspan="3"><input type="text" name="place" id="place"
					class="form-control"
					style="height: 40px; width: 485px; font-size: 18px" /></td>
			</tr>
			<tr>
				<td style="font-size: x-large;">회의 시작시간</td>
				<td style="width: 150px"><input type="text"
					name="meeting_start0" id="meeting_start0" placeholder="날짜"
					class="form-control"
					style="height: 40px; width: 150px; font-size: 18px" /><br></td>
				<td style="width: 150px"><input type="text"
					name="meeting_start1" id="meeting_start1" placeholder="시"
					class="form-control"
					style="height: 40px; width: 150px; font-size: 18px" /></td>
				<td style="width: 150px"><input type="text"
					name="meeting_start2" id="meeting_start2" placeholder="분"
					class="form-control"
					style="height: 40px; width: 150px; font-size: 18px" /></td>
			</tr>
			<tr>
				<td style="font-size: x-large;">회의 끝시간</td>
				<td style="width: 150px"><input type="text" name="meeting_end0"
					id="meeting_end0" placeholder="날짜" class="form-control"
					style="height: 40px; width: 150px; font-size: 18px" /><br></td>
				<td style="width: 150px"><input type="text" name="meeting_end1"
					id="meeting_end1" placeholder="시" class="form-control"
					style="height: 40px; width: 150px; font-size: 18px" /></td>
				<td style="width: 150px"><input type="text" name="meeting_end2"
					id="meeting_end2" placeholder="분" class="form-control"
					style="height: 40px; width: 150px; font-size: 18px" /></td>
			</tr>
			<tr>
				<td style="font-size: x-large;">참석자</td>
				<td colspan="3"><input type="text" name="participants"
					id="participants" class="form-control"
					style="height: 40px; width: 485px; font-size: 18px"
					placeholder="ex)abc@minites.com, def@minites.com" /></td>
			</tr>
			<tr align="center">
				<td colspan="4"><input type="button" class="btn btn-default"
					value="일정추가" style="font-size: 18px" onclick="loadCalendarApi()">
				</td>
			</tr>


			<%-- 참가자:<s:textfield name="email" id="email"/><br> --%>

		</table>
	</div>
	<script>
		
	</script>


</body>
</html>