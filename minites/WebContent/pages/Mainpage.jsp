<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
     
     <!-- 오늘 날짜 구하기 -->
    <%@ page import="java.util.*, java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	
	<!-- 아이콘 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>


    <title>Minites</title>

    <!-- Bootstrap core CSS -->
    <link href="../assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="../assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="../assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="../assets/lineicons/style.css">    
    
    <!-- Custom styles for this template -->
    <link href="../assets/css/style.css" rel="stylesheet">
    <link href="../assets/css/style-responsive.css" rel="stylesheet">

   	<link href='../calendar/fullcalendar.css' rel='stylesheet' />
	<link href='../calendar/fullcalendar.print.css' rel='stylesheet' media='print' />
	<script src='../calendar/moment.min.js'></script>
	<script src='../calendar/fullcalendar.min.js'></script>
	
	<script src="../calendar/fullcalendar/gcal.js" type="text/javascript"></script>

    <script src="../assets/js/chart-master/Chart.js"></script>
   
	
	<script type="text/javascript">
		function insertm() {
			var title = document.getElementById('tit').value;
			var inputdate = document.getElementById('inputdate').value;
			var start = document.getElementById('start').value;
			
			location.href="../Meeting/Todolist.action?title="+title+"&inputdate="+inputdate+"&meeting_start="+start;
		}
		
	</script>
	
	 <script type="text/javascript">
    	function insertschedule(){
    		window.open("goschedule.action","회의 일정 추가","top=200,left=450,width=750,height=450,resizable=no,scrollbar=no");
    		
    	}
    </script>
	
	
	  
    <!-- *****데이트피터 & 구글 캘린더 연동********************************************************************************************** -->
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>
	


	  <!-- Bootstrap core CSS -->
    <link href="../assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="../assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="../assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="../assets/lineicons/style.css">    
    
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
	  $( "#meeting_start0" ).datepicker({
		closeText: '닫기',
	    dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    showMonthAfterYear: true,
	    yearSuffix: '년'
	  }); 
	  
	//회의 끝 시간 텍스트 필드 누르면 달력 뜸 
	   $( "#meeting_end0" ).datepicker({
		    closeText: '닫기',
		    dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    showMonthAfterYear: true,
		    yearSuffix: '년'
		  });
	}); 
</script>

<script type="text/javascript">

	var CLIENT_ID = '309038424016-bi3dtsk9fbm4cv8armq7j6i1bkt2qd1p.apps.googleusercontent.com';
	
	var SCOPES = ["https://www.googleapis.com/auth/calendar"];

		 /**
	       * 현재 사용자가 이 프로그램을 승인했는지 체크
	       */
	      function checkAuth() {
	        gapi.auth.authorize(
	          {
	            'client_id': CLIENT_ID,
	            'scope': SCOPES.join(' '),
	            'immediate': true // 승인했으면 
	          }, handleAuthResult); // handleAuthResult실행
	      }

	      /** 권한 서버에서 응답 처리*/
	      function handleAuthResult(authResult) {  
	    	  var authorizeDiv = document.getElementById('authorize-div');
	          if (authResult && !authResult.error) {
	            authorizeDiv.style.display = 'none';
	            loadCalendarApi();
	          } else {
	            authorizeDiv.style.display = 'inline';
	          }
	      } 

	      /**권한 받기*/
	      function handleAuthClick(event) {
	        gapi.auth.authorize(
	          {client_id: CLIENT_ID, scope: SCOPES, immediate: false},
	          handleAuthResult);
	        return false;
	      }

	      function loadCalendarApi() { // 구글 캘린더 클라이언트 라이브러리 로드, 업커밍 이벤트 로드
	    	var title=document.getElementById('title').value;
	    	
	    	var meeting_start0 =document.getElementById('meeting_start0').value;
	    	var meeting_start1 =document.getElementById('meeting_start1').value;
	    	var meeting_start2 =document.getElementById('meeting_start2').value;
	    	
	    	var meeting_end0 =document.getElementById('meeting_end0').value;
	    	var meeting_end1 =document.getElementById('meeting_end1').value;
	    	var meeting_end2 =document.getElementById('meeting_end2').value;
	    	
	    	var place =document.getElementById('place').value;
	    	
	    	
	    	var meeting_start=meeting_start0+'T'+meeting_start1+':'+meeting_start2+':00';
	    	var meeting_end=meeting_end0+'T'+meeting_end1+':'+meeting_end2+':00';
	    	
	    	// 폼쳌
		    if(title!='' && place!='' && meeting_start!='' && meeting_end!='') {
	    		 gapi.client.load('calendar', 'v3', createEvent);	 
	    	 }
	    	 
	    	 return false;
	      }

	      /**이벤트 없으면 없다는 메세지 출력*/
	      function listUpcomingEvents() { // 업커밍 이벤트리스트
	    	  
	        var request = gapi.client.calendar.events.list({
	          'calendarId': 'primary',
	          'showDeleted': false,
	          'singleEvents': true,
	          'maxResults': 100, // 최대 출력 이벤트 갯 수
	          'orderBy': 'startTime'
	        	  
	        });

	        request.execute(function(resp) {
	        	
	          var events = resp.items;
	          appendPre('Upcoming events:'); // Pre에 'Upcoming events:' 붙이기

	          if (events.length > 0) { // 이벤트 있으면 
	            for (i = 0; i < events.length; i++) {
	              var event = events[i];
	              var when = event.start.dateTime;
	              if (!when) {
	                when = event.start.date;
	              }
	                appendPre(event.summary + ' (' + when + ')')
	            }
	          } else { // 이벤트 없으면
	            appendPre('No upcoming events found.');
	          }     		   
	        }); // execute
	      } // listUpcomingLists
			 
	      /**
	       * Append a pre element to the body containing the given message
	       * as its text node.
	       *
	       * @param {string} message Text to be placed in pre element.
	       */
	      function appendPre(message) {
	        var pre = document.getElementById('output');// 결과물들을 
	        var textContent = document.createTextNode(message + '\n'); // 이어서
	        pre.appendChild(textContent); // 붙임
	      }
			
	      
	       function createEvent() {
	    	// Refer to the JavaScript quickstart on how to setup the environment:
	    	// https://developers.google.com/google-apps/calendar/quickstart/js
	    	// Change the scope to 'https://www.googleapis.com/auth/calendar' and delete any
	    	// stored credentials.
			var title=document.getElementById('title').value;//회의제목
	    	
	        var meeting_start0 =document.getElementById('meeting_start0').value; //달력
	    	var meeting_start1 =document.getElementById('meeting_start1').value; // 시
	    	var meeting_start2 =document.getElementById('meeting_start2').value; // 분
	    	
	    	
	    	var meeting_end0 =document.getElementById('meeting_end0').value; // 달력
	    	var meeting_end1 =document.getElementById('meeting_end1').value; // 시
	    	var meeting_end2 =document.getElementById('meeting_end2').value; // 분
	    	
	    	var place =document.getElementById('place').value; // 회의 제목
	    	
	    	// 미팅 시작 시간, 끝시간을 정해진 구글이 원하는 포맷으로 보내주기
	    	var meeting_start=meeting_start0+'T'+meeting_start1+':'+meeting_start2+':00';//회의 시작 시간
	    	var meeting_end=meeting_end0+'T'+meeting_end1+':'+meeting_end2+':00'; // 회의 끝 시간
 
	    	// 미팅 일정
	    	var event = {
	    	  'summary': title,//미팅 제목
	    	  'location': place,//장소
	    	  //'description': 'A chance to hear more about Google\'s developer products.',
	    	  'start': {//시작시간
	    	    'dateTime': meeting_start,
	    	    'timeZone': 'Asia/Seoul'
	    	  },
	    	  'end': {// 끝시간
	    	    'dateTime': meeting_end,
	    	    'timeZone': 'Asia/Seoul'
	    	  },
	    	   'attendees': [//참가자
	    	    {'email': 'seekmj21@gmail.com'},
	    	    {'email': 'aileen1908@naver.com'}
	    	  ],
	    	  'reminders': {//알림기능
	    	    'useDefault': false,
	    	    'overrides': [
	    	      {'method': 'email', 'minutes': 24*60},
	    	      {'method': 'popup', 'minutes': 1}
	    	    ]
	    	  } 
	    	  
	    	  
	    	};
	    	
	    	var request = gapi.client.calendar.events.insert({
	    	  'sendNotifications' : true,// 참가자들에게 초대메일 보내기
	    	  'calendarId': 'primary',
	    	  'resource': event
	    	});

	    	request.execute(function(event) {
	    	  appendPre('Event created: ' + event.htmlLink);
	    	});
	     	
	    	this.close();//창닫기
	    	location.href="../Meeting/writeminites.action?title="+title+"&meeting_start="+meeting_start+"&meeting_end="+meeting_end+"&place="+place;
			opener.location.reload();//새로고침
	    	
	       }
</script>
    <script src="https://apis.google.com/js/client.js?onload=checkAuth"></script>
   	
   	<!-- 시간정렬 -->
   	<script type="text/javascript">
   	 function timesort(){
   		location.href="../Meeting/Meetinglist.action";
   	 }
   	</script>
   	
   	<!-- 제목정렬 -->
   	<script type="text/javascript">
   	function titlesort(){
   		location.href = "../Meeting/Titlesort.action";
   	}
   	</script>
   	
   	
<!-- pdf내보내기 폼1 -->
<script type="text/javascript">
function outpdf1(){
	
	var meeting_no = $('#outBtn1').attr('no');
	console.log('no : ' + meeting_no );
	
	location.href = "../Meeting/topdf1.action?meeting_no="+meeting_no+"&form_no=1";
	
	
/* 	location.href = "../Meeting/topdf1.action?meeting_no="+meeting_no;
 */}
</script>

<!-- pdf내보내기 폼2 -->   	   	
<script type="text/javascript">
function outpdf2(){
	var meeting_no = $('#outBtn2').attr('no');
	console.log('no : ' + meeting_no );
	
	location.href = "../Meeting/topdf2.action?meeting_no="+meeting_no+"&form_no=2";
	
	/* location.href="../Meeting/topdf2.action?meeting_no="+meeting_no; */
}


</script> 

<style>
	.content-panel{padding:13px;}
	#btn_meeting_add{
		display:scroll;position:fixed;bottom:60px;right:50px;
		-webkit-border-radius: 40px;
		-moz-border-radius: 40px;
		width:70px; height: 70px;
		-webkit-box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
  		-moz-box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
 		 box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19); "
 		 }
</style>

</head>

<!-- 여기서부터 body *************************************************************************************************************** -->
<body>
	<section id="container">
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box" >
                  <div class="fa fa-bars tooltips" data-placement="right"></div>
              </div>
              
	            <!--logo 새로고침 -->
	           <a href="../Meeting/Meetinglist.action" class="logo"><!-- <img src="../img/miniteslogo.png" width="70px" align="top"> --><b>MINITES</b></a>
	            <!--logo end-->
            	
            	<!-- 날짜 -->
	            <div class="top-menu">
	            	<ul class="nav pull-right top-menu">
	                    <li>                	
	                    </li>
	            	</ul>
	            </div>
	            
	            <!-- 로그아웃 버튼 -->
	            <div class = "log-out" class = "tab-pane fade">
	         		<a href = "https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://minites.me:8000/minites/Tutorial.jsp"><button type="button" class="btn btn-info">로그아웃</button></a>
	            </div>
	            
	            <!-- 캘린더 뷰로 이동 -->
        </header>
      <!--header end-->


      <!--Left sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse" >
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              	  	
                  <li class="sub-menu">
                      <a href="../Meeting/Meetinglist.action">
                          <span class="glyphicon glyphicon-th-list"></span>  미팅 목록
                      </a>
                  </li>

                  <li class="sub-menu">
                      <a href="../Meeting/Todolist.action">
                          <span class="glyphicon glyphicon-record"></span>  할 일 목록
                      </a> 
                  </li>

                  <li class="sub-menu">
                     <a href="../Meeting/Search.action" >
                          <span class="glyphicon glyphicon-search"></span>  검색
                      </a>
                  </li>
                  <li class="sub-menu">
                      <a href="../Statpage.action" >
                          <span class="glyphicon glyphicon-stats"></span>  통계
                      </a>
                  </li>
                  <li class="sub-menu">
                      <a href="../Meeting/Invite.action" >
                         <span class="glyphicon glyphicon-envelope"></span>  초대
                      </a>
                  </li>
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
            
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">

              <div class="row" >
                  <div class="col-lg-9 main-chart">
                  
                  	<!-- 미팅박스!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                  	<div style="text-align: center;">
                  		<br>
                        <h3 style="font-family: 'Jeju Gothic', serif;font-color:#424242;">
                        		
		                    	<%
	                    			Date today = new Date();
	                    			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일, E요일");
	                    			out.print(sdf.format(today));
	                    		%>
	                    		
	                    </h3>
	                    <hr style="border-width: thin;">
	                </div>
                  	<div class="row mtbox">
                  		
                  		<div class="col-sm-2 col-md-offset-3">
                  			
            					  <div class = "calendar-view" class = "tab-pane fade">
	          						  	 <a href="../Meeting/Calendarlist.action"><img src = "../img/calendars.png" width="100%" height="100%" style="filter:gray;filter: grayscale(100%);-webkit-filter: grayscale(100%);" align="middle"></a>
	          					  </div>

					  			<%-- <span class="li_heart"></span> --%>
					  		
			<%-- 		  			<h3><s:property value = "meeting_count"/>&nbsp;Meetings</h3>
			 --%>		  			
                  			
                  		</div>
                  		<div class="col-sm-2">
                  			<%-- <div class="box1">
					  			<span class="li_cloud"></span>
					  			<img alt="" src="../img/participants.png" width="100" height="100">
					  			
					  			<h3><s:property value = "partici_count"/>&nbsp;Participants</h3>
					  			
                  			</div> --%>
                  			    <div class = "calendar-view" >
	      					      	 <a href="../Meeting/Meetinglist.action"><img src = "../img/clipboard.png" width="100%" height="100%" align="middle"></a>
	         				   </div>
					  
					  
					  			<!-- <p>48 New files were added in your cloud storage.</p> -->
                  		</div>
                  		<%-- <div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<span class="li_stack"></span>
					  			<img alt="" src="../img/hours.png" width="100" height="100">
					  			
					  			<h3><s:property value = "runtime"/>&nbsp;Hours</h3>
					  			
                  			</div>
					  			<!-- <p>You have 23 unread messages in your inbox.</p> -->
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<span class="li_news"></span>
					  			<img alt="" src="../img/todo.png" width="100" height="100">
					  			
					  			<h3><s:property value = "todo_count"/>&nbsp;Todo</h3>
					  			
                  			</div>
                  		</div> --%>

                  	</div>
                  	
                  
      
      <!--main content start-->
      <!-- 이터레이터 -->
      
      <!-- 오늘 미팅 -->
     		 <!-- 창열기  -->
     		 
     		 <section id="table-content">
         	 <section class="wrapper">
 			   <div class="row mt">
                  <div class="col-md-12">
                      <div class="" > 
	                  	  	  <h4><i class="fa fa-angle-right"></i><b>Today's Meeting</b></h4>          	  	  

                          <table class="table table-striped table-advance table-hover">  
	                  	  	  <hr>
                              <thead>
                              <tr>
                                  <th><i class="glyphicon glyphicon-tag"></i>제목</th>
                                  <th class="hidden-phone"><i class="glyphicon glyphicon-calendar"></i>날짜</th>
                                  <th class="hidden-phone"><i class="glyphicon glyphicon-time"></i>시간</th>
                                  <th><i class="glyphicon glyphicon-home"></i>장소</th>
                                  <th><i class="glyphicon glyphicon-download-alt"></i>내보내기</th>
                              </tr>
                              </thead>
	
                             <s:iterator value = "todaylist" status = "stat">
                             <tbody>
                              <tr>
                                  <td>
                                 <%--  	<a href = "../Meeting/review.action?savedid=<s:property value="savedid"/>"><s:property value = "title"/></a> --%>
                                 	<a href = "../Meeting/review.action?savedid=<s:property value="meeting_no"/>"><s:property value = "title"/></a>
                                  </td>
                                  <td class="hidden-phone"><s:property value = "mstart"/></td>
                                  <td class="hidden-phone"><s:property value = "mtime"/></td>
                                  <td><s:property value = "place"/></td>
                                  <%-- <a href = "../Meeting/topdf.action?me<td>eting_no=${meeting_no}"><span class="label label-info label-mini">내보내기</span></a></td> --%>
                                  <input type = "hidden" value = "${meeting_no}" id = "m_no"/>
                              	  <td><a class="label label-info label-mini" data-toggle="modal" data-target="#Pdfout" data-no="${meeting_no}">PDF</a></td>
                              </tr>
                              </tbody>
                              </s:iterator>
                         
                             <s:if test="%{todaylist.isEmpty()}">
                             	<tbody>
									<tr><td colspan="5" align="center">오늘의 미팅이 없습니다 </td></tr>
								</tbody>
                              </s:if>
                             
               
                          </table>
                      </div><!-- /content-panel -->
                  </div><!-- /col-md-12 -->
              </div><!-- /row -->		
		</section>
      </section><!-- /MAIN CONTENT -->

	
	<!-- 미팅목록들 -->
	
     		 <!-- 창열기  -->
     		 <section id="table-content">
         	 <section class="wrapper">
 			   <div class="row mt">
                  <div class="col-md-12">
                      <div class="" style="overflow-y:hidden; height:auto;"> 
	                  	  	  <h4><i class="fa fa-angle-right"></i><b>MeetingList</b></h4>
	                  	  	 <p align = "right" ><button type="button" class="btn btn-round btn-info" onclick="titlesort()">제목</button>
								<button type="button" class="btn btn-round btn-warning" onclick="timesort()">날짜</button></p>
	                  	  	 
                          <table class="table table-striped table-advance table-hover">        	  	  
	                  	  	  <hr>
                              <thead>
                               <tr>
                                  <th><i class="glyphicon glyphicon-tag"></i>제목</th>
                                  <th class="hidden-phone"><i class="glyphicon glyphicon-calendar"></i>날짜</th>
                                  <th class="hidden-phone"><i class="glyphicon glyphicon-time"></i>시간</th>
                                  <th><i class="glyphicon glyphicon-home"></i>장소</th>
                                  <th><i class="glyphicon glyphicon-download-alt"></i>내보내기</th>
                              </tr>
                              </thead>
                              
                          
                             <s:iterator value = "timelinelist" >
                             <tbody>
                              <tr>		
                                  <td>
                                  <%-- 	<a href = "../Meeting/review.action?savedid=<s:property value="savedid"/>"><s:property value = "title"/></a>
                                 --%>  	<a href = "../Meeting/review.action?savedid=<s:property value="meeting_no"/>"><s:property value = "title"/></a>
                                  </td>
                                  <td class="hidden-phone"><s:property value = "mstart"/></td>
                                  <td class="hidden-phone"><s:property value = "mtime"/></td>
                                  <td><s:property value = "place"/></td>
                                  <input type = "hidden" value = "${meeting_no}" id = "m_no"/>
                              	  <td><a class="label label-info label-mini" data-toggle="modal" data-target="#Pdfout" data-no="${meeting_no}">PDF</a></td>
                              </tr>
                              </tbody> 
                              </s:iterator>
                              
                              
                                <s:iterator value = "titlelist">
                             <tbody>
                              <tr>
                                  <td>
                                  	<%-- <a href = "../Meeting/review.action?savedid=<s:property value="savedid"/>"><s:property value = "title"/></a>
          --%>                        	<a href = "../Meeting/review.action?savedid=<s:property value="meeting_no"/>"><s:property value = "title"/></a>
                                  </td>
                                  <td class="hidden-phone"><s:property value = "mstart"/></td>
                                  <td class="hidden-phone"><s:property value = "mtime"/></td>
                                  <td><s:property value = "place"/></td>
                                  <input type = "hidden" value = "${meeting_no}" id = "m_no"/>
                              	  <td><a><span class="label label-info label-mini" data-toggle="modal" data-target="#Pdfout" data-no="${meeting_no}">PDF</span></a></td>
                              </tr>
                              </tbody> 
                              </s:iterator>  
                              
                              
                         	</div>
                       	  
                          
                          </table>
                      </div><!-- /content-panel -->
                  </div><!-- /col-md-12 -->
              </div><!-- /row -->		
		</section>
      </section><!-- /MAIN CONTENT -->
	
	<!-- 미팅목록들 -->
	
      <!--main content end *************************************************************************************************
      ********************************************************************************************************************-->        
                     
                    
      <!-- 공간 맞춰주는 div -->       				
		<div>
		</div>
		
   </div> <!-- /col-lg-9 END SECTION MIDDLE -->
                  
                  
      <!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
      *********************************************************************************************************************************************************** -->                  
                  
                  <div class="col-lg-3 ds" id="left-sidebar" style="overflow-y:hidden">


                       <!-- USERS ONLINE SECTION -->
						<h3>FRIENDS</h3>
						
				<s:iterator value = "invitelist">
                   
                      <!-- First Member -->
                      <div class="desc">
                      	<div class="thumb">
                      		<img class="img-circle" src="https://cdn4.iconfinder.com/data/icons/48-bubbles/48/31.ID-Horizontal-128.png" width="35px" height="35px" align="">
                      	</div>
                      	<div class="details">
                      		<p><s:property value = "i_name"/><br/>
                      		   <muted><s:property value = "participants_id" /></muted>
                      		</p>
                      	</div>
                      </div>
                   </s:iterator>  
                      
                      
                  </div><!-- /col-lg-3 -->
              </div><!--/row -->
          </section>
      </section>

      <!--main content end-->
 
  </section>
    <!-- js placed at the end of the document so the pages load faster -->
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/jquery-1.8.3.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="../assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="../assets/js/jquery.scrollTo.min.js"></script>
    <script src="../assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="../assets/js/jquery.sparkline.js"></script>


    <!--common script for all pages-->
    <script src="../assets/js/common-scripts.js"></script>
    
    
    <script type="text/javascript" src="../assets/js/gritter/js/jquery.gritter.js"></script>
    <script type="text/javascript" src="../assets/js/gritter-conf.js"></script>

    <!--script for this page-->
    <script src="../assets/js/sparkline-chart.js"></script>    
	<script src="../assets/js/zabuto_calendar.js"></script>	
	
	
	
	<script type="application/javascript">
        $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
                $(this).hide();
            });
        
            $("#my-calendar").zabuto_calendar({
                action: function () {
                    return myDateFunction(this.id, false);
                },
                action_nav: function () {
                    return myNavFunction(this.id);
                },
                ajax: {
                    url: "show_data.php?action=1",
                    modal: true
                },
                legend: [
                    {type: "text", label: "Special event", badge: "00"},
                    {type: "block", label: "Regular event", }
                ]
            });
            
            
            
        });
        
        
        function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
        }
    </script>
    
     <!-- 캘린더 CSS 추가 -->
	   <!-- js placed at the end of the document so the pages load faster -->
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="../assets/js/fullcalendar/fullcalendar.min.js"></script>    
    <script src="../assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="../assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="../assets/js/jquery.scrollTo.min.js"></script>
    <script src="../assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    
    
    
    <!--common script for all pages-->
    <script src="../assets/js/common-scripts.js"></script>

    <!--script for this page-->
	<script src="../assets/js/calendar-conf-events.js"></script>    
  
  	
  	 <script>
      //custom select box

      $(function(){
          $("select.styled").customSelect();
          
      });
	
 	 </script> 
  
    
 <!--미팅추가버튼!!!!!!!!!!!!!!!!!!!!!-->
 	<!-- <a style="display:scroll;position:fixed;bottom:60px;right:50px;" href="#" title=Top" onclick="insertschedule()"> -->
	<button type="button" id="btn_meeting_add" title="Top" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-plus"></span></button>
  	

<!-- 미팅추가버튼 팝업창 -->
<div class="container">
 <!--  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button> -->
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content-meeting">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">미팅 추가</h4>
        </div>
        
        <div class="modal-body">
         		<table class="table table-hover" style="width:300px" align="center">
						  	
						  	<tr>
								<td style="font-size: x-large;width:200px">회의 제목</td>
							</tr>
							<tr>
								<td colspan="3">
									<input type="text"  name="title" id="title" class="form-control round-form" style="height:40px;width: 485px;font-size:18px"/>
								</td>
							</tr>
							<tr>
								<td style="font-size: x-large;">장소</td>
							</tr>
							<tr>
								<td colspan="3">
									<input type="text"  name="place" id="place" class="form-control round-form" style="height:40px;width:485px;font-size:18px"/>
								</td>
							</tr>
							<tr>
								<td style="font-size: x-large;">회의 시작시간</td>
							</tr>
							<tr>
								<td style="width: 150px">
									<input type="text" name="meeting_start0" id="meeting_start0" placeholder="날짜" class="form-control" style="height:40px;width:150px;font-size:18px"/><br>
								</td>
								<td style="width: 150px">
									<input type="text" name="meeting_start1" id="meeting_start1" placeholder="시" class="form-control" style="height:40px;width:150px;font-size:18px"/>
								</td >
								<td style="width: 150px">
									<input type="text" name="meeting_start2" id="meeting_start2" placeholder="분" class="form-control" style="height:40px;width:150px;font-size:18px"/>
								</td>
							</tr>
							<tr>
								<td style="font-size: x-large;">회의 끝시간</td>
							</tr>
							<tr>
								<td style="width: 150px">
									<input type="text" name="meeting_end0" id="meeting_end0" placeholder="날짜" class="form-control" style="height:40px;width:150px;font-size:18px"/><br>
								</td>
								<td style="width: 150px">
									<input type="text" name="meeting_end1" id="meeting_end1" placeholder="시" class="form-control" style="height:40px;width:150px;font-size:18px"/>
								</td>
								<td style="width: 150px">
									<input type="text" name="meeting_end2" id="meeting_end2" placeholder="분" class="form-control" style="height:40px;width:150px;font-size:18px"/>
								</td>
							</tr>
						
						</table>
        
        </div>
        <div class="modal-footer">
          <%-- <s:submit class="btn btn-default" data-dismiss="modal" value="미팅추가"/> --%>    
          <input type = "button" value = "미팅추가" onclick="loadCalendarApi()" class="btn btn-default" data-dismiss="modal"><!-- </a> -->
          <%-- ?code="/>'+code+'<s:url value = "&cnt="/>'+cnt; --%>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 미팅추가버튼 팝업창 끝 -->






<!-- PDF 내보내기 팝업창 -->
<div class="container">
 <!--  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button> -->
  <!-- Modal -->
  <div class="modal fade" id="Pdfout" role="dialog">
     
    <div class="modal-dialog">
      <!-- Modal content-->
     
      <div class="modal-content-meeting" style="width:700px;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">PDF내보내기</h4>
        </div>
        
        <div class="modal-body">
        
         		<table class="table" style="width:auto;text-align:center;" align="center"> 	
						  	<tr>
								<td colspan="2" style="font-size: x-large;width:200px">폼을 선택해주세요</td>
							</tr>
							<tr>
								<td><img alt="" src="../img/회의록1.png" width="270" height="350"></td> 
								<td><img alt="" src="../img/회의록3.png" width="270" height="350"></td>
							</tr>
							<tr>
								<td>
									<input type = "button" value = "폼1" onclick = "outpdf1()" id="outBtn1" no="" class="outBtn btn btn-default" data-dismiss="modal" align="center">
									
								</td>
								<td>
							         <input type = "button" value = "폼2" onclick="outpdf2()" id="outBtn2" no="" class="outBtn btn btn-default" data-dismiss="modal" align="center">
								</td>
							</tr>
						</table>
	
        </div>
     <%--    <div class="modal-footer">
        <td><a href = "../Meeting/topdf.action?meeting_no=${meeting_no}"><span class="label label-info label-mini">내보내기</span></a></td>	
        </div> --%>
      </div>     
    </div>   
  </div>
</div>

<!-- 미팅추가버튼 팝업창 끝 -->
<script type="text/javascript">

$('#Pdfout').on('show.bs.modal', function(e){
	var button = $(e.relatedTarget);
	var no = button.data('no');
	var modal = $(this);
	modal.find('.outBtn').attr("no", no);
})

</script>




  	
</body>
</html>