<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>검색결과</title>




</head>
<body>
<!-- 검색결과 -->
               <div id="searchresultpage">
             			<!-- 반복시작 -->
             			<s:iterator value="meetingList" status="num">
             				<div class="white-panel pn" style="height:170px" >
	             				<div class="panel-heading">
			                        <div class="pull-left">
			                        	<h4>
			                        		<i class="fa fa-tasks" ></i>&nbsp;<s:property value="#num.count"/>
			                        		
			                        	</h4>
			                        </div><!-- pull-left -->
			                       
			                 		<br>
			                 	</div>
		             		<table class="table table-hover custom-check" width="1000px">
			             			<tr>
			             				<td width="300px">일시</td>
			             				<td width="700px">
			             					<s:property value="meeting_start"/>~<s:property value="meeting_end"/>
			             				</td>
			             			</tr>
			             			<tr>
			             				<td>회의 제목</td>
			             				<td>
			             					<s:property value="title"/>
			             				</td>
			             			</tr>
			             			<tr>
			             				<td>장소</td>
			             				<td>
			             					<s:property value="place"/>
			             				</td>
			             			</tr>
		             				
		             		</table>
		             	
		             </div>	
		             	<br>
		             </s:iterator>	
            	 </div>
    
</body>
</html>