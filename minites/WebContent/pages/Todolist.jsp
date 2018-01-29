<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags"%>
    
    <!-- 오늘 날짜 구하기 위해 import-->
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
    
    <!-- Custom styles for this template -->
    <link href="../assets/css/style.css" rel="stylesheet">
    <link href="../assets/css/style-responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/to-do.css">
	
	<!-- 할 일 삭제 -->	
	<script type="text/javascript">
		// 할 일 삭제
		function deletetodo(todo_no) {
			if(confirm('삭제하시겠습니까?')) {
				location.href="../Meeting/deletetodo.action?todo_no="+todo_no;
			}
		}	
		
		
	</script>

</head>
<body>

	<section id="container" >
      <!--헤더-->
      <header class="header black-bg">
            <!-- 사이드 바 접고 펴는 거  -->
            <div class="sidebar-toggle-box">
                <div class="fa fa-bars tooltips" data-placement="right"></div>
            </div>
            
            <!--로고-->
           <a href="../Meeting/Meetinglist.action" class="logo"><b>Minites</b></a>
            
            <!-- 오늘 날짜 -->
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li>
                    	<h3 style="color:white;font-size:13pt;">
                    	<!-- 오늘 날짜 구하기 -->
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
      <!--헤더 끝-->
      
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
      
      <!--메인 콘텐츠-->
      <section id="main-content">
          <section class="wrapper">
          	
         	<h3><i class="fa fa-angle-right"></i> 할 일 목록</h3>
          	<br><br>
          	<!-- 할 일 목록 -->
          	<div class="container" style="width:90%;">
		  		<!-- 할 일 목록 탭 -->
		  		<ul class="nav nav-tabs">
		    		<li class="active"><a data-toggle="tab" href="#todo">할 일</a></li>	
		    		<li><a data-toggle="tab" href="#past">지난 일</a></li>
		  	 	</ul>
		  	 	
	          	<div class="tab-content">
<!--오늘 할 일----------------------------------------------------------------------------------------------------------------------->
			   		<br>
			    	<div id="todo" class="tab-pane fade in active">
	          			<div class="white-panel pn" style="overflow-y:scroll;border:1px solid red;">
		                	<!-- 패널 헤더 부분 -->
		                	<div class="panel-heading">
		                        <div class="pull-left">
		                        	<i class="fa fa-tasks" ></i>&nbsp;<font style="font-size:25px">오늘 할 일</font>
		                        	(<s:property value = "todaycount"/>)<!-- 오늘 할 일 갯 수 -->
		                        </div><!-- pull-left -->
		                       
		                 		<br>
		                 	</div>
					  		<!-- 패널 헤더 끝 -->
					  		
					  		<!-- 오늘 할 일 테이블 -->
					  		<div class="custom-check goleft mt">
					             <table id="today" class="table table-hover custom-check" style="overflow-y:scroll">
					              <tbody>
					              <!-- todoList반복 부분 -> dday로 구분 : dday==0, dday>0, dday<0 -->
					            	<s:iterator value = "todoList">
							               	<s:if test="dday==0">
								               	 <tr>
								                	<td width="30px"></td><!-- 간격 맞추려고.. -->
													
													<!-- 클릭하면 할 일 담당자 정보 새 창 뜸 -->
													<td width="150px" align="center" style="font-size: 25px">
														<span>
														
															<a user="<s:property value="todo_no"/>" class ="userpic" data-toggle="modal" data-target="#myModal"><s:property value="todo_user"/></a>
															<%-- <input type="hidden" value="${todo_no}" id="todo_no"> --%>
														</span>
													</td>
													
													<!-- 20151014 제목 누르면 새 창으로 회의록 보여야 함!아직 안됨 -->
													<td width="550px">
														<font style="font-size:25px">할 일 : <s:property value = "contents"/></font><br>
														<font style="font-size:18px">제목 : <a href = "../Meeting/review.action?savedid=<s:property value="meeting_no"/>"><s:property value = "title"/></a></font><br>
														안건 : <s:property value = "a_contents"/>
													</td>
													<td align="left" width="200px" style="font-size:30px">	
														D-DAY
													</td>
													
													<!-- 삭제 버튼 -->
													<td>
														<!-- <input type="button" class="btn btn-success" value="완료"><br> -->
														<input type="button" class="btn btn-warning" value="삭제" align="right" style="margin-top:20px" onclick="deletetodo('${todo_no}')">
													</td>
													
													<td width="20px"></td><!-- 간격 맞추려고.. -->
								           		</tr>
							                </s:if>
									</s:iterator>
									<!-- todoList끝 -->
									
					              </tbody>
					         
					          </table><!-- today테이블 -->
					          
						   </div><!-- /table-responsive -->
						</div><!--/ White-panel -->
	          			<br><br>
	          			
<!--해야 할 일----------------------------------------------------------------------------------------------------------------------->
						<div class="white-panel pn" style="overflow-y:scroll;height: 400px" >
		                	<!-- 패널 헤더 부분 -->
		                	<div class="panel-heading">
		                        <div class="pull-left">
		                        	<i class="fa fa-tasks" ></i>&nbsp;<font style="font-size:25px">해야할 일</font>
		                        	(<s:property value = "futurecount"/>) <!-- 앞으로 해야할 일 갯수 -->
		                        	
		                        </div><!-- pull-left -->
		                 		<br>
		                 	</div>
		                 	<!-- 패널 헤더 끝 -->
		                 	
		                 	<!-- 해야할 일 테이블 -->
					  		<div class="custom-check goleft mt">
					             <table class="table table-hover custom-check" >
					              <tbody>
					              	<s:iterator value = "todoList">
							               	<s:if test="dday>0">
								                <tr>
								                	<td width="30px"></td>
														<td width="150px" align="center" style="font-size: 25px">
													
														<span>
															<a user="<s:property value="todo_no"/>" class ="userpic" data-toggle="modal" data-target="#myModal"><s:property value="todo_user"/></a>
														</span>
													</td>
													<td width="550px">
														<font style="font-size:25px">할 일 : <s:property value = "contents"/></font><br>
														<font style="font-size:18px">제목 : <a href = "../Meeting/review.action?savedid=<s:property value="meeting_no"/>"><s:property value = "title"/></a></font><br>
														안건 : <s:property value = "a_contents"/>
													</td>
													<td align="left" width="200px" style="font-size:30px">	
														D-<s:property value = "dday" /><br>
														<p style="font-size:18px;font-weight:normal;">마감일&nbsp;:&nbsp;<s:property value = "duedate"/></p>
													</td>
													<td>
														<!-- <input type="button" class="btn btn-success" value="완료"><br> -->
														<input type="button" class="btn btn-warning" value="삭제" align="right" style="margin-top:20px" onclick="deletetodo('${todo_no}')">
													</td>
													<td width="20px"></td>
								           		</tr>
								           	</s:if>
								         </s:iterator>	
					              </tbody>
					          </table>
							</div><!-- 해야할 일 테이블 끝 -->
						</div><!--White-panel -->          		
	          	   </div><!-- todo div -->
	
	
<!--지난 일----------------------------------------------------------------------------------------------------------------------->
	          		<div id="past" class="tab-pane fade"><!-- 탭을 클릭하면 나옴 -->
	          			<div class="white-panel pn" style="overflow-y:scroll;height:700px">
		                	<!-- 패널 헤더 부분 -->
		                	<div class="panel-heading">
		                        <div class="pull-left"> 
		                        	<i class="fa fa-tasks" ></i>&nbsp;<font style="font-size:25px">지난 일</font>
		                        	(<s:property value = "pastcount"/>)
		                       
		                    	</div><!-- pull-left -->
		                        <br>
		                 	</div>
		                 	<!-- 패널 헤더 끝 -->
		                 	
		                 	
					  		<div class="custom-check goleft mt">
					             <table id="todo" class="table table-hover custom-check">
					              <tbody>
					              	<s:iterator value = "todoList2">
							           	<s:if test="dday>0">
								             <tr>
								              	<td width="30px"></td>
													<td width="150px" align="center" style="font-size: 25px">
													<span>
														<a user="<s:property value="todo_no"/>" class ="userpic" data-toggle="modal" data-target="#myModal"><s:property value="todo_user"/></a>
													</span>
												</td>
												<td width="550px">
													<font style="font-size:25px">할 일 : <s:property value = "contents"/></font><br>
													<font style="font-size:18px">제목 : <a href = "../Meeting/review.action?savedid=<s:property value="meeting_no"/>"><s:property value = "title"/></a></font><br>
													안건 : <s:property value = "a_contents"/>
												</td>
												<td align="left" width="200px" style="font-size:30px">	
													D+<s:property value = "dday"/><br>
													<p style="font-size:18px;font-weight:normal;">마감일&nbsp;:&nbsp;<s:property value = "duedate"/></p>
												</td>
												<td>
													<input type="button" class="btn btn-warning" value="삭제" align="right" style="margin-top:20px" onclick="deletetodo('${todo_no}')">
												</td>
												<td width="20px"></td>
								          	</tr>
					               		</s:if>
					               	</s:iterator>
					              </tbody>
					           </table><!-- 지난 일 테이블 끝 -->
							</div><!-- table-responsive -->
						</div><!-- White-panel -->
	          		</div><!-- 지난 일 div -->
  
          		</div><!--tab_content div-->
          	 </div><!-- container div-->
          	 
          	 
          	 <div id="todouser_info">	
        	</div>
          	 
		 </section><!-- wrapper section-->
      </section><!-- main-content section -->
   
      <!-- 메인콘텐츠 끝-->



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
          //var a='';
      	  // 할 일 담당자 정보 새창   	  
  		  $('.userpic').on('click',todo_userinfo);
  	  		  
      });
	
      //button click
      function todo_userinfo() {
			var todo_no = $(this).attr('user');
			$.ajax({ 
			    	url : '../Meeting/Todo_userinfo.action',//?todo_no='+todo_no, 
			        type : 'post', 
			        dataType : 'json', 
			        data : {todo_no:todo_no}, 
			        success : insertok
			}); 
	  }
      
      function insertok(msg){
    	   output(msg);
      }
      
      function output(msg) {
		var str='<table class="table table-hover custom-check" align="center" style="font-size: 20px">';
    	  $.each(msg.participantlist,function(i,item) {
       			str+='<tr>';
       				str+='<td rowspan="2" align="center" valign="baseline">'+ item.todo_user + '</td>';
	       			if(item.phone==null) {// 전화번호 없을 때
	       				item.phone='없음';
	       			}
       				str+='<td>'+ '전화번호 : ' + item.phone + '</td>';
       			str+='</tr>';
       			str+='<tr>';
	       			str+='<td>'+ '이메일 : ' + item.todo_email + '</td>';
   				str+='</tr>';
    		  
    	  });
    	 str+='</table>';
    	 $('.modal-body').html(str);
    	 
      }
      
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
	
	<!-- 할일 담당자 정보 modal -->
	<div class="container">
	  <!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog modal-sm" style="width:450px;">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h3 class="modal-title">담당자 정보</h3>
	        </div>
	        <!-- 담당자 정보 뿌려주는 곳 -->
	        <div class="modal-body" style="height:120px"></div>
	       
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>

</body>
</html>