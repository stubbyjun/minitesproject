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

    <script src="../assets/js/chart-master/Chart.js"></script>

    
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
  
  
  
  
  
  
  
  
  
  
  
   <style type="text/css">
    #tablec{
    	background-color: white;
    	width:90%;
    	height:200px;
    	margin-left: 50px;
    
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

              <div class="row" >
                  <div class="col-lg-9 main-chart">
                  
                 
        <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <br>
      <br>
      
      
      <div>
        <form action="/minites/pages/SendMail.jsp" method="post">
            <table id="tablec">
                <!-- <tr><th colspan="2">JSP 메일 보내기</th></tr>
                <tr><td>from</td><td><input type="text" name="from" /></td></tr> -->
                
                <tr>
                	<td><br>
                		  <h3>&nbsp; &nbsp; &nbsp; 당신의 동료들을 초대하세요!</h3><br>
                		  	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;동료들을 초대해 함께 Minites를 이용해보세요<br>
                		  	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Easy & Comfortable 쉽고 간편한 당신의 회의록 작성을 도와드립니다.<br>
                	 
                	</td>
                </tr>
                
            <!--     <div class="col-sm-10">
                      <tr><td><br><br><input type="text" name="to" class="form-control"/></td></tr>            
                </div> -->
               
               <tr>
               <td>
                <div class="goalText well_invite well-lg">
                	<input type="text" class="form-control" name="to"  placeholder="초대하실 멤버의 이메일을 입력해주세요!" style="padding:25px;width:100%;font-size:15pt;"/>
               	</div>
            	</td>
            	<td colspan="2" style="text-align:right;"><input type="submit" class="btn btn-theme03" value="초대하기" style="padding:13px;font-size:15pt;"/></td>
         
            	</tr>
                
                
            
            	
            
            
            </table>
        </form>
    </div>
		   	
		   	
   	 
     
			<div>
		</div>
		
   </div> 
                  
                  
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
	
   
   <!-- 캘린더 CSS 추가 -->
	   <!-- js placed at the end of the document so the pages load faster -->
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="../assets/js/jquery.dcjqaccordion.2.7.js"></script>


    <!--common script for all pages-->
    <script src="../assets/js/common-scripts.js"></script>

 







</body>
</html>