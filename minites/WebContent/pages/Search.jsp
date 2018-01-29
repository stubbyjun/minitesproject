<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 오늘 날짜 구하기 위해 import-->
    <%@ page import="java.util.*, java.text.*"%>
     <%@ taglib prefix="s" uri="/struts-tags" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- z클릭하면 나오는 캘린더용 -->
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

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
<!-- 

	 <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="../assets/js/chart-master/Chart.js"></script>

 -->
	
	<script>
	
		     function searching(){
				 var searchtext = document.getElementById('searchtext').value;
				// alert(searchtext);
				 var searchcondition = document.getElementById('searchcondition').value;
				 //alert(searchcondition);
				 if(searchtext==''  || searchtext==null) {
					 location.href= "../Meeting/searchAllresult.action";
				 } else if (searchcondition=='선택'){
					 alert('검색어를 입력해주세요');
					 return false;
				 } else {
					 location.href = "../Meeting/searchresult.action?searchtext="+searchtext+"&searchcondition="+searchcondition;
				 }
		     	 
		     }
	
	
	</script>

<title>검색</title>

</head>
<body>
<!-- 민지부탁해 -->
	<section id="container">
      <!--header start-->
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
      
      <!-- 본문!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper-search">

              <div class="row" >
                  
                  
                  	<!-- 미팅박스!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                  	
                  	
                                  	
                  	
                  	</div><!-- /row mt -->	
                  	<br>
                  	
       <!-- ------------------------------------------------------------------------------------------------------------------------------------------------  -->          	
      
        
      
      <!-- 메인 콘텐츠 -->
      <!--main content start-->
      <section id="main-content-search">
          <section class="wrapper-search">
          	<h3><i class="fa fa-angle-right"></i>검색</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
            <div class="col-sm-10" >
	            	
	            	<table width="70%" style="text-align:center;">
	            		<tr>
	            			<td >
	            				<input type="text" id="searchtext" placeholder="검색어를 입력하세요" class="form-control" style="height:50px;width:650px;font-size:18px" >	
	            			</td>
	            			<td >
	            				<select name="searchcondition" style="font-size:18px;height:50px;width:150px;text-align:center;" id="searchcondition">
	            					<option selected="selected">선택</option>
	            					<option value="title">회의제목</option>
	            					<option value="place">회의장소</option>
	            					<option value="a_title">안건내용</option><!-- 10/25 원래는 a_contents임 -->
	            					<option value="contents">발언내용</option>
	            				</select>
	            				
	            			</td>
	            			<td >
	            				<input type="button" value="검색" class="btn btn-success " style="font-size: 18px;height:50px;width:100px" id="btn_search" onclick="searching()">
	            			</td>
	            		</tr>
	
	                </table>
         	
                <br>
                
                
               <!--  <table  border="1">
                	<tr>
            			<td style="font-size: large;">기간</td>
            			<td>
            				<input type="text" id="searchfrom" name="searchfrom" class="form-control" style="height:40px;width:150px;font-size:18px">
            			</td>
            			<td style="font-size: large;">
            				~
            			</td>
            			<td>
            				<input type="text" id="searchto" name="searchto" class="form-control" style="height:40px;width:150px;font-size:18px">
            			</td>
            		</tr>
                </table> -->
                   <!-- <img src = "https://cdn2.iconfinder.com/data/icons/bitsies/128/Calendar-128.png" width="50px" height="50px" id="selectDay" > -->
                   <!-- <input type="button" value="검색" width="50px" height="50px" id="selectDay" > -->	
            	 <%@include file="Searchresult.jsp" %> 
            </div>
               
      <!--main content end-->        
	</section>
  </section>
  
  <!-- js placed at the end of the document so the pages load faster -->
    <script src="../assets/js/jquery.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="../assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="../assets/js/jquery.scrollTo.min.js"></script>
    <script src="../assets/js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="../assets/js/common-scripts.js"></script>

    <!--script for this page-->
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>    
    <script src="../assets/js/tasks.js" type="text/javascript"></script>
 	
    <script>
      jQuery(document).ready(function() {
          TaskList.initTaskWidget();	
      });

      $(function() {
          $( "#sortable" ).sortable();
          $( "#sortable" ).disableSelection();
      });
      

    </script>
    
    
	<script>
	  //custom select box
	  $(function(){
	       ('select.styled').customSelect();
	  });
	</script>
  
    <!-- js placed at the end of the document so the pages load faster -->

   <!--  <script src="../assets/js/jquery-1.8.3.min.js"></script>
    <script src="../js/jquery.js"></script> 
    <script class="include" type="text/javascript" src="../assets/js/jquery.dcjqaccordion.2.7.js"></script> -->
   
	<!-- 캘린더 텍스트에서 커서누르면-->
<!-- 	<script type="text/javascript"> 
		$(function() {
			  $( "#searchfrom" ).datepicker({
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
			   $( "#searchto" ).datepicker({
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
		
	</script> -->
	

<!-- 	
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
 -->
</body>
</html>