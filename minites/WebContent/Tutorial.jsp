<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<meta name="google-site-verification" content="UXz3ldGTHm4nMCcg2DJivlpNF_v2InDcAFFM5BA4pe0" />
	<!-- 구글로그인 -->
	<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="108870422126-od1poh2d74f0rnagoubfdddgac39ptr6.apps.googleusercontent.com">
    
    <title>MINITES</title>
 

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="css/animate.min.css" type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/creative.css" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>


<body id="page-top">
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">MINITES</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="#about">About</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#portfolio">Portfolio</a>
                    </li>
                    <li>
              
                        <a class="page-scroll" href="#services">Services</a>
                    </li>
                   <!--  <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li> -->
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

	<!-- 헤더! -->
    <header>
        <div class="header-content">
            <div class="header-content-inner">
                <h1>MINITES</h1>
                <hr><h2>Mini + Meeting minutes</h2>
                <p></p>
                <a href="#about" class="btn btn-primary btn-xl page-scroll">JOIN</a>
            </div>
        </div>
    </header>

    <section class="bg-primary" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center" >
                    <h2 class="section-heading">MINITES</h2>
                    <hr class="light">
                    <p class="text-faded" style="font-size: 20px">Easy & Comfortable<br>쉽고 간편한 당신의 회의록 작성을 도와드립니다.</p>
                    
                    <!-- 로그인버튼@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
                    	
                    	 <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark" style="margin-left:42%">
                    	</div>
                  
                    
                </div>
            </div>
        </div>
    </section>

	
		<!-- 포트폴리오!!!!!!!!!!!!!!!! -->
    <section class="no-padding" id="portfolio">
    	<br><Br><Br>
		<div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">At Our Service</h2>
                    <hr class="primary">
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row no-gutter">
            
            
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="img/portfolio/writemeeting.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    	<h2>회의록 작성</h2>
                                </div>
                                <div class="project-name">
                                    	회의에 최적화된 에디터를 통해 <br>
                                		회의 참여자들과 회의록을 작성할 수 있습니다.
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="img/portfolio/googlelogin_icon.jpg" class="img-responsive" alt="" width="640px">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                          			      <h2>미팅일정 관리</h2>
                                </div>
                                <div class="project-name">
                                  		 구글 캘린더로 간편하게 <br>회의 일정을 관리할 수 있습니다.
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                
                
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="img/portfolio/online_m.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                            		    <h2>온라인 회의</h2>
                                </div>
                                <div class="project-name">
                                    	미팅 장소에 가지 못해도<br>
                                    	실시간으로 온라인 회의가 가능합니다.
                                    	
                                </div>
                                
                                
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="img/portfolio/pdfprint.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    	<h2>PDF로 내보내기</h2>
                                </div>
                                <div class="project-name">
                        			    <!--   -->
                        			     미팅 후, 원하는 양식으로<br>회의록을 내보낼 수 있습니다.
                                </div>
                                
                                
                            </div>
                        </div>
                    </a>
                </div>
                
                
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="img/portfolio/search_icon.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                             		     <h2>검색</h2>
                                </div>
                                <div class="project-name">
                     			        찾고 싶은 회의를<br>
                                    	검색할 수 있습니다.
                                </div>
                                
                                
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="img/portfolio/statistics_icon.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                  	  <h2>통계</h2>
                                </div>
                                <div class="project-name">
                               		   월 별, 주 별 회의 횟 수, 회의 시간을<br>
                                       	그래프로 볼 수 있습니다.
                                </div>
                                
                                
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </section>
	
	
	
	
	
	
	<!-- 기능들!!!!!!!!!!!!!!!!!!!!!!!!!! -->
    <section id="services">
        <!-- <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">At Our Service</h2>
                    <hr class="primary">
                </div>
            </div>
        </div> -->
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                    	<p><img src = "img/googlelogin_icon.png" width="90px" height="90px"></p>
                        <!-- <i class="fa fa-4x fa-write wow bounceIn text-primary"></i> -->
                        <h3>구글 로그인</h3>
                        <p class="text-muted"> 구글 아이디만으로<br>간편하게<br>로그인 할 수 있습니다.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                    	<p><img src = "img/todolist_icon.png" width="90px" height="90px"></p>
                        <!-- <i class="fa fa-4x fa-paper-plane wow bounceIn text-primary" data-wow-delay=".1s"></i> -->
                        <h3>할 일 목록</h3>
                        <p class="text-muted">참여한 회의의<br> 할 일과 담당자들을<br>모아볼 수 있습니다.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                    	<p><img src = "img/sendemail.png" width="90px" height="90px"></p>
                        <!-- <i class="fa fa-4x fa-newspaper-o wow bounceIn text-primary" data-wow-delay=".2s"></i> -->
                        <h3>알림</h3>
                        <p class="text-muted">미팅 장소에 가지 못해도<br>실시간으로<br>온라인 회의가 가능합니다.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                    	<p><img src = "img/meetinglist_icon.png" width="90px" height="90px"></p>
                       <!--  <i class="fa fa-4x fa-heart wow bounceIn text-primary" data-wow-delay=".3s"></i> -->
                        <h3>회의 목록</h3>
                        <p class="text-muted">타임라인 뷰와 캘린더 뷰로<br>회의 일정을<br>확인할 수 있습니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>








    <aside class="bg-dark">
        <div class="container text-center">
            <div class="call-to-action">
                <h2>지금 바로 MINITES를 시작하세요!</h2>
                <!-- 메인화면으로 이동하는 링크 -->
                <a href="#about" class="btn btn-default btn-xl wow tada">시작하기</a>
            </div>
        </div>
    </aside>

    <section id="copyright">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                   <p>Copyright© Team.Minites All Rights Reserved.</p>
               <!--  </div>
                <div class="col-lg-4 col-lg-offset-2 text-center">
                    <i class="fa fa-phone fa-3x wow bounceIn"></i>
                    <p>123-456-6789</p>
                </div>
                <div class="col-lg-4 text-center">
                    <i class="fa fa-envelope-o fa-3x wow bounceIn" data-wow-delay=".1s"></i>
                    <p><a href="mailto:your-email@your-domain.com">minites@start.com</a></p>
                </div> -->
            </div> 
        </div>
    </section>

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/jquery.fittext.js"></script>
    <script src="js/wow.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/creative.js"></script>
    
    <!-- 로그인@@@@@@@@@@@@@@@@@ -->
   <script src="https://apis.google.com/js/platform.js" async defer></script>
    <!-- <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div> -->
    <script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log("Name: " + profile.getName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());
        
        var user_name = profile.getName();
        var user_email = profile.getEmail();
        var user_id = profile.getId();
        var user_photo = profile.getImageUrl();
        
        
       // var isSignedIn = auth2.isSignedIn.get();
       // var currentUser = auth2.currentUser.get();
       
        
        //alert(user_name);
        
        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
        //alert(id_token);
        //alert(user_name);
        location.href="/minites/Meeting/Join.action?id_token="+id_token
        											+"&user_name="+user_name
        											+"&user_email="+user_email
        											+"&user_id="+user_id
        											+"&user_photo="+user_photo;
        		
        if(auth2.isSignedIn.get()) {
        	  var profile = auth2.currentUser.get().getBasicProfile();
        	  console.log('ID: ' + profile.getId());
        	  console.log('Name: ' + profile.getName());
        	  console.log('Image URL: ' + profile.getImageUrl());
        	  console.log('Email: ' + profile.getEmail());
        	}
        
      };
    
    </script>
  </body>
</html>

</body>

</html>