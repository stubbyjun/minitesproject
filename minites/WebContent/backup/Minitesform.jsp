<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="s" uri="/struts-tags"%>
     <!-- 오늘 날짜 구하기 -->
    <%@ page import="java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
	
	
	<title>Minites</title>

	
	<script src="../js/jquery-1.11.3.js"></script> 
	
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
	
	<!-- 모달css -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
	
	
	
    <script src="../assets/js/chart-master/Chart.js"></script>

	
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
	
	 	<!-- Load Styles -->
    <link href="https://www.gstatic.com/realtime/quickstart-styles.css" rel="stylesheet" type="text/css"/>
	
	    <!-- Load the Realtime JavaScript library -->
    <script src="https://apis.google.com/js/api.js"></script>

    <!-- Load the utility library -->
    <script src="https://www.gstatic.com/realtime/realtime-client-utils.js"></script>
	
	
	
	
	<style>
		@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
		@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
		
		.no-js #loader { display: none;  }
		.js #loader { display: block; position: absolute; left: 100px; top: 0; opacity:0.7;}
		.se-pre-con {
			position: fixed;
			left: 0px;
			top: 0px;
			width: 100%;
			height: 100%;
			z-index: 9999;
			background: url(http://smallenvelop.com/wp-content/uploads/2014/08/Preloader_11.gif) center no-repeat #fff;
		}
		
		
		
		/* button	*/
		/*
		#create{
			width:60px; height: 60px; font-size:25px; color:white; vertical-align: middle; padding:10px; border-radius: 50%; background-color: #04B4AE;";
		}
		*/
		
		#delete{
			width:60px; height: 60px; font-size:25px; color:white; vertical-align: middle; padding:10px; border-radius: 50%; ";
		}
		#addParty{
			width:45px; height: 45px; font-size:17px; color:white; vertical-align: middle; padding:10px; border-radius: 50%; ";
		}
		.d-day{
			/* -webkit-border-radius: 20px;
			-moz-border-radius: 20px;
			 width:40px; height: 40px; */
		}
		.addSay{
			-webkit-border-radius: 20px;
			-moz-border-radius: 20px;
			 width:40px; height: 40px;
		}
		.todo_mark{
			
		}
		/* textarea & box */	
		#add{border: 1px solid #b7bbbd;padding:10px;background-color: #FEFCFF;}
		
	 	textarea{resize:none;padding:10px;}
		.agenda{padding:10px;margin:10px;}
		
		.agendaText { 
			width: 80%;height:auto;
			border: 1px solid #b7bbbd;
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
			padding: 4px;
			overflow:hidden;
			vertical-align: middle;
			text-overflow:ellipsis;
		}
		.say{margin:5px;}
		.sayText { 
			width:60%;
			height:auto; 
			border: 1px solid #b7bbbd;
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
			padding: 4px;
		}
		.todoDiv {
			/* width: 100%;height:auto;
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
			padding: 6px;
			vertical-align: middle; */
		
			text-align: center;
			}
		.commentDiv {
			/* width: 100%;height:auto;
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
			padding: 6px;
			vertical-align: middle; */
			background-color: #FFE5B4;
	
			text-align: center;
			}
		.details{
		}
		
		.bar {
		    display: inline-block;
		    width: 15px;
		    height: 100%;
		}
		
		.name {
		    display: inline-block;
		    line-height: 50px;
		    vertical-align: top;
		    text-align: center;
		    width: calc(100% - 75px);
		}
		
		img {
		    width: 50px;
		    height: 50px;
		    display: inline-block;
		    margin-left: -4px;
		}
		
	</style>

</head>
<!-- 바디바디바디 -->
<body>
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
	            	<ul class="nav pull-right top-menu"  >
	                    <li >      
	                    	<p style="margin-top: 20px;">
		                    	<%
	                    			Date today = new Date();
	                    			SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일, E요일");
	                    			out.print(sdf.format(today));
	                    		%>
	                    	<p>
	                    </li>
	            	</ul>
	            </div>
	            
	            <!-- 로그아웃 버튼 -->
	            <div class = "log-out" class = "tab-pane fade">
	         		<a href = "https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8000/minites/Tutorial.jsp"><button type="button" class="btn btn-theme02">로그아웃</button></a>
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
          <section class="wrapper" style="background-color: white;">

              <div class="row" > <!-- 지우면 다메 -->
                  <div class="col-lg-9 main-chart" style="background-color: white;"><!-- 지우면 다메 -->
                  
                  	
    
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
<div style="text_align:center;margin-top: 10px;">
<form action = "https://plus.google.com/hangouts/_" method="GET" target="_blank">
<button type="button" class="btn btn-primary" onclick="exit()">나가기</button>
<button type="button" class="btn btn-primary" onclick="s.showSettingsDialog()">권한설정</button>

	<input type = "hidden" name ="gid" value="108870422126">
	<button type="submit" class="btn btn-primary">화상회의</button>
	
	
</form>


</div>

<div style="padding:50px;text-align:center;"> 		


   <!-- 미팅제목 --> <!-- 미팅 제목의       값 -->
  <div class="jumbotron" id="titleDiv">
  <input type= "text" class="form-control input-lg" id="titleText" style="display : none;"> 
  <input type= "text" class="form-control input-lg" id="dateText" style="display : none; "> 
  </div>	
  		<!-- HTML영역 -->
<!-- <a onclick="window.open(window.location.href);return false;" target="_blank">새창</a><br>
 -->
 
 <div class="se-pre-con"></div>
 
 
 <div id="goal" class="goalText well well-lg"><textarea class="form-control" rows="1" id="goalText"  placeholder="미팅 목표를 입력하세요"></textarea></div>
<button id="auth_button">구글 아이디로 인증</button>

<div id="add">

<button type="button" id="create" class="btn btn-primary btn-block" >안건 추가</button>

</div>



<script type="text/javascript">

	
	//field 선언 영역
	var clientId = '108870422126-od1poh2d74f0rnagoubfdddgac39ptr6.apps.googleusercontent.com';
	var str='';
	var app = {};
	var cnt = 0;
	app.cnt = cnt;
	var coltext = [];
	
	var howManyAgenda; //현재 agenda가 몇개 인가?
	var howManySays;
	var howManyTodos;
	
	var saysMap;
	var todoMap;
	
	var where;
	var binder = [];
	var sayCnt = 0;
	app.sayCnt = sayCnt;
	var sayText = [];
	var todoCnt = 0;
	app.todoCnt = todoCnt;
	var dialog, form;
	var todoList = [];
	app.todoList = todoList;
	var commentList = [];
	app.commentList = commentList;
	
	var agendaTexts = [];
	var sayTexts = [];
	var todoObjects = [];
	var commentObjects = [];
	
	
	
	//todo 필드 추가
	var deletedTodoList = [];
	app.deletedTodoList = deletedTodoList;
	//comment 필드 추가
	var deletedCommentList = [];
	app.deletedCommentList = deletedCommentList;
	
	
	//custom Object 생성 영역
	console.log('custom Object 생성 영역 ');
	var todo = function (){};
	todo.prototype = {
		initialize : function (no){
			this.no = no;
			this.who = '';
			this.what = '';
			this.deadline = '';
			this.timeRemaining = '';
			this.clickedId = '';
			this.email = '';
		}
	}
	
	var comment = function (){};
	comment.prototype = {
			initialize : function (no){
				this.cno = no
				this.cwho = '';
				this.cwhat = '';
				this.cinputDate = '';
				this.cClickedId = '';
				this.cEmail = '';
			}
	}
	
	//AJAX
	
	$(document).ready(function(){
	
	  /*   dialog = $( "#todoDialog" ).dialog({
	      autoOpen: false,
	      height: 300,
	      width: 350,
	      modal: true,
	    });
	    
	    app.dialog = dialog;
 */
	
			
		 setTimeout(function(){ $(".se-pre-con").fadeOut("slow"); }, 6000);

	
		$('#create').on('click', createTextarea);
		//$('#addParty').on('click',addParty); 
		
		
		
		var dialog, form
		 
	    function addTodo() {
	      //Todo 등록
			console.log("add todo");
			// 1. add todo 메서드 도착 
			var todo_primaryKey = 0;
			app.todo_primaryKey = todo_primaryKey;
			// !! 1-1 고유 값 정하기 
			// todo_primaryKey 는 마지막 todo 의 no에 1을 더한값.
			var lastIndex = app.todoList.length;
			if(lastIndex == 0){
				console.log("todo List 의 길이가 0 입니다.")			
			}else{
				//마지막 값 뽑기 
				var lastTodo = app.todoList.get(lastIndex-1);
				console.log("lastTodo 의 no 값 : " + lastTodo.no);
				//마지막 값의 + 1 값이 새로 운 프라이머리 키 값.
				app.todo_primaryKey = lastTodo.no + 1;
				console.log("todo_primaryKey : " + app.todo_primaryKey ); 
			}
			
			var customObject = app.doc.getModel().create(todo, app.todo_primaryKey);
			app.root.set('todo'+app.todo_primaryKey, customObject);
			// 2. 커스텀 오브젝트 만들기 (고유값 no = todo_primaryKey) 
			
			app.todoList[app.todo_primaryKey] = doc.getModel().getRoot().get('todo'+app.todo_primaryKey);
			app.todoList[app.todo_primaryKey].addEventListener(gapi.drive.realtime.EventType.VALUE_CHANGED, todoChanged);
			// 3. 불러와서 이벤트 달기
			
			var who = $("#slavers option:selected").text();
			//alert(who);
	
			var what = document.getElementById('todo_texts').value;
	  		var deadline = document.getElementById('duedate').value;
	  		//이메일 모달로부터 불러오기;
			var email = document.getElementById('slavers').value;
			//alert(email);
	  		var actualTime = new Date(Date.now());
	  		var endOfDay = new Date(deadline);
	  		var timeRemaining = endOfDay.getDate()-actualTime.getDate();
	  		var days = timeRemaining/1000/60/60/24;
	  		// 4. 모달로 부터 자료 받아오기
	  		
	  		app.todoList[app.todo_primaryKey].who = who;
	  		app.todoList[app.todo_primaryKey].what = what;
	  		app.todoList[app.todo_primaryKey].deadline = deadline;
	  		app.todoList[app.todo_primaryKey].timeRemaining = timeRemaining;
	  		app.todoList[app.todo_primaryKey].clickedId = clickedId;
	  		app.todoList[app.todo_primaryKey].email = email;
	 	 	// 5. 모달의 값을 커스텀 오브젝트에 할당 
	 	 	
	  		var cid = clickedId.toString();
			var loca = cid.replace("todo", "say");
			// 6. 발언에 있는 할일 버튼으로 부터 위치값 도출 
			
	  		if(app.todoList[app.todo_primaryKey].timeRemaining > 0){
	  			var st= "<div id='todoDiv"+app.todoList[app.todo_primaryKey].no+"' class='todoDiv table-responsive'>"
	  			+"<table class='table table-hover'><tr><td style='width:15%'><span class='glyphicon glyphicon-ok' style='color:green'></span></td><td style='width:20%'>"+app.todoList[app.todo_primaryKey].who+"</td><td style='width:50%'>"+app.todoList[app.todo_primaryKey].what+"&emsp;&emsp;<button type='button' class='btn btn-success btn-sm d-day'>D-"+app.todoList[app.todo_primaryKey].timeRemaining+"</button>"
	  			+"</td><td style='width:15%'><button type='button' class='btn btn-danger btn-xs' onclick = 'deleteTodo("+app.todo_primaryKey+")'  id='todoDelete"+app.todo_primaryKey+"'> <span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button>"
	  			+"</td></tr></table></div>";
	  		}else if(app.todoList[app.todo_primaryKey].timeRemaining == 0){
	  			var st= "<div id='todoDiv"+app.todoList[app.todo_primaryKey].no+"' class='todoDiv table-responsive'>"
	  			+"<table class='table table-hover'><tr><td style='width:15%'><span class='glyphicon glyphicon-ok' style='color:green'></span></td><td style='width:20%'>"+app.todoList[app.todo_primaryKey].who+"</td><td style='width:50%'>"+app.todoList[app.todo_primaryKey].what+"&emsp;&emsp;<button type='button' class='btn btn-danger btn-sm d-day'>D-DAY</button>"
	  			+"</td><td style='width:15%'><button type='button' class='btn btn-danger btn-xs' onclick = 'deleteTodo("+app.todo_primaryKey+")'  id='todoDelete"+app.todo_primaryKey+"'> <span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button>"
	  			+"</td></tr></table></div>";
	  		}else{
	  			var st= "<div id='todoDiv"+app.todoList[app.todo_primaryKey].no+"' class='todoDiv table-responsive'> "
	  			+"<table class='table table-hover'><tr><td style='width:15%'><span class='glyphicon glyphicon-ok' style='color:green'></span></td><td style='width:20%'>"+app.todoList[app.todo_primaryKey].who+"</td><td style='width:50%'>"+app.todoList[app.todo_primaryKey].what+"&emsp;&emsp;<button type='button' class='btn btn-warning btn-sm d-day'>D+"+Math.abs(app.todoList[app.todo_primaryKey].timeRemaining)+"</button>"
	  			+"</td><td style='width:15%'><button type='button' class='btn btn-danger btn-xs' onclick = 'deleteTodo("+app.todo_primaryKey+")'  id='todoDelete"+app.todo_primaryKey+"'> <span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button>"
	  			+"</td></tr></table></div>";
	  		}
	  		$('#'+loca).append(st);
	  		// 7. 해당 위치에 html 추가.
	  		
	  		app.todoList.push(app.todoList[app.todo_primaryKey]);
	  		// 8. todoList 맨 마지막에 추가. 
	  		
	  		console.log("등록 종료 시점 todoList legnth : " + app.todoList.length);
	  		//dialog.dialog( "close" );
	    }
		
		function addComment(){
			//커멘트 등록 
			console.log("add comment");
			// 1. add comment 메서드 도착 
			var comment_primaryKey = 0;
			app.comment_primaryKey = comment_primaryKey;
			// !! 1-1 고유 값 정하기 
			// todo_primaryKey 는 마지막 comment 의 no에 1을 더한값.
			var lastIndex = app.commentList.length;
			if(lastIndex == 0){
				console.log("commentList 의 길이가 0 입니다.")			
			}else{
				//마지막 값 뽑기 
				var lastComment = app.commentList.get(lastIndex-1);
				console.log("lastComment 의 no 값 : " + lastComment.cno);
				//마지막 값의 + 1 값이 새로 운 프라이머리 키 값.
				app.comment_primaryKey = lastComment.cno + 1;
				console.log("comment_primaryKey : " + app.comment_primaryKey ); 
			}
			
			var customObject = app.doc.getModel().create(comment, app.comment_primaryKey);
			app.root.set('comment'+app.comment_primaryKey, customObject);
			// 2. 커스텀 오브젝트 만들기 (고유값 no = comment_primaryKey) 
			
			app.commentList[app.comment_primaryKey] = doc.getModel().getRoot().get('comment'+app.comment_primaryKey);
			app.commentList[app.comment_primaryKey].addEventListener(gapi.drive.realtime.EventType.VALUE_CHANGED, commentChanged);
			// 3. 불러와서 이벤트 달기
			
			var who = $("#slavers2 option:selected").text();
			//alert(who);
			var what = document.getElementById('comment_texts').value;
	  		var inputDate = new Date(Date.now());
	  		var cEmail =document.getElementById('slavers2').value; 
	  		// 4. 모달로 부터 자료 받아오기
	  		//alert(cEmail);
	  		app.commentList[app.comment_primaryKey].cwho = who;
	  		app.commentList[app.comment_primaryKey].cwhat = what;
	  		app.commentList[app.comment_primaryKey].cinputDate = inputDate;
	  		app.commentList[app.comment_primaryKey].cClickedId = cClickedId;
	  		app.commentList[app.comment_primaryKey].cEmail = cEmail;
	 	 	// 5. 모달의 값을 커스텀 오브젝트에 할당 
	 	 	
	  		var cid = cClickedId.toString();
			var loca = cid.replace("comment", "say");
			// 6. 발언에 있는 할일 버튼으로 부터 위치값 도출 
  			
  			var st= "<div id='commentDiv"+app.commentList[app.comment_primaryKey].cno+"' class='table-responsive'> "
  			+"<table class='table table-hover'><tr><td style='width:15%'><span class='glyphicon glyphicon-comment' style='color:#CC0000'></span></td><td style='width:20%'>"+app.commentList[app.comment_primaryKey].cwho+"</td><td style='width:50%'>"+app.commentList[app.comment_primaryKey].cwhat+"</td><td style='width:15%'>"
  			+"<button type='button' class='btn btn-danger btn-xs' onclick = 'deleteComment("+app.commentList[app.comment_primaryKey].cno+")' id='commentDelete"+app.commentList[app.comment_primaryKey].cno+"'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td></tr></talbe>"
  			
  			
	  		$('#'+loca).append(st);
	  		// 7. 해당 위치에 html 추가.
	  		
	  		app.commentList.push(app.commentList[app.comment_primaryKey]);
	  		// 8. commentList 맨 마지막에 추가. 
	  		
	  		console.log("등록 종료 시점 commentList legnth : " + app.commentList.length);
		}
	    
		
		
	    $(document).on('click','.todo',function(){
	    	clickedTodo = $(this); // button 
	    	clickedId = $(this).attr("id");
	    	$(this).attr("data-toggle","modal");
	    	$(this).attr("data-target","#todoModal");
	    });
	    
	    $(document).on('click','.insert_todo',function(){
			
	    	addTodo();
	    });
	    
	    $(document).on('click','.comment', function(){
			clickComment = $(this);
			console.log("hey" + clickComment);
			cClickedId = $(this).attr("id");
			$(this).attr("data-toggle","modal");
	    	$(this).attr("data-target","#commentModal");
		});
	    
	    $(document).on('click','.insert_comment',function(){
			addComment();
	    });
	    
	    
	    $('.insert_party').on('click',createPartici);
	    
	    //참석자 리스트 가져오기 함수
	});
	

	function createTextarea(){
		//어젠다 텍스트 박스 생성
		var agendaCnt = app.cnt;
		console.log('1-1. 텍스트 박스 생성');
		str ='<div id="agenda'+app.cnt+'" class="agenda">'+ 
		'<div class="panel-primary">'+
		'<div class="panel-heading">'+
		'안건'+(app.cnt+1)+'</div>'+
		'<div class="panel-body">'+
		'<button type="button" onclick="addsay('+agendaCnt+')" class="btn btn-success addSay">+</button>'+
		'<textarea id="text'+app.cnt+'" class="agendaText" placeholder="안건을 입력하세요"></textarea>'+
		'</div>'
		'</div>';
		//$('#add').append(str); //**append로 해야 초기화 안됨 (html은 객체가 사라지는 것과 같음)
		$(str).insertBefore("#create");
		bindTextBox();
		app.cnt++;
		app.howManyAgenda.insert(0, app.cnt);
	}
	
	function addsay(agendaCnt){
		console.log("app.sayCnt : " + app.sayCnt);
		//발언 텍스트 박스 생성
		str = '<div id="say'+app.sayCnt+'" class="say">'+ 
		'<button type="button" class="btn btn-default btn-md disabled">'+
        '<span class="glyphicon glyphicon-user"></span> 발언 '+(app.sayCnt+1)+' </button><br><br>'+
		'<textarea id="sayText'+app.sayCnt+'" class="sayText" placeholder="발언을 입력하세요"></textarea><br>'+
		'<input type="button" id ="todo'+ app.sayCnt+'" class="todo btn btn-info" data-toggle="modal" data-target="#todoModal" value="TO-DO">'+
		'          '+
		'<input type="button" id ="comment'+app.sayCnt+'"class="comment btn btn-info" data-toggle="modal" data-target="#commentModal" value="Comment" ><div><br></div>'+
		'</div>';
		$('#agenda'+agendaCnt).append(str);
		
		//구글 API영역
		app.saysMap.set("say"+app.sayCnt, "#agenda"+agendaCnt);
		bindSay(app.sayCnt);
		app.sayCnt++;
		app.howManySays.insert(0,app.sayCnt);
	}
	
	//나가기
	function exit(){
		var id = realtimeUtils.getParam('id');
		
		//0 goal 택스트 가져오기
		var goal = app.root.get('goalText').getText();
		
		//1 어젠다 갯수 파악
		var howManyAgendaNo = app.howManyAgenda.length;
		//2.어젠다 리스트에 담기 
		for(var c = 0 ; c < howManyAgendaNo ; c++){
			var agendaText = app.root.get('coltext'+c).getText();
			
			
			if(agendaText==null || agendaText=='') {
				
			} else {
				agendaTexts[c] = agendaText; //3. 리스트 담기 완료.
			}

			
		}
		//1. 발언 갯수 파악
		var howManySayNo = app.howManySays.length;
		//2. 발언 리스트에 담기 
		
		if(howManySayNo > 0){
			for(var c = 0 ; c < howManySayNo ; c++ ){
				var sayText = app.root.get('say'+c).getText();
				
				if(sayText==null || sayText=='') {
					
				} else {
					var where = app.saysMap.get("say"+c);
					console.log(where);
					var agenda_no = where.substr(7, 1);				
					var statements = new Object();
					statements.contents = sayText;
					statements.agenda_no = agenda_no;

					
					var statements_str = JSON.stringify(statements);
					sayTexts[c] = statements_str; // 3. 리스트에 담기 완료 
				}

			}
		}
		
		if(app.todoList.length > 0){
			for(var c = 0 ; c < app.todoList.length ; c++){
				var todoL = app.todoList.get(c);
				var todo = new Object();
				todo.todo_no = id+todoL.no;
				var cid = todoL.clickedId.toString();
				var loca = cid.replace("todo", "");
				todo.stmt_no = id+loca;
				todo.todo_user = todoL.who;
				todo.todo_email = todoL.email;
				todo.contents = todoL.what;
				todo.duedate = todoL.deadline;
				var todo_str = JSON.stringify(todo);
				todoObjects[c] = todo_str; // todo Object List 완료 
			}
		}
		
		if(app.commentList.length > 0 ){
			for(var c = 0 ; c < app.commentList.length ; c++){
				var commentL = app.commentList.get(c);
				var comments = new Object();
				
				comments.comment_no = id+commentL.cno;
				comments.comment_user = commentL.cwho;
				comments.comment_email = commentL.cEmail;
				comments.contents = commentL.cwhat;
				var cid = commentL.cClickedId.toString();
				var loca = cid.replace("comment", "");
				comments.stmt_no = id+loca;
				var comments_str = JSON.stringify(comments);
				commentObjects[c] = comments_str; // comment Object List 완료
			}
		}
		
		
		
		//배열 값 보낼 수 있도록 세팅
		
		jQuery.ajaxSettings.traditional = true;

		$.ajax({
			url : '../Meeting/saveMeeting.action'
			,dataType : 'json'
			,type : 'post'
			,data : { goal : goal, id : id , agendaTexts : agendaTexts, sayTexts : sayTexts , todoObjects : todoObjects , commentObjects : commentObjects}
			,success : transferOK()
			,error : function(){
				console.log("전송 실패" );
			}
			
		})
		
		
		function transferOK(){
			//alert("전송 성공");
			var savedid = realtimeUtils.getParam('id');
			location.href="../Meeting/Meetinglist.action?savedid="+savedid;
		}
	}
	
	
	//클라이언트 아이디로 부터 리얼타임 유틸 객체 생성
    var realtimeUtils = new utils.RealtimeUtils({ clientId: clientId });
    
	
    //인증 영역
	authorize();
	function authorize() {
		console.log('0. 인증')
	  realtimeUtils.authorize(function(response){
	     if(response.error){
	       var button = document.getElementById('auth_button');
	       button.classList.add('visible');
	       button.addEventListener('click', function () {
	         realtimeUtils.authorize(function(response){
	           start();
	         }, true); 
	       });
	     } else {
	         start();
	     }
	   }, false); 
		
	 }
	
	function start(){
		console.log('1. 시작')
		
		
		//커스텀 오브젝트 등록.
		console.log('커스텀 오브젝트 등록');
		//todo 오브젝트 생성 
		var custom = gapi.drive.realtime.custom;
		custom.registerType(todo, 'todo');
		todo.prototype.no = custom.collaborativeField('no');
		todo.prototype.who = custom.collaborativeField('who');
		todo.prototype.what = custom.collaborativeField('what');
		todo.prototype.deadline = custom.collaborativeField('deadline');
		todo.prototype.timeRemaining = custom.collaborativeField('timeRemaining');
		todo.prototype.clickedId = custom.collaborativeField('clickedId');
		todo.prototype.email = custom.collaborativeField('email');
		custom.setInitializer(todo, todo.prototype.initialize);
		//comment 오브젝트 생성
		custom.registerType(comment, 'comment');
		comment.prototype.cno = custom.collaborativeField('cno');
		comment.prototype.cwho = custom.collaborativeField('cwho');
		comment.prototype.cwhat = custom.collaborativeField('cwhat');
		comment.prototype.cinputDate = custom.collaborativeField('cinputDate');
		comment.prototype.cClickedId = custom.collaborativeField('cClickedId');
		comment.prototype.cEmail = custom.collaborativeField('cEmail');
		custom.setInitializer(comment, comment.prototype.initialize);
		
		
		//문서 생성 영역
		var id = realtimeUtils.getParam('id');
		if (id) {
	         realtimeUtils.load(id.replace('/', ''), onFileLoaded, onFileInitialize);
	    } else {
	         doc = realtimeUtils.createRealtimeFile('New Quickstart File', function(createResponse) {
	       	 window.history.pushState(null, null, '?id=' + createResponse.id);
	       	
	       	 
	       	 replaceid();// id바꿔치기
	       		
	         doc = realtimeUtils.load(createResponse.id, onFileLoaded, onFileInitialize); 
	        
	       	 
	         });
	         
	      	
	    }	
		

		initlist();//참석자 나오는 것	
		
	}
	
	
	function replaceid(){
		var realid = realtimeUtils.getParam('id');
		console.log("바꿔치기할 아이디는 "+realid);
		$.ajax({
			url:'../Meeting/replaceid.action',
			data:{realid:realid},		
			success:console.log("id바꿔치기 성공")		
		}); 
	}
	  

	
	function onFileInitialize(model){
		console.log("2. 파일 초기화 시작");
		console.log("2-1. collaborative String 100개 제작");
		
		//title 콜라보 스트링 생성
		var titleText = model.createString('');
		model.getRoot().set('titleText', titleText);
		
		//date 콜라보 스트링 생성
		var dateText = model.createString('');
		model.getRoot().set('dateText', dateText);
		
		//Goal 콜라보 스트링 생성
		var goalText = model.createString('');
		model.getRoot().set('goalText', goalText);
		
		//어젠다 콜라보 스트링 100개 제작
		for(var c=0; c<100; c++){
			coltext[c] = model.createString('');
			model.getRoot().set('coltext'+c, coltext[c]);
		}
		
		console.log("2-1-1");
		
		//발언 콜라보스트링 100개 제작 
		for(var c=0; c<100; c++){
			sayText[c] = model.createString('');
			model.getRoot().set('say'+c, sayText[c]);
		}
		
		console.log("2-2. collaborative list 제작 - 열려있는 텍스트 필드 목록 확인용");

		howManyAgenda = model.createList();
		model.getRoot().set('howManyAgenda', howManyAgenda);
		howManySays = model.createList();
		model.getRoot().set("howManySays", howManySays);
		howManyTodos = model.createList();
		model.getRoot().set("howManyTodos", howManyTodos);
		todoList = model.createList();
		model.getRoot().set("todoList", todoList);
		deletedTodoList = model.createList();
		model.getRoot().set("deletedTodoList", deletedTodoList);
		commentList = model.createList();
		model.getRoot().set("commentList", commentList);
		deletedCommentList = model.createList();
		model.getRoot().set("deletedCommentList", deletedCommentList);
		
		saysMap = model.createMap();
		model.getRoot().set('saysMap', saysMap);
		todoMap = model.createMap();
		model.getRoot().set('todoMap', todoMap);
		
		where = model.createList();
		model.getRoot().set('where', where);
		
	}
	
     
	function onFileLoaded(doc){
		//공유 기능 생성 
        s = new gapi.drive.share.ShareClient('108870422126');
        s.setOAuthToken('YWuuTypMo_Rq4_N2budu7IAa');
        s.setItemIds(realtimeUtils.getParam('id'));
	  
        //collaborator 보이기.
        doc.addEventListener(gapi.drive.realtime.EventType.COLLABORATOR_JOINED, displayCollaboratorEvent);
       	doc.addEventListener(gapi.drive.realtime.EventType.COLLABORATOR_LEFT, deleteCollaboratorEvent);
        
        function displayCollaboratorEvent(evt){
        	var user = evt.collaborator;
        	
        	var str = 
        	'<div id = '+user.sessionId+'>'+
        	'<img src='+user.photoUrl+'>'+
        	'<div class="name" style="background-color:'+user.color+'; color:#FFFFFF ">'+user.displayName+'</div>'+
			'</div>'        	
        	$("#collaborators").append(str);
        }
        
        function deleteCollaboratorEvent(evt){
        	var user = evt.collaborator;
        	$("#"+user.sessionId).remove();
        }
        
	    window.onload = function() {
	        gapi.load('drive-share', init);
	    }
	    
	    //파일 로딩 시작 
		console.log("3. 파일 로딩 시작");
		app.doc = doc;
		app.root = doc.getModel().getRoot();
		
		app.howManyAgenda = app.root.get('howManyAgenda');
		app.howManySays = app.root.get('howManySays');
		app.howManyTodos = app.root.get('howManyTodos');
		app.todoList = app.root.get('todoList');
		app.deletedTodoList = app.root.get('deletedTodoList');
		app.commentList = app.root.get('commentList');
		app.deletedCommentList = app.root.get('deletedCommentList');
		
		app.where = app.root.get('where');
		app.saysMap = app.root.get('saysMap');
		app.todoMap = app.root.get('todoMap');
		
		app.binder = binder;
		
		console.log("2-3. 이벤트 추가");
		app.howManyAgenda.addEventListener(gapi.drive.realtime.EventType.VALUES_ADDED, onValueAdded);
		app.howManySays.addEventListener(gapi.drive.realtime.EventType.VALUES_ADDED, onSaysValueAdded);
		app.howManyTodos.addEventListener(gapi.drive.realtime.EventType.VALUES_ADDED, onTodoValueAdded);
		app.todoList.addEventListener(gapi.drive.realtime.EventType.VALUES_ADDED, onTodoListAdded);
		app.todoList.addEventListener(gapi.drive.realtime.EventType.VALUES_REMOVED, onTodoListDeleted);
		app.deletedTodoList.addEventListener(gapi.drive.realtime.EventType.VALUES_ADDED, onDeletedTodoListAdded);
		app.deletedTodoList.addEventListener(gapi.drive.realtime.EventType.VALUES_REMOVED, onDeletedTodoListDeleted);
		app.commentList.addEventListener(gapi.drive.realtime.EventType.VALUES_ADDED, onCommentListAdded);
		app.commentList.addEventListener(gapi.drive.realtime.EventType.VALUES_REMOVED, oncommentListDeleted);
		app.deletedCommentList.addEventListener(gapi.drive.realtime.EventType.VALUES_ADDED, onDeletedCommentListAdded);
		app.deletedCommentList.addEventListener(gapi.drive.realtime.EventType.VALUES_ADDED, onDeletedCommentListDeleted);
		
		app.saysMap.addEventListener(gapi.drive.realtime.EventType.VALUE_CHANGED, onSaysChanged);
		app.todoMap.addEventListener(gapi.drive.realtime.EventType.VALUE_CHANGED, onTodoChanged);
		app.where.addEventListener(gapi.drive.realtime.EventType.VALUES_ADDED, onLocationChange);
		
		
		//Title 바인딩 해주기
		var titleCollaborativeText = app.root.get('titleText');
		var titleText = document.getElementById('titleText');
		gapi.drive.realtime.databinding.bindString(titleCollaborativeText, titleText);
		
		//title 값 셋팅
		var titleValue = "${title}"; 
		if(titleValue != null){
			
			console.log("널이 아니다 ! titleValue : " + titleValue);
			titleCollaborativeText.setText(titleValue);
		}else{
			console.log("널이다");
		}
	
		//date 바인딩 해주기
		
		var dateCollaborativeText = app.root.get('dateText');
		var dateText = document.getElementById('dateText');
		gapi.drive.realtime.databinding.bindString(dateCollaborativeText, dateText);
		
		//date 값 셋팅
		var dateValue = "${date_written}";
		if(dateValue != null){
			console.log("날짜도 널이아니다. ! date_written : " + dateValue);
			dateCollaborativeText.setText(dateValue);
		}else{
			console.log("널이다");
		}
		
		//title 값 그리기
		var setedTitleValue = titleCollaborativeText.getText();
		var setedDateValue = dateCollaborativeText.getText();
		var wholeString = "<h1>"+setedTitleValue+"</h1><br><h3>"+setedDateValue+"<h3>";
		$('#titleDiv').append(wholeString);
	
		
		//goal 바인딩 해주기
		var goalCollaborativeText = app.root.get('goalText');
		var goaltext = document.getElementById('goalText');
		gapi.drive.realtime.databinding.bindString(goalCollaborativeText, goaltext);
		
		
		
		//어젠다 갯수 만큼 열어주기
		if(app.howManyAgenda.length > 0){
			//어젠다 만약 이미 생성된 텍스트 박스들이 있다면, 해당 박스들을 생성해서 바인딩 까지 해야줘야 한다.
			console.log("3-2 howManyAgenda 가 0보다 더 클 경우");
			for(var c=0; c<app.howManyAgenda.get(0) ; c++){
				str ='<div id="agenda'+c+'" class="agenda">'+ 
				'<div class="panel-primary">'+
				'<div class="panel-heading">'+
				'안건'+(c+1)+'</div>'+
				'<div class="panel-body">'+
				'<button type="button" onclick="addsay('+c+')" class="btn btn-success addSay">+</button>'+
				'<textarea id="text'+c+'" class="agendaText" placeholder="안건을 입력하세요"></textarea>'+
				'</div>'+
				'</div>';
				
				
				//$('#add').append(str); 
				$(str).insertBefore("#create");
				
				//console.log("3-1 콜라보레이티브 스트링 객체 생성");
				var targetCollaborativeText = app.root.get('coltext'+c);
				//console.log("3-2 텍스트 에어리어 객체 생성");
				var textarea = document.getElementById('text'+c);
				//console.log("3-3 바인딩");
				app.binder[c] = gapi.drive.realtime.databinding.bindString(targetCollaborativeText, textarea);
				console.log("c 는 : " +c)
				
				targetCollaborativeText.addEventListener(gapi.drive.realtime.EventType.TEXT_INSERTED, function(evt){
					var target = 'text' + (c-1)
					console.log("target은 : " + target);
					
					if(evt.isLocal){
						console.log('아젠다 text가 변경되었습니다.')
						$("#"+target)
						.css("border-left","solid 20px black")
					}else{
						console.log("다른사람에 의해서 발언 TEXT 가 변경되었습니다.")

						var sessionId = evt.sessionId;
						var color = '';
						
						var collaborators = app.doc.getCollaborators();
						var collaboratorCount = collaborators.length;
						console.log("collaboratorCount : " + collaboratorCount);
						
						for (var i = 0; i < collaboratorCount; i++) {
						    var user = collaborators[i];
						    console.log("user : " + user);
						    if(user.sessionId == sessionId){
						    	color = user.color;
						    	console.log("발견 색깔은 : " +color);
						    }
						  }
						
						console.log("바뀌는 타켓은 : " + target);
						$("#"+target)
						.css("border-left","solid 20px "+color+"")
					}
				});
				
				targetCollaborativeText.addEventListener(gapi.drive.realtime.EventType.TEXT_DELETED, function(evt){
					var target = 'text' + c
					if(evt.isLocal){
						console.log('아젠다 text가 변경되었습니다.')
						$("#"+target)
						.css("border-left","solid 20px black")
					}else{
						console.log("다른사람에 의해서 발언 TEXT 가 변경되었습니다.")

						var sessionId = evt.sessionId;
						var color = '';
						
						var collaborators = app.doc.getCollaborators();
						var collaboratorCount = collaborators.length;
						console.log("collaboratorCount : " + collaboratorCount);
						
						for (var i = 0; i < collaboratorCount; i++) {
						    var user = collaborators[i];
						    console.log("user : " + user);
						    if(user.sessionId == sessionId){
						    	color = user.color;
						    	console.log("발견 색깔은 : " +color);
						    }
						  }
						
						$("#"+target)
						.css("border-left","solid 20px "+color+"")
					}
				});
			}
			console.log("3-4 howManyAgenda 와 cnt 맞춰주기");
			app.cnt = app.howManyAgenda.get(0);
		}
		
		//발언 갯수 만큼 열어주기
		console.log("saysMap 사이즈 " + app.saysMap.size);
		if(app.saysMap.size > 0){
			console.log("3-3 saysMap 가 0보다 클 경우");
			for(var c = 0 ; c < app.saysMap.size ; c++){
				str = '<div id="say'+c+'" class="say">'+ 
				'<button type="button" class="btn btn-default btn-md disabled">'+
		        '<span class="glyphicon glyphicon-user"></span> 발언 '+(c+1)+' </button><br><br>'+
				'<textarea id="sayText'+c+'" class="sayText" placeholder="발언을 입력하세요"></textarea><br>'+
				'<input type="button" id ="todo'+c+'" class="todo btn btn-info" data-toggle="modal" data-target="#todoModal" value="TO-DO">'+
				'          '+
				'<input type="button" id ="comment'+c+'"class="comment btn btn-info" data-toggle="modal" data-target="#commentModal" value="Comment"><div><br></div>'+
				'</div>';
				
				
				console.log("say+c : " + "say"+c);
				console.log("says 위치값 : " + app.saysMap.get("say"+c));
				$(app.saysMap.get("say"+c)).append(str);
				
				var targetSay = app.root.get('say'+c);
				var textarea = document.getElementById('sayText'+c);
				gapi.drive.realtime.databinding.bindString(targetSay, textarea);
			
				
				
				targetSay.addEventListener(gapi.drive.realtime.EventType.TEXT_INSERTED, function(evt){
					var target1 = 'sayText' + c;
					if(evt.isLocal){
						$("#"+target1)
						.css("border-left","solid 20px black")
					}else{
						console.log("다른사람에 의해서 발언 TEXT 가 변경되었습니다.")

						var sessionId1 = evt.sessionId;
						var color1 = '';
						
						var collaborators = app.doc.getCollaborators();
						var collaboratorCount = collaborators.length;
						console.log("collaboratorCount : " + collaboratorCount);
						
						for (var i = 0; i < collaboratorCount; i++) {
						    var user = collaborators[i];
						    console.log("user : " + user);
						    if(user.sessionId == sessionId1){
						    	color1 = user.color;
						    	console.log("발견 색깔은 : " +color1);
						    }
						  }
						
						$("#"+target1)
						.css("border-left","solid 20px "+color1+"")
					}
				});
				targetSay.addEventListener(gapi.drive.realtime.EventType.TEXT_DELETED, function(evt){
					var target1 = 'sayText' + c;
					if(evt.isLocal){
						$("#"+target1)
						.css("border-left","solid 20px black")
					}else{
						console.log("다른사람에 의해서 발언 TEXT 가 변경되었습니다.")

						var sessionId1 = evt.sessionId;
						var color1 = '';
						
						var collaborators = app.doc.getCollaborators();
						var collaboratorCount = collaborators.length;
						console.log("collaboratorCount : " + collaboratorCount);
						
						for (var i = 0; i < collaboratorCount; i++) {
						    var user = collaborators[i];
						    console.log("user : " + user);
						    if(user.sessionId == sessionId1){
						    	color1 = user.color;
						    	console.log("발견 색깔은 : " +color1);
						    }
						  }
						
						$("#"+target1)
						.css("border-left","solid 20px "+color1+"")
					}
				});
				
			}
			app.sayCnt = app.saysMap.size;
			console.log("app.sayCnt : " + app.sayCnt);
		}
		
		//TODO 갯수 만큼 열어주기
		console.log("열린 todo 갯수만큼 열어주기");
		if(app.todoList.length > 0){
			console.log("3-4 app.todoList 가 0보다 클 경우");
			for(var c = 0 ; c < app.todoList.length ; c++){
				var todo = app.todoList.get(c);
				
				// !! 해당 todo가 포함된 say의 위치값 도출 
				var cid = todo.clickedId.toString();
				var loca = cid.replace("todo", "say");
				console.log("todo가 포함된 위치값" + loca);
				
				if(todo.timeRemaining > 0){
		  			var st= "<div id='todoDiv"+todo.no+"' class='todoDiv table-responsive'>"
		  			+"<table class='table table-hover'><tr><td style='width:15%'><span class='glyphicon glyphicon-ok' style='color:green'></span></td><td style='width:20%'>"+todo.who+"</td><td style='width:50%'>"+todo.what+"&emsp;&emsp;<button type='button' class='btn btn-success btn-sm d-day'>D-"+todo.timeRemaining+"</button>"
		  			+"</td><td style='width:15%'><button type='button' class='btn btn-danger btn-xs' onclick = 'deleteTodo("+todo.no+")'  id='todoDelete"+todo.todo_primaryKey+"'> <span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button>"
		  			+"</td></tr></table></div>";
		  		}else if(todo.timeRemaining == 0){
		  			var st= "<div id='todoDiv"+todo.no+"' class='todoDiv table-responsive'>"
		  			+"<table class='table table-hover'><tr><td style='width:15%'><span class='glyphicon glyphicon-ok' style='color:green'></span></td><td style='width:20%'>"+todo.who+"</td><td style='width:50%'>"+todo.what+"&emsp;&emsp;<button type='button' class='btn btn-danger btn-sm d-day'>D-DAY</button>"
		  			+"</td><td style='width:15%'><button type='button' class='btn btn-danger btn-xs' onclick = 'deleteTodo("+todo.no+")'  id='todoDelete"+todo.todo_primaryKey+"'> <span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button>"
		  			+"</td></tr></table></div>";
		  		}else{
		  			var st= "<div id='todoDiv"+todo.no+"' class='todoDiv table-responsive'> "
		  			+"<table class='table table-hover'><tr><td style='width:15%'><span class='glyphicon glyphicon-ok' style='color:green'></span></td><td style='width:20%'>"+todo.who+"</td><td style='width:50%'>"+todo.what+"&emsp;&emsp;<button type='button' class='btn btn-warning btn-sm d-day'>D+"+Math.abs(todo.timeRemaining)+"</button>"
		  			+"</td><td style='width:15%'><button type='button' class='btn btn-danger btn-xs' onclick = 'deleteTodo("+todo.no+")'  id='todoDelete"+app.todo_primaryKey+"'> <span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button>"
		  			+"</td></tr></table></div>";
		  		}
				$('#'+loca).append(st);
			}
		}
		
		//Comment 갯수 만큼 열어주기
		console.log("열린 Comment 갯수만큼 열어주기");
		if(app.commentList.length > 0){
			console.log("3-4 app.commentList 가 0보다 클 경우");
			for(var c = 0 ; c < app.commentList.length ; c++){
				var comment = app.commentList.get(c);
				
				// !! 해당 comment가 포함된 say의 위치값 도출 
				var cid = comment.cClickedId.toString();
				var loca = cid.replace("comment", "say");
				console.log("comment가 포함된 위치값" + loca);
				
				var st= "<div id='commentDiv"+comment.cno+"' class='table-responsive'> "
	  			+"<table class='table table-hover'><tr><td style='width:15%'><span class='glyphicon glyphicon-comment' style='color:#CC0000'></span></td><td style='width:20%'>"+comment.cwho+"</td><td style='width:50%'>"+comment.cwhat+"</td><td style='width:15%'>"
	  			+"<button type='button' class='btn btn-danger btn-xs' onclick = 'deleteComment("+comment.cno+")' id='commentDelete"+comment.cno+"'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td></tr></talbe></div>";
	  			$('#'+loca).append(st);
			}
		}
		
		
		
	        // replaceid();
	}
	
	function bindTextBox(){
		//어젠다 bind 작업
		var target = 'text'+app.cnt;
		var targetCollaborativeText = app.root.get('coltext'+app.cnt);
		var textarea = document.getElementById('text'+app.cnt);
		
		app.binder[app.cnt]= gapi.drive.realtime.databinding.bindString(targetCollaborativeText, textarea);
		targetCollaborativeText.addEventListener(gapi.drive.realtime.EventType.TEXT_INSERTED, function(evt){
			if(evt.isLocal){
				$("#"+target)
				.css("border-left","solid 20px black")
			}else{
				var sessionId = evt.sessionId;
				var color = '';
				
				var collaborators = app.doc.getCollaborators();
				var collaboratorCount = collaborators.length;
				console.log("collaboratorCount : " + collaboratorCount);
				
				for (var i = 0; i < collaboratorCount; i++) {
				    var user = collaborators[i];
				    console.log("user : " + user);
				    if(user.sessionId == sessionId){
				    	color = user.color;
				    	console.log("발견 색깔은 : " +color);
				    }
				  }
				
				$("#"+target)
				.css("border-left","solid 20px "+color+"")
			}
		});
		targetCollaborativeText.addEventListener(gapi.drive.realtime.EventType.TEXT_DELETED, function(evt){
			if(evt.isLocal){
				console.log('아젠다 text가 변경되었습니다.')
				$("#"+target)
				.css("border-left","solid 20px black")
			}else{
				var sessionId = evt.sessionId;
				var color = '';
				
				var collaborators = app.doc.getCollaborators();
				var collaboratorCount = collaborators.length;
				console.log("collaboratorCount : " + collaboratorCount);
				
				for (var i = 0; i < collaboratorCount; i++) {
				    var user = collaborators[i];
				    console.log("user : " + user);
				    if(user.sessionId == sessionId){
				    	color = user.color;
				    	console.log("발견 색깔은 : " +color);
				    }
				  }
				
				$("#"+target)
				.css("border-left","solid 20px "+color+"")
			}
		});
		
	}
	
	function textFieldIndex(evt){
		console.log("Index 리슨!");
		console.log(evt.index);
		
	}
	
	function areaEvent(target){
		console.log("areaEvent");
		console.log(target);
	}
	
	function onAgendaTextChanged(evt){
		
	}
	
	function bindSay(sc){
		//발언 bind 작업
		var target = 'sayText'+sc;
		console.log("bindsay");
		console.log("app.sayCnt : " + sc);
		var targetSay = app.root.get('say'+sc);
		console.log("targetSay : " + targetSay);
		var textarea = document.getElementById('sayText'+sc);
		gapi.drive.realtime.databinding.bindString(targetSay, textarea);
		
		targetSay.addEventListener(gapi.drive.realtime.EventType.TEXT_INSERTED, function(evt){
			if(evt.isLocal){
				$("#"+target)
				.css("border-left","solid 20px black")
			}else{
				var sessionId = evt.sessionId;
				var color = '';
				
				var collaborators = app.doc.getCollaborators();
				var collaboratorCount = collaborators.length;
				console.log("collaboratorCount : " + collaboratorCount);
				
				for (var i = 0; i < collaboratorCount; i++) {
				    var user = collaborators[i];
				    console.log("user : " + user);
				    if(user.sessionId == sessionId){
				    	color = user.color;
				    	console.log("발견 색깔은 : " +color);
				    }
				  }
				
				$("#"+target)
				.css("border-left","solid 20px "+color+"")
			}
		});
		targetSay.addEventListener(gapi.drive.realtime.EventType.TEXT_DELETED, function(evt){
			if(evt.isLocal){
				$("#"+target)
				.css("border-left","solid 20px black")
			}else{
				var sessionId = evt.sessionId;
				var color = '';
				
				var collaborators = app.doc.getCollaborators();
				var collaboratorCount = collaborators.length;
				console.log("collaboratorCount : " + collaboratorCount);
				
				for (var i = 0; i < collaboratorCount; i++) {
				    var user = collaborators[i];
				    console.log("user : " + user);
				    if(user.sessionId == sessionId){
				    	color = user.color;
				    	console.log("발견 색깔은 : " +color);
				    }
				  }
				
				$("#"+target)
				.css("border-left","solid 20px "+color+"")
			}
		});
		
	}
	
	function onValueAdded(evt){
		console.log("Value added");
		console.log("cnt : " + app.cnt);
		console.log("howManyAgenda : " + app.howManyAgenda.get(0));
		var isLocal = evt.isLocal;
		
		
		if(!isLocal){
			//어젠다.
			console.log("local 이벤트가 아닌경우");
			var no = app.howManyAgenda.get(0)-1;
			str ='<div id="agenda'+no+'" class="agenda">'+
			'<div class="panel-primary">'+
			'<div class="panel-heading">'+
			'안건'+(no+1)+'</div>'+
			'<div class="panel-body">'+
			'<button type="button" onclick="addsay('+no+')" class="btn btn-success addSay">+</button>'+
			'<textarea id="text'+no+'" class="agendaText"></textarea>'+
			'</div>'+
			'</div>';
			$(str).insertBefore('#create'); 
			
			var target = 'text'+no;
			
			var targetCollaborativeText = app.root.get('coltext'+no);
			var textarea = document.getElementById('text'+no);
			app.binder[no] = gapi.drive.realtime.databinding.bindString(targetCollaborativeText, textarea);
			
			targetCollaborativeText.addEventListener(gapi.drive.realtime.EventType.TEXT_INSERTED, function(evt){
				if(evt.isLocal){
					$("#"+target)
					.css("border-left","solid 20px black")
				}else{
					var sessionId = evt.sessionId;
					var color = '';
					
					var collaborators = app.doc.getCollaborators();
					var collaboratorCount = collaborators.length;
					console.log("collaboratorCount : " + collaboratorCount);
					
					for (var i = 0; i < collaboratorCount; i++) {
					    var user = collaborators[i];
					    console.log("user : " + user);
					    if(user.sessionId == sessionId){
					    	color = user.color;
					    	console.log("발견 색깔은 : " +color);
					    }
					  }
					
					$("#"+target)
					.css("border-left","solid 20px "+color+"")
				}
			});
			targetCollaborativeText.addEventListener(gapi.drive.realtime.EventType.TEXT_DELETED, function(evt){
				if(evt.isLocal){
					$("#"+target)
					.css("border-left","solid 20px black")
				}else{
					var sessionId = evt.sessionId;
					var color = '';
					
					var collaborators = app.doc.getCollaborators();
					var collaboratorCount = collaborators.length;
					console.log("collaboratorCount : " + collaboratorCount);
					
					for (var i = 0; i < collaboratorCount; i++) {
					    var user = collaborators[i];
					    console.log("user : " + user);
					    if(user.sessionId == sessionId){
					    	color = user.color;
					    	console.log("발견 색깔은 : " +color);
					    }
					  }
					
					$("#"+target)
					.css("border-left","solid 20px "+color+"")
				}
			});
			
			app.cnt = app.howManyAgenda.get(0);
		}
	}
	
	function onSaysValueAdded(evt){
		// say 추가 이벤트 감지
		console.log("say Value added");
		console.log("sayCnt" + app.sayCnt);
		console.log("howManySays : " + app.howManySays.get(0));
		app.sayCnt = app.howManySays.get(0);
		
		
		var isLocal = evt.isLocal;
		
		if(!isLocal){
			
			console.log("local 이벤트가 아닌경우");
			var no = app.howManySays.get(0)-1;
			var target = 'sayText' + no;
			
			str = '<div id="say'+no+'" class="say">'+ 
			'<button type="button" class="btn btn-default btn-md disabled">'+
	        '<span class="glyphicon glyphicon-user"></span> 발언 '+(no+1)+' </button><br><br>'+
			'<textarea id="sayText'+no+'" class="sayText"></textarea><br>'+
			'<input type="button" id ="todo'+no+'" class="todo btn btn-info" data-toggle="modal" data-target="#todoModal" value="TO-DO">'+
			'          '+
			'<input type="button" id ="comment'+no+'"class="comment btn btn-info" data-toggle="modal" data-target="#commentModal" value="Comment"><div><br></div>'+
			'</div>';
			console.log("say+c : " + "say"+no);
			console.log("says 위치값 : " + app.saysMap.get("say"+no));
			$(app.saysMap.get("say"+no)).append(str);
			
			var targetSay = app.root.get('say'+no);
			var textarea = document.getElementById('sayText'+no);
			gapi.drive.realtime.databinding.bindString(targetSay, textarea);
			
			targetSay.addEventListener(gapi.drive.realtime.EventType.TEXT_INSERTED, function(evt){
				if(evt.isLocal){
					$("#"+target)
					.css("border-left","solid 20px black")
				}else{
					var sessionId = evt.sessionId;
					var color = '';
					
					var collaborators = app.doc.getCollaborators();
					var collaboratorCount = collaborators.length;
					console.log("collaboratorCount : " + collaboratorCount);
					
					for (var i = 0; i < collaboratorCount; i++) {
					    var user = collaborators[i];
					    console.log("user : " + user);
					    if(user.sessionId == sessionId){
					    	color = user.color;
					    	console.log("발견 색깔은 : " +color);
					    }
					  }
					
					$("#"+target)
					.css("border-left","solid 20px "+color+"")
				}
			});
			targetSay.addEventListener(gapi.drive.realtime.EventType.TEXT_DELETED, function(evt){
				if(evt.isLocal){
					$("#"+target)
					.css("border-left","solid 20px black")
				}else{
					console.log("다른사람에 의해서 발언 TEXT 가 변경되었습니다.")

					var sessionId = evt.sessionId;
					var color = '';
					
					var collaborators = app.doc.getCollaborators();
					var collaboratorCount = collaborators.length;
					console.log("collaboratorCount : " + collaboratorCount);
					
					for (var i = 0; i < collaboratorCount; i++) {
					    var user = collaborators[i];
					    console.log("user : " + user);
					    if(user.sessionId == sessionId){
					    	color = user.color;
					    	console.log("발견 색깔은 : " +color);
					    }
					  }
					
					$("#"+target)
					.css("border-left","solid 20px "+color+"")
				}
			});
		}
		
		
	}
	
	function onTodoListAdded(evt){
		console.log("todo value added");
		
		var isLocal = evt.isLocal;
		if(!isLocal){
			console.log("local 이벤트가 아닌경우");

			var lastIndex = app.todoList.length;
			var lastTodo = app.todoList.get(lastIndex-1);
			console.log("lastTodo 의 no 값 : " + lastTodo.no);
			//마지막 값의 + 1 값이 새로 운 프라이머리 키 값.
			app.todo_primaryKey = lastTodo.no + 1;
			console.log("todo_primaryKey : " + app.todo_primaryKey ); 
			
			//위치값 구하기
			var cid = lastTodo.clickedId.toString();
			var loca = cid.replace("todo", "say");
			
			if(lastTodo.timeRemaining > 0){
	  			var st= "<div id='todoDiv"+lastTodo.no+"' class='todoDiv table-responsive'>"
	  			+"<table class='table table-hover'><tr><td style='width:15%'><span class='glyphicon glyphicon-ok' style='color:green'></span></td><td style='width:20%'>"+lastTodo.who+"</td><td style='width:50%'>"+lastTodo.what+"&emsp;&emsp;<button type='button' class='btn btn-success btn-sm d-day'>D-"+lastTodo.timeRemaining+"</button>"
	  			+"</td><td><button type='button' class='btn btn-danger btn-xs' onclick = 'deleteTodo("+lastTodo.no+")'  id='todoDelete"+lastTodo.no+"'> <span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button>"
	  			+"</td></tr></table></div>";
	  		}else if(lastTodo.timeRemaining == 0){
	  			var st= "<div id='todoDiv"+lastTodo.no+"' class='todoDiv table-responsive'>"
	  			+"<table class='table table-hover'><tr><td style='width:15%'><span class='glyphicon glyphicon-ok' style='color:green'></span></td><td style='width:20%'>"+lastTodo.who+"</td><td style='width:50%'>"+lastTodo.what+"&emsp;&emsp;<button type='button' class='btn btn-danger btn-sm d-day'>D-DAY</button>"
	  			+"</td><td style='width:15%'><button type='button' class='btn btn-danger btn-xs' onclick = 'deleteTodo("+lastTodo.no+")'  id='todoDelete"+lastTodo.no+"'> <span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button>"
	  			+"</td></tr></table></div>";
	  		}else{
	  			var st= "<div id='todoDiv"+lastTodo.no+"' class='todoDiv table-responsive'> "
	  			+"<table class='table table-hover'><tr><td style='width:15%'><span class='glyphicon glyphicon-ok' style='color:green'></span></td><td style='width:20%'>"+lastTodo.who+"</td><td style='width:50%'>"+lastTodo.what+"&emsp;&emsp;<button type='button' class='btn btn-warning btn-sm d-day'>D+"+Math.abs(lastTodo.timeRemaining)+"</button>"
	  			+"</td><td style='width:15%'><button type='button' class='btn btn-danger btn-xs' onclick = 'deleteTodo("+lastTodo.no+")'  id='todoDelete"+lastTodo.no+"'> <span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button>"
	  			+"</td></tr></table></div>";
	  		}
			$('#'+loca).append(st);
		}
		

		
	}
	//추가 
	function onCommentListAdded(evt){
		
		console.log("comment value added");
		
		var isLocal = evt.isLocal;
		if(!isLocal){
			console.log("local 이벤트가 아닌경우");

			var lastIndex = app.commentList.length;
			var lastComment = app.commentList.get(lastIndex-1);
			console.log("lastComment 의 no 값 : " + lastComment.cno);
			//마지막 값의 + 1 값이 새로 운 프라이머리 키 값.
			app.comment_primaryKey = lastComment.cno + 1;
			console.log("comment_primaryKey : " + app.comment_primaryKey ); 
			
			//위치값 구하기
			var cid = lastComment.cClickedId.toString();
			var loca = cid.replace("comment", "say");

			var st= "<div id='commentDiv"+lastComment.cno+"' class='table-responsive'> "
  			+"<table class='table table-hover'><tr><td style='width:15%'><span class='glyphicon glyphicon-comment' style='color:#CC0000'></span></td><td style='width:20%'>"+lastComment.cwho+"</td><td style='width:50%'>"+lastComment.cwhat+"</td><td style='width:15%'>"
  			+"<button type='button' class='btn btn-danger btn-xs' onclick = 'deleteComment("+lastComment.cno+")' id='commentDelete"+lastComment.cno+"'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span></button></td></tr></talbe>"
  			
			$('#'+loca).append(st);
		}
	}

	function onLocationChange(evt){
	}
	
	function onSaysChanged(evt){
	}
	
	function onTodoChanged(){
	}
	
	function todoChanged(){
	}
	
	function onTodoValueAdded(){
	}
	
	function deletedTodoChanged(){
	}
	function commentChanged(){
		
	}
	function deleteTodo(no){
		console.log("delete" + no);
		console.log("삭제 전 todoList 크기 : " + app.todoList.length);
		$("#todoDiv"+no).remove();
		// 번호에 있는 값 객체 생성 
		var target;
		for (var c = 0 ; c < app.todoList.length ; c++){
			var todo = app.todoList.get(c);
			console.log(todo);
			if(todo.no == no){
				console.log("target 찾음")
				target = todo;
			}else{
				console.log("target 없음 ");
			}
		}
		
		app.deletedTodoList.insert(0, target);
		console.log("deletedTodolist의 0번째 방의 의 todo 의 no : " + app.deletedTodoList.get(0).no);
		app.todoList.removeValue(target);
		console.log("삭제 후 todoList 크기 : " + app.todoList.length);
	}
	//추가
	function deleteComment(no){
		console.log("delete" + no);
		console.log("삭제 전 commentList 크기 : " + app.commentList.length);
		$("#commentDiv"+no).remove();
		// 번호에 있는 값 객체 생성 
		var target;
		for (var c = 0 ; c < app.commentList.length ; c++){
			var comment = app.commentList.get(c);
			console.log(comment);
			if(comment.cno == no){
				console.log("target 찾음")
				target = comment;
			}else{
				console.log("target 없음 ");
			}
		}
		app.deletedCommentList.insert(0, target);
		console.log("deletedCommentlist의 0번째 방의 의 comment 의 cno : " + app.deletedCommentList.get(0).cno);
		app.commentList.removeValue(target);
		console.log("삭제 후 commentList 크기 : " + app.commentList.length);
	}
	
	
	function onTodoListDeleted(evt){
		console.log("onTodoListDeleted");
		var isLocal = evt.isLocal;
		if(!isLocal){
			var deletedTodo = app.deletedTodoList.get(0);
			console.log("deletedTodoList : " + deletedTodo.no);
			$("#todoDiv"+deletedTodo.no).remove();
		}
		
	}
	//추가 
	function oncommentListDeleted(evt){
		console.log("onCommentListDeleted");
		var isLocal = evt.isLocal;
		if(!isLocal){
			var deletedComment = app.deletedCommentList.get(0);
			console.log("deletedCommentList : " + deletedComment.cno);
			$("#commentDiv"+deletedComment.cno).remove();
		}
	}
	
	
	function onDeletedTodoListAdded(){}
	function onDeletedTodoListDeleted(){}
	function onDeletedCommentListAdded(){}
	function onDeletedCommentListDeleted(){}
	
	// 없는 참여자 추가 지우지마세영!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 	function createPartici(){
		var email = document.getElementById('email').value;
		//alert(email);
		//var phone = document.getElementById('phone').value;
		var name = document.getElementById('name').value;
		var meeting_no = realtimeUtils.getParam('id');
		//alert(meeting_no) ;
		//alert(email);
		//alert(name);
		$.ajax({ 
		    	url : '../Meeting/createPartici.action',
		        type : 'post', 
		        dataType : 'json', 
		        data : {email:email, meeting_no:meeting_no, name:name},
		        //data : {email:email, phone:phone, name:name, meeting_no:meeting_no},
		        success : output
		}); 
	}  
	
</script>

<div id="todoModal" class="modal fade" role="dialog" style="background-color: #99CCFF;
;width:400px;">
 	
    <div class="modal-dialog">  
    <table style="text-align: left; margin-left:50px;padding:10px;">
    <tr>
    	<td>
     <!-- profile pictures -->
      <label for="name">Profile</label>
      	</td>
      	<td id = "ptlist_todo">
 
     	</td>
     </tr>
     <tr>	
     	<td>
     <!-- date -->
      <label for="todo_date">DueDate</label>
      	</td>
      	<td>
      <input type="date" name="duedate" id="duedate" class="form-control">
 		</td>
 	</tr>
 	<tr>	
 		<td>
     <!-- todo textarea --> 
      <label for="texts">Todo</label>
      	</td>
      	<td>
       <textarea class="form-control" rows="2" name="todo_texts" id="todo_texts" ></textarea>
     	</td>
    </tr>
    <tr >
      <td style="text-align: center;">
      	<button type="button" class="insert_todo btn btn-default" data-dismiss="modal">추가</button>
      	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </td>
    </tr>
    </table>
 	</div>
</div>
 
<div id="commentModal" class="modal fade" role="dialog" style="background-color: #FFE5B4;
;width:400px;">
 	
    <div class="modal-dialog">  
    <table style="margin-left:30px;">
    <tr>
    	<td>
     <!-- profile pictures -->
      <label for="name">Profile</label>
      	</td>
      	<td id = "ptlist_comment">
     		
     	</td>
 	</tr>
 	<tr>	
 		<td>
     <!-- todo textarea --> 
      <label for="texts">Comment</label>
      	</td>
      	<td>
    <!--   <input type="text" name="comment_texts" id="comment_texts" class="form-control">
     -->  <textarea class="form-control" rows="2" name="comment_texts" id="comment_texts" ></textarea>
     	</td>
    </tr>
    <tr>
      <td>
      	<button type="button" class="insert_comment btn btn-default" data-dismiss="modal">추가</button>
      	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </td>
    </tr>
    </table>
 	</div>
</div>
 
<!-- 새로운 참여자 추가 ---------------------------------------------------------------------------------------------------------------------->
<div id="myTeam" class="modal fade" role="dialog" style="position:fixed; left:930px; top:470px; overflow: hidden; ">
	   
	    <div class="modal-dialog" style="width: 400px">  
		    <div class="modal-content">
		      	<div class="modal-header">
		       	 	<button type="button" class="close" data-dismiss="modal">&times;</button>
		      	  	<h4 class="modal-title">참여자 추가</h4>
		     	 </div>
		      	<div class="modal-body" align="center">
		        	 <table style="font-size: 20px;width: 380px">
					    <tr>
					    	<td style="width: 90px;text-align: center;">
					    		이메일
					 		</td>
					 		<td >
					 			&nbsp;&nbsp;<input type="text" name="email" id="email" style="width: 265px;">
					 		</td>
					 		
					 	</tr>
					 	<tr>
					    	<td style="width: 90px;text-align: center;">
					    		이름
					 		</td>
					 		<td >
					 			&nbsp;&nbsp;<input type="text" name="name" id="name" style="width: 265px;">
					 		</td>
					 		
					 	</tr>
					 	
					    </table>
					    
			      </div><!-- modal body end -->
			      <div class="modal-footer">
			      	   <button type="button" class="insert_party btn btn-default" data-dismiss="modal">추가</button>
			    	   <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			      </div>
		    </div>
	 	</div><!-- modal- dialog end -->
</div><!-- myTeam end -->
  		
  	
  	
  		<!-- 여기에 컨텐츠! -->
	
      <!--main content end *************************************************************************************************
      ********************************************************************************************************************-->        
                     
  </div>                  
      <!-- 공간 맞춰주는 div -->       				
		<div>
		</div>
		
   </div> <!-- /col-lg-9 END SECTION MIDDLE -->
                  
                  
      <!-- **********************************************************************************************************************************************************
      RIGHT SIDEBAR CONTENT
      *********************************************************************************************************************************************************** -->                  
                  
                  <div class="col-lg-3 ds">
                    <!--COMPLETED ACTIONS DONUTS CHART-->
						<h3>Active MEMBER</h3>
                                        
                      <!-- First Action -->
                      <div class="desc" style="text-align:center;" id="collaborators">
                      <!-- 	<p id="timer" style="font-size: 30pt;"></p>
                      	<input type="button" id="myButton" class="btn btn_lx" onclick="toggle()" value="Stop">
                      --> 	
                      
                      
                      
                      
                      <!-- 
                      	<p id="timer" style="font-size: 40pt;">
							<time>00:00:00</time>
						<p>
						<button id="start" class="btn">시작</button>
						<button id="pause" class="btn">종료</button>
						<button id="clear" class="btn">리셋</button>
                       -->	
                      	
                      </div>
                      <!-- Second Action -->
                      <!-- <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                      	</div>
                      	<div class="details">
                      		<p><muted>3 Hours Ago</muted><br/>
                      		   <a href="#">Diana Kennedy</a> purchased a year subscription.<br/>
                      		</p>
                      	</div>
                      </div> -->
                      <!-- Third Action -->
                      <!-- <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                      	</div>
                      	<div class="details">
                      		<p><muted>7 Hours Ago</muted><br/>
                      		   <a href="#">Brandon Page</a> purchased a year subscription.<br/>
                      		</p>
                      	</div>
                      </div> -->
                      <!-- Fourth Action -->
                     <!--  <div class="desc">
                      	<div class="thumb">
                      		<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
                      	</div>
                      	<div class="details">
                      		<p><muted>11 Hours Ago</muted><br/>
                      		   <a href="#">Mark Twain</a> commented your post.<br/>
                      		</p>
                      	</div>
                      </div> -->
                
                       <!-- USERS ONLINE SECTION -->
						<h3>INVITED MEMBERS</h3>
                      <!-- First Member -->
                       
                      <!-- Second Member -->
                <!--       <div class="desc">
                      	<div class="thumb">
                      		<img class="img-circle" src="https://cdn4.iconfinder.com/data/icons/48-bubbles/48/31.ID-Horizontal-128.png" width="35px" height="35px" align="">
                      	</div>
                      	<div class="details">
                      		<p>박명수<br/>
                      		   <muted><a href="#">view profile</a></muted>
                      		</p>
                      		<button type="button" class="btn"><span class="glyphicon glyphicon-facetime-video"></span></button>
                      	</div>
                      </div> -->
                      <!-- Third Member -->
                 <!--      <div class="desc">
                      	<div class="thumb">
                      		<img class="img-circle" src="https://cdn4.iconfinder.com/data/icons/48-bubbles/48/31.ID-Horizontal-128.png" width="35px" height="35px" align="">
                      	</div>
                      	<div class="details">
                      		<p>노홍철<br/>
                      		   <muted><a href="#">view profile</a></muted>
                      		</p>
                      		<button type="button" class="btn"><span class="glyphicon glyphicon-facetime-video"></span></button>
                      	</div>
                      </div> -->
                      <!-- Fourth Member -->
                      <!-- <div class="desc">
                      	<div class="thumb">
                      		<img class="img-circle" src="https://cdn4.iconfinder.com/data/icons/48-bubbles/48/31.ID-Horizontal-128.png" width="35px" height="35px" align="">
                      	</div>
                      	<div class="details">
                      		<p>노홍철<br/>
                      		   <muted><a href="#">view profile</a></muted>
                      		</p>
                      		<button type="button" class="btn"><span class="glyphicon glyphicon-facetime-video"></span></button>
                      		
                      	</div>
                      </div>  -->
                        <!-- Participants add button -->
                      <form role="form">
    					<div class="form-group">
     						 <label for="usr"> </label>
      						<input type="text" class="form-control" id="addperson" placeholder="abc@gmail.com">
   						 </div>
   						</form>
   					
                      <div class="desc" id="addPartyBox" style="text-align:center;">
                      	 <button type="button" id="addParty" class="btn btn-info" data-toggle="modal" data-target="#myTeam">+</button>
                      </div>
                     
                     <!-- 참석자 추가되는 부분 -->  
                       <div class="desc">
                       	<div id="joinList"></div>
                       </div>
                      
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
	
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
     <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

	<script type="text/javascript">
	/*
	var startTimer = setInterval(myTimer, 1000);
var timerElement = document.getElementById("timer");
var buttonElement = document.getElementById("myButton");

 function myTimer(){
    var current = new Date();
    timerElement.innerHTML = current.toLocaleTimeString();
} 

function toggle(){
    if (startTimer) {
        clearInterval(startTimer);
        startTimer = null;
        buttonElement.value = "Start";
    } else {
        buttonElement.value = "Stop";
        startTimer = setInterval(myTimer, 1000);
    }
}
*/
var h1 = document.getElementById('timer'), 
startW = document.getElementById('start'), 
pauseW = document.getElementById('pause'), 
clearW = document.getElementById('clear'),
seconds = 0, minutes = 0, hours = 0, t;

function goTimer() {

function add() {
seconds++;
if (seconds >= 60) {
	seconds = 0;
	minutes++;
	if (minutes >= 60) {
		minutes = 0;
		hours++;
	}
}
h1.textContent = (hours ? (hours > 9 ? hours : "0" + hours)
		: "00")
		+ ":"
		+ (minutes ? (minutes > 9 ? minutes : "0" + minutes)
				: "00")
		+ ":"
		+ (seconds > 9 ? seconds : "0" + seconds);
timer();
}

function timer() {
t = setTimeout(add, 1000);
}

timer();

}
/* Start button */
startW.onclick = goTimer;

/* Stop button */
 
pauseW.onclick = function(){
clearTimeout(t);
}

/* Clear button */
clear.onclick = function() {
h1.textContent = "00:00:00";
seconds = 0;
minutes = 0;
hours = 0;
}

</script>
<script>
  $(function() {

 $("#addperson").change(function(){
  console.log("#addperson 검색창 변경");
  selectedUser = "";
     $("#addperson").val("");
 });
     
    $( "#addperson").autocomplete({
     source : function(request, response){
      $.ajax({
          type:"post",
          dataType:"json",                 
          url:"../Meeting/Addperson.action",          
          data:{email:$("#addperson").val()},
          success:function(data){
        	       	 
        	  response($.map(data.inviteList, function(item){ 
           	return{
                 label:item.i_name+"<"+item.participants_id+">", 
                 value:item.participants_id
                 
            } }));
          },
         })
     },
     
     autoFocus:true,             
     matchContains:true,
     minLength:1,               
     delay:100,        
     //셀렉트 되면
     select:function(event,ui){  
      /* var id = $("#addperson").val(ui.item.participants_id); */
     
      selectedUser = ui.item.value;
     
      
      var flag = false;
      $("#addperson").keydown(function(e){  
       if(e.keyCode == 13){ //enter 
        if(!flag){
          fn_regist();   
         flag = true;
        }
       }
      });
      // 조인테이블에 넣어줌 
      insert(selectedUser)
     }, 
     focus:function(event, ui){return false;} 
    });
  });
  function insert(msg){ //msg : 참여자 이메일
	
	  var meeting_no = realtimeUtils.getParam('id');
	  // 미팅넘버 , 내아이디(세션) , 참여자 아이디
	//등록시 참여자에게 이메일보내기
	  sendEmail(msg);
	 
	  $.ajax({
			url: "../Meeting/insertperson.action",
			type: "post",
			data: {email:msg, meeting_no:meeting_no}, 
			datatype: "json", 
			success: output		
		});	 	
		
	}
  
  function output(msg) { //참석자 리스트 가져오기

	var str='';
	//alert(msg);
	
	$.each(msg.joinList, function(i,item){
	//alert(item.name);
	str+='<div class="desc"><div class="thumb">';//밑에 참석자 사진
	str+='<img class="img-circle" src="https://cdn4.iconfinder.com/data/icons/48-bubbles/48/31.ID-Horizontal-128.png" width="35px" height="35px" align=""></div><div class="details"><p>'; 
	str+='<muted>'+item.participants_id+'</muted>';
	str+='<input type="button" value="초대" class="email" email="'+item.participants_id+'">';
	str+='<input type="button" value="정보" class="checkInfo" email="'+item.participants_id+'">';
	str+=item.name+'<br/>';
	str+='<muted>'+item.participants_id+'</muted><br/>';
	str+='<muted>'+item.phone+'</muted></div></div>';
	/* str+='<input type="button" value="E-mail" class="email" email="'+item.participants_id+'">'; */
	});
			
	$('#joinList').html(str);  

	/* $('.email').on('click',sendEmail); */
	$('.checkInfo').on('click', checkInfo);
	$("#addperson").val("");	
	
	//alert(msg.slavelist);
	
	str="<select id='slavers' class='form_control'>";
	str+="<option value=''>할 일 담당자 선택</option>";
	//alert(str);
	
	 $.each(msg.slavelist, function(i,ya){
		//alert(ya.email);
		//밑에 참석자 사진
		str+="<option value="+ya.email+">"+ya.name+"</option>";
		});
	str+="</select>";
	
	$('#ptlist_todo').html(str); 
	
	
	str="<select id='slavers2' class='form_control'>";
	str+="<option value=''>커멘터 선택</option>";
	//alert(str);
	
	 $.each(msg.slavelist, function(i,ya){
		//alert(ya.email);
		//밑에 참석자 사진
		str+="<option value="+ya.email+">"+ya.name+"</option>";
		});
	str+="</select>";
	
	$('#ptlist_comment').html(str); 
	
  }

  //메일 보내기
  function sendEmail(msg){
	  /* var email = $(this).attr("email"); */
	  var email=msg;
	  
	  var meeting_no = realtimeUtils.getParam('id');
	  
	  $.ajax({
			url: "/minites/pages/ParticipantsMail.jsp",
			type: "post",
			data: {to:email, meeting_no:meeting_no},
			success: console.log(email+'주소로 초대 메일을 보냈습니다.')			
		});	 	
  }
  //상세 정보 보기
  function checkInfo(){
	  var email = $(this).attr("email");
	  var meeting_no = realtimeUtils.getParam('id');
  }

  
  //참석자 리스트 가져오기 - 첫 페이지 열면
  	function initlist(){
  		var meeting_no = realtimeUtils.getParam('id');
  		
		$.ajax({
			url:'../Meeting/joinList.action',
			type:'post',
			data: {meeting_no:meeting_no},
			dataType:'json',
			success:output
		});
	}
</script>	

</body>
</html>