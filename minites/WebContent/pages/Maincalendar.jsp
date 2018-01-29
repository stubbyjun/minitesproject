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

	
    <title>Minites</title>

    <!-- Bootstrap core CSS -->
    <link href="../assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="../assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../assets/css/zabuto_calendar.css">
    <link rel="stylesheet" type="text/css" href="../assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="../assets/lineicons/style.css">    
    
    <!-- 전체캘린더 -->
    <!-- <link rel="stylesheet" type="text/css" href="../assets/js/fullcalendar/bootstrap-fullcalendar.css"/> -->
    <script type="text/javascript">
    	
    </script>
    <!-- Custom styles for this template -->
    <link href="../assets/css/style.css" rel="stylesheet">
    <link href="../assets/css/style-responsive.css" rel="stylesheet">
	
	<script src="../assets/js/jquery.scrollTo.min.js"></script>
    <script src="../assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="../assets/js/chart-master/Chart.js"></script>
   
    <script type="text/javascript">
    	function insertschedule(){
    		window.open("goschedule.action","회의 일정 추가","top=200,left=450,width=750,height=550,resizable=no,scrollbar=no");
    		
    	}
    </script>
    
    <!-- *****데이트피터 & 구글 캘린더 연동********************************************************************************************** -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" media="all" />
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js" type="text/javascript"></script>

	  <!-- Bootstrap core CSS -->
    <link href="../assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="../assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="../assets/js/gritter/css/jquery.gritter.css" />
    <link rel="stylesheet" type="text/css" href="../assets/lineicons/style.css">    
    
    <!-- 전체캘린더 -->
    <!-- <link rel="stylesheet" type="text/css" href="../assets/js/fullcalendar/bootstrap-fullcalendar.css"/> -->
    <!-- Custom styles for this template -->
    <link href="../assets/css/style.css" rel="stylesheet">
    <link href="../assets/css/style-responsive.css" rel="stylesheet">


	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="../assets/js/chart-master/Chart.js"></script>
    

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
	
	   handleAuthResult(authResult);
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
	        	 // alert(1);
	            authorizeDiv.style.display = 'none';
	            loadCalendarApi();
	          } else {
	        	  //authorizeDiv.style.display = 'inline';
	        	  //alert(2);
	        	  handleAuthClick(event);
	          }
	      } 

	      /**권한 받기*/
	      function handleAuthClick(event) { // 권한버튼 누르면 실행
	        //alert(3);
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
		    		 gapi.client.load('calendar', 'v3', createEvent);	//createEvent실행 
		    	 } else {
		    		 return false;
		    	 }
		    	 
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
				//opener.location.reload();//새로고침
		    	
		       }
	</script>
	    <script src="https://apis.google.com/js/client.js?onload=checkAuth"></script>
	  
	  
	  <style>
	  	
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
<body>

<!-- 민지부탁해 -->
	<section id="container">
      <!--header start-->
      <header class="header black-bg">
                <!-- 사이드 바 접고 펴는 거  -->
	            <div class="sidebar-toggle-box">
	                <div class="fa fa-bars tooltips" data-placement="right"></div>
	            </div>
	            <!--logo 새로고침 -->
	            <a href="../Meeting/Meetinglist.action" class="logo"><b>Minites</b></a>
	           
	            <!--logo end-->
            	
            	<!-- 날짜 -->
	         
	           <!--  <input type="text" id="title"> -->
	             <!-- 로그아웃 버튼 -->
	            <div class = "log-out" class = "tab-pane fade">
	         		<a href = "https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://minites.me:8000/minites/Tutorial.jsp"><button type="button" class="btn btn-info">로그아웃</button></a>
	            </div>
	            
	            <!-- 타임라인 뷰로 이동 -->
	           
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
      
      <!-- 본문@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
			
              <div class="row" >
                  <div class="col-lg-9 main-chart">
                  
                  	<!-- 미팅박스!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                
                                  	<div style="text-align: center;">
                  		<br>
                        <h3 style="font-family: 'Jeju Gothic', serif;">
                        		
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
	          						  	 <a href="../Meeting/Calendarlist.action"><img src = "../img/calendars.png" width="100%" height="100%" align="middle"></a>
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
	      					      	 <a href="../Meeting/Meetinglist.action"><img src = "../img/clipboard.png" width="100%" height="100%" align="middle" style="filter:gray;filter: grayscale(100%);-webkit-filter: grayscale(100%);" ></a>
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
                  	
                  	
                  	
<%--                   	<div class="row mtbox">
                                  	
                  		<div class="col-md-2 col-sm-2 col-md-offset-1 box0">
                  			<div class="box1">
                  				<img alt="" src="../img/meetings.png" width="100" height="100">
					  			<span class="li_heart"></span>
					  		
					  			<h3><s:property value = "meeting_count"/>&nbsp;Meetings</h3>
					  			
                  			</div>
					  			<!-- <p>933 People liked your page the last 24hs. Whoohoo!</p> -->
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
                  			<div class="box1">
					  			<span class="li_cloud"></span>
					  			<img alt="" src="../img/participants.png" width="100" height="100">
					  			
					  			<h3><s:property value = "partici_count"/>&nbsp;Participants</h3>
					  			
                  			</div>
					  			<!-- <p>48 New files were added in your cloud storage.</p> -->
                  		</div>
                  		<div class="col-md-2 col-sm-2 box0">
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
                  		</div>

                  	</div>
 --%>                  	<br>
       	       
        <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!-- 캘린더 뷰-->
		   	  <table align="center">
		   	  	<tr align="right">
		   	  		<td> 
		   	  			<!-- 권한버튼 -->
		   	  			<!-- <div id="authorize-div" style="display: none">
						      <button id="authorize-button" onclick="handleAuthClick(event)" class="btn btn-success">
						        권한받기
						      </button>
						 </div>  -->
		   	  	
		   	  			<input type="button" onclick="insertschedule()" class="btn btn-success" value="일정추가">
		   	  		</td>
		   	  	</tr>
		   	  	<tr>
		   	  		<td> 
						
		   	  		<iframe src="https://www.google.com/calendar/embed?showTitle=0&amp;showPrint=0&amp;showTabs=0&amp;showCalendars=0&amp;showTz=0&amp;height=600&amp;wkst=1&amp;bgcolor=%23F2F2F2&amp;src=<s:property value="#session.user_email"/>&amp;color=%2329527A&amp;font=30px&amp;ctz=Asia%2FSeoul" style=" border-width:0 " width="800" height="600" frameborder="0" scrolling="no"></iframe>
		  		

						
		      		</td>
		   	  	</tr>
		   	  </table>
		   	
   	 
     
			<div>
		</div>
		
   </div> <!-- /col-lg-9 END SECTION MIDDLE -->
               
                  
      <!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
      *********************************************************************************************************************************************************** -->                  
                  
                <div class="col-lg-3 ds" id="left-sidebar" style="overflow-y:hidden">
                    <!--COMPLETED ACTIONS DONUTS CHART-->
						<%-- <h3>NOTIFICATIONS</h3>
                                        
                      <!-- First Action -->
                      <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                      	</div>
                      	<div class="details">
                      		<p><muted>2 Minutes Ago</muted><br/>
                      		   <a href="#">James Brown</a> subscribed to your newsletter.<br/>
                      		</p>
                      	</div>
                      </div>
                      <!-- Second Action -->
                      <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                      	</div>
                      	<div class="details">
                      		<p><muted>3 Hours Ago</muted><br/>
                      		   <a href="#">Diana Kennedy</a> purchased a year subscription.<br/>
                      		</p>
                      	</div>
                      </div>
                      <!-- Third Action -->
                      <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                      	</div>
                      	<div class="details">
                      		<p><muted>7 Hours Ago</muted><br/>
                      		   <a href="#">Brandon Page</a> purchased a year subscription.<br/>
                      		</p>
                      	</div>
                      </div>
                      <!-- Fourth Action -->
                      <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                      	</div>
                      	<div class="details">
                      		<p><muted>11 Hours Ago</muted><br/>
                      		   <a href="#">Mark Twain</a> commented your post.<br/>
                      		</p>
                      	</div>
                      </div>
                      <!-- Fifth Action -->
                      <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                      	</div>
                      	<div class="details">
                      		<p><muted>18 Hours Ago</muted><br/>
                      		   <a href="#">Daniel Pratt</a> purchased a wallet in your store.<br/>
                      		</p>
                      	</div>
                      </div>
 --%>

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
    <script src="../assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="../assets/js/jquery.dcjqaccordion.2.7.js"></script>

	<!-- 스크롤  -->
    <script src="../assets/js/jquery.scrollTo.min.js"></script>
    <script src="../assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <!--common script for all pages-->
    <script src="../assets/js/common-scripts.js"></script>

    <!--script for this page-->
	<%-- <script src="../assets/js/calendar-conf-events.js"></script>    
 --%>
  <script>
      //custom select box

  </script> 
   
  
 <!-- 미팅추가 버튼 *************************************************************************************** -->
 <!--미팅추가버튼!!!!!!!!!!!!!!!!!!!!!-->
 	<!-- <a style="display:scroll;position:fixed;bottom:60px;right:50px;" href="#" title=Top" onclick="insertschedule()"> -->
<!-- 	<a style="display:scroll;position:fixed;bottom:60px;right:50px;" href="#" title=Top  data-toggle="modal" data-target="#myModal">
	fixed;bottom과 px;right 를 조정하여 고정시킬 위치 값를 지정합니다." 
	<img src="https://cdn2.iconfinder.com/data/icons/freecns-cumulus/16/519691-199_CircledPlus-128.png" alt="" onmouseover="this.src='https://cdn2.iconfinder.com/data/icons/freecns-cumulus/16/519691-199_CircledPlus-128.png'" onmouseout="'https://cdn2.iconfinder.com/data/icons/freecns-cumulus/16/519691-199_CircledPlus-128.png'" border="0"/></a>
 -->  	

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
        
      <%--  <s:form action = "Todolist" theme = "simple"> --%>
        <%-- <table>
        	<tr>
        		<th><h3>미팅 제목&nbsp;&nbsp;&nbsp;&nbsp; </h3></th><th><s:textfield name = "meeting.title" id="tit"/></th>
        	</tr>
        	
        	<tr>
        		<th><h3>미팅 날짜&nbsp;&nbsp;&nbsp;&nbsp; </h3></th><th><s:textfield name = "meeting.inputdate" id="inputdate"/></th>
        	</tr>
        	
        	<tr>
        		<th><h3>미팅 시간&nbsp;&nbsp;&nbsp;&nbsp; </h3></th><th><s:textfield name = "meeting.meeting_start" id="start"/></th>
        	</tr>
      
         </table> --%>
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
							<!-- <tr align="center">
								<td colspan="4">
									<input type="button" class="btn btn-default" value="일정추가" style="font-size: 18px" onclick="loadCalendarApi()">
								</td>
							</tr>
						 -->
						
							<%-- 참가자:<s:textfield name="email" id="email"/><br> --%>
						
						</table>
        <%--  </s:form> --%>
        
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
       







</body>
</html>