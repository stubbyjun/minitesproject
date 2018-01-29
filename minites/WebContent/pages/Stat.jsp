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

 
    <title>통계</title>

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

    <script src="../assets/js/chart-master/Chart.js"></script>

</head>
<body>
<!-- 대영상부탁해 -->
	<section id="container">
      <!--header start 헤더이다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box" >
                  <div class="fa fa-bars tooltips" data-placement="right"></div>
              </div>
	            <!--logo 새로고침 -->
	           <a href="../Meeting/Meetinglist.action" class="logo"><b>Minites</b></a>
	            <!--logo end-->
            	
            	<!-- 날짜 -->
	            <div class="top-menu">
	            	<ul class="nav pull-right top-menu">
	                    <li>
	                    	<h3 style="color:white;font-size:13pt;"">
		                    	<%
	                    			Date today = new Date();
	                    			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일, E요일");
	                    			out.print(sdf.format(today));
	                    		%>
	                    	</h3>
	                    </li>
	            	</ul>
	            </div>
	           <!--  <input type="text" id="title"> -->
	             <!-- 로그아웃 버튼 -->
	            <div class = "log-out" class = "tab-pane fade">
	         		<a href = "https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://minites.me:8000/minites/Tutorial.jsp"><button type="button" class="btn btn-info">로그아웃</button></a>
	            </div>
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
<!-- ---------------------------------------------------------------------------- -->
 
  <h2><i class="fa fa-angle-right"></i>통계</h2>
  <h2></h2>
  <br>
  <ul class="nav nav-tabs"><!-- tab -->
    <li class="active"><a data-toggle="tab" href="#home">이번 달</a></li>
    <li><a data-toggle="tab" href="#menu1">이번 주</a></li>
    <li><a data-toggle="tab" href="#menu2">안건 별</a></li>
  </ul>
  <br><br>
  
  <div class="tab-content">

    <!-- 이번 달 -->
    <div id="home" class="tab-pane fade in active">
       <!-- 이번달: 그림 -->
       <div class="row mtbox" style="margin-top:-20px">
       					<div class="col-md-2 col-sm-2 col-md-offset-1">
                  			<div class="box1">
                  				
                  			
					  		<table align="center">
					  			<tr>
					  				<td colspan="2">
					  					<img alt="" src="../img/meetings.png" width="90" height="90">
					  				</td>
					  			</tr>
					  			<tr><td><br></td></tr>
					  			<tr style="font-size:25px">
					  				<td>
					  					<div id="total_count_month"></div>
					  				</td>
					  				
					  			</tr>
					  		</table>						  		
					  			
					  			
                  			</div>
					  	</div>
           				
						<div class="col-md-2 col-sm-2">
                  			<div class="box1">
					  			<table align="center">
						  			<tr>
						  				<td colspan="2">
						  					<img alt="" src="../img/hours.png" width="90" height="90">
						  				</td>
						  			</tr>
						  			<tr><td><br></td></tr>
						  			<tr style="font-size:25px">
						  				<td>
						  					<div id="total_time_month"></div>
						  				</td>
						  				
						  			</tr>
						  		</table>

                  			</div>
					  			
                  		</div>
                  		<div class="col-md-2 col-sm-2">
                  			<div class="box1">
					  			<table align="center">
						  			<tr>
						  				<td colspan="2">
						  					<img alt="" src="../img/todo.png" width="90" height="90">
						  				</td>
						  			</tr>
						  			<tr><td><br></td></tr>
						  			<tr style="font-size:25px">
						  				<td>
						  					<div id="total_title_month"></div>
						  				</td>
						  			
						  			</tr>
						  		</table>
				
					  			
                  			</div>
                  		</div> 
                  		<div class="col-md-2 col-sm-2">
                  			<div class="box1">
					  			<table align="center">
						  			<tr>
						  				<td colspan="2">
						  					<img alt="" src="../img/participants.png" width="90" height="90">
						  				</td>
						  			</tr>
						  			<tr><td><br></td></tr>
						  			<tr style="font-size:25px">
						  				<td>
						  					<div id="total_person_month"></div>						  					
						  				</td>
						  				
						  			</tr>
						  		</table>					  			
                  			</div>
                  		</div> 
                 </div> 
                 
      <!-- 이번달: <  xxxx년 xx월 xx일  > -->          		
      <div>
      <center>
	      <table>
		      <tr>
		      	<td>
		      
		      <a href="#">
		      <img id="right_month" alt="" src="../img/right_play.png" width="50" height="50" month_month="">
		      </a>
		      </td>
		      	
		      	<td>
		      		<!-- 내부 테이블 -->
		      		<table>
		      			<tr style="font-size:30px;" align="center">
		      				<td>20</td>
		      				<td><div id="year_month"></div></td>
		      				<td><div id="month_month"></div></td>
		      			</tr>
		      		</table>

		      	</td>
		      	
		      	<td>
		      	<a href="#">
		       	<img id="left_month" src="../img/left_play.png" width="50" height="50" month_month=""></a></td></tr>
	      </table>
      </center>
      </div>
      
         
      <!-- 이번달: 그래프시작 -->
      		<div class="col-lg-12"><!-- col-lg-6 ; col-md-14그래프 너비 크기 조절-->
      			<!-- <div class="content-panel">흰색 패널 배경 -->
                   <div class="panel-body">
       					<h4>미팅 횟수</h4><div id="month-bar" class="graph"></div>
       				</div>
       			<!-- </div> -->
            </div>
            <div class="col-lg-12"><!-- col-lg-6 ; col-md-14그래프 너비 크기 조절-->
             <!-- <div class="content-panel">흰색 패널 배경 -->
                    <div class="panel-body">
                   <h4>미팅 시간 (분)</h4><div id="month-line" class="graph"></div>
                    </div> 
                <!-- </div> -->
        	</div>
        	<br><br><br><br><br><br>
    
        	<!-- 이번 달 정보 테이블 -->
        	 <div class="col-lg-12" id="info_table"></div> 
    
    </div>
    
    
    
    
    <!-- 이번 주 -->
    <div id="menu1" class="tab-pane fade in active"><!-- tab-pane fade -->
      		<!-- 그림 -->
      		<div class="row mtbox" style="margin-top:-20px">
       					<div class="col-md-2 col-sm-2 col-md-offset-1">
                  			<div class="box1">
                  			 <img alt="" src="../img/meetings.png" width="90" height="90">
					  								  		
					  			<h3><div id="total_count_week"></div></h3>
					  			
                  			</div>
					  	</div>
           				
						<div class="col-md-2 col-sm-2">
                  			<div class="box1">
					  			
					  			<img alt="" src="../img/hours.png" width="90" height="90">
					  			
					  			<h3><div id="total_time_week"></div></h3>
					  			
                  			</div>
					  			
                  		</div>
                  		<div class="col-md-2 col-sm-2">
                  			<div class="box1">
					  			
					  			<img alt="" src="../img/todo.png" width="90" height="90">
					  			
					  			<h3><div id="total_title_week"></div></h3>
					  			
                  			</div>
                  		</div> 
                  		<div class="col-md-2 col-sm-2">
                  			<div class="box1">
					  			
					  			<img alt="" src="../img/participants.png" width="90" height="90">
					  			
					  			<h3><div id="total_person_week"></div></h3>
					  			
                  			</div>
                  		</div> 
                 </div> 		
        
  <!-- 이번주: <  xxxx년 xx월 xx일  > -->    		
	<div>
	<center>
		<table>
      <tr>
      	<td>
      	<a href="#">
      	<img id="right_week" src="../img/right_play.png" width="50" height="50" week_week=""></a></td>
      	<!-- <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td> -->
      	
      	<td>
      		<!-- 내부 테이블 -->
			<table>
				<tr style="font-size:30px;" align="center">
					<td>2015년 </td>
					<td><div id="month_week"></div></td>
					<td><div id="week_week"></div></td>
				</tr>
			</table>
      	
      	</td>
      	<!-- <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td> -->
      	<td>
      	<a href="#">
      	<img id="left_week" src="../img/left_play.png" width="50" height="50" week_week="">
      	<%-- <input id="week_week" type="hidden" value="<s:property value="week_week"/>"/> --%>
      	</a></td></tr>
      	</table>
    </center>
  	</div>
      		
   <!-- 이번주: 그래프 시작 -->
      						
           <div class="col-lg-6"><!-- col-lg-6 ; col-md-14그래프 너비 크기 조절-->
               <div class="content-panel"> <!-- 흰색 패널 배경 -->
                   <div class="panel-body"> 
                   <h4>미팅 횟수</h4><div id="week-bar" class="graph"></div>
                   </div> 
                 </div>
            </div>
            
            <div class="col-lg-6"><!-- col-lg-6 ; col-md-14그래프 너비 크기 조절-->
            	<div class="content-panel"> <!-- 흰색 패널 배경 -->
                  	 <div class="panel-body"> 
                   <h4>미팅 시간 (분)</h4><div id="week-line" class="graph"></div>
              		</div> 
                 </div>
            </div>
              
          
    </div>
 
    <!-- 안건 별 -->
    <div id="menu2" class="tab-pane fade in active">
      
      <!-- 안건 별: <  xxxx년 xx월 xx일  > --> 
      <div><center><table>
      <tr>
      	<td><img alt="" src="../img/right_play.png" width="50" height="50"></td>
      	<!-- <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td> -->
      	<td>
      		<!-- 내부 테이블 -->
			<table>
				<tr style="font-size:30px;" align="center">
					<td>2015년</td>
					<td><div id="month_agenda"></div></td>
				</tr>
			</table>
      	</td>
      	<!-- <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td> -->
      	<td>
      	<a href="#" onclick="left_play_agenda()">
      	<img id="left_play" src="../img/left_play.png" width="50" height="50"></a></td></tr>
      </table></center></div>
      
      <div class="col-lg-12"><!-- col-lg-6 ; col-md-14그래프 너비 크기 조절-->
               <div class="content-panel"> <!-- 흰색 패널 배경 -->
                   <div class="panel-body"> 
                   <h4>미팅 횟수</h4><div id="agenda-bar" class="graph"></div>
                   </div> 
                 </div>
            </div>
      		
      		<div class="col-lg-12"><!-- col-lg-6 ; col-md-14그래프 너비 크기 조절-->
            	<div class="content-panel"> <!-- 흰색 패널 배경 -->
                  	 <div class="panel-body"> 
                   <h4>미팅 시간 (분)</h4><div id="agenda-line" class="graph"></div>
              		</div> 
                 </div>
            </div>
        </div>    
  </div>
  
      
<!-- ---------------------------------------------------------------------------- -->      
          </section><!-- wrapper -->
       </section><!-- <section id="main-content"> -->
      </section><!-- <section id="container"> -->
       
  
    <!-- 그래프 그리기에 필요한 js 파일 전부 필요한듯.. -->              	
    <!-- js placed at the end of the document so the pages load faster -->
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="../assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="../assets/js/jquery.scrollTo.min.js"></script>
    <script src="../assets/js/jquery.nicescroll.js" type="text/javascript"></script>
    <!--common script for all pages-->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="http://cdn.oesmith.co.uk/morris-0.4.3.min.js"></script>
    <script src="../assets/js/common-scripts.js"></script>
    <!--script for this page-->
    <script src="../assets/js/morris-conf.js"></script>           	
                  	
</body>
</html>
                  	