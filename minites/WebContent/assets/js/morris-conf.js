$(document).ready(function() {
	//버튼 연결
	
	/*$('#left_week').on('click',next_week);
	$('#right_week').on('click',last_week);*/
	
	$('#left_month').on('click',next_month);
	$('#right_month').on('click',last_month);
	
	init(); 
});

//지난 주 버튼 클릭
function last_week() {
	alert("last_week 함수");
	var src=$(this).attr('week_week');
	alert(src);

	$.ajax({
	url:'lastweek.action',//화면에 나타난 주의 값을 입력 받아, -1 해줘서 정보를 출력해옴
	type:'post',			//이번 달, 지난 주, 이번 달 안건별 정보 받아와야함 
	data:{src:src},
	dataType:'json', 		//-> output 메소드에 var month = msg.list.month 
	success:output				// ->$('#listDiv').html(str); / jsp 페이지 안에 div id=listDiv 
});

}

//다음 주
function next_week() {
	alert("right_week 함수");
	var src=$(this).attr('week_week');
	alert(src);
	
	$.ajax({
		url:'nextweek.action',//화면에 나타난 주의 값을 입력 받아, -1 해줘서 정보를 출력해옴
		type:'post',			//이번 달, 지난 주, 이번 달 안건별 정보 받아와야함 
		data:{src:src},
		dataType:'json', 		//-> output 메소드에 var month = msg.list.month 
		success:output				// ->$('#listDiv').html(str); / jsp 페이지 안에 div id=listDiv 
	});
}

//지난 달
function last_month() {
	
	var src=$(this).attr('month_month');
		
	$.ajax({
		url:'lastmonth.action',
		type:'post',			 
		data:{src:src},
		dataType:'json', 		 
		success:output	 
	});
}

//다음 달
function next_month() {
	
	var src=$(this).attr('month_month');
		
	$.ajax({
		url:'nextmonth.action',
		type:'post',			 
		data:{src:src},
		dataType:'json', 		 
		success:output			 
	});
}


//처음 페이지가 열릴 시 리스트를 가져옴
function init(){
	$.ajax({
		url:'thisMonthList.action',//이번 달, 이번 주, 이번 달 안건별 정보 받아와야함
		type:'post',			//그래프 데이터 외, 10월, 10월 2째주 라고 JSP에 표현할 값도 넘겨줘야함.
		dataType:'json', 
		success:output
	});
}



	
//데이터 받는 메소드; 그래프, 통계정보
function output(msg){
	
		/*$('#week-bar').html('');
		$('#week-line').html('');
		$('#month-bar').html('');
		$('#month-line').html('');
		$('#agenda-bar').html('');
		$('#agenda-line').html('');
		*/
		//이번 달 통계 정보
		$.each(msg.month_total_list, function(i,item){ //msg 자체는 action에 들어가 있는 모든 값이기 때문에 msg.list 로 지정을 해준다.
			var total_count_month=item.total_count_month+'회';
			var total_time_month=item.total_time_month+'시간'; 
			var total_title_month=item.total_title_month+'건'; 
			var total_person_month=item.total_person_month+'명'; 
			var year_month=item.year_month+'년'; 
			var month_month=item.month_month+'월'; 
			$('#total_count_month').html(total_count_month);
			$('#total_time_month').html(total_time_month);
			$('#total_title_month').html(total_title_month);
			$('#total_person_month').html(total_person_month);
			$('#year_month').html(year_month);
			$('#month_month').html(month_month);
			$('img').attr('month_month',month_month);
				
		});
		
		//이번 주 통계 정보
		$.each(msg.week_total_list, function(i,item){ //msg 자체는 action에 들어가 있는 모든 값이기 때문에 msg.list 로 지정을 해준다.
			var total_count_week=item.total_count_week+'회';
			var total_time_week=item.total_time_week+'분'; 
			var total_title_week=item.total_title_week+'건'; 
			var total_person_week=item.total_person_week+'명'; 
			var month_week=item.month_week+'월'; 
			var week_week=item.week_week+'주'; 
			$('#total_count_week').html(total_count_week);
			$('#total_time_week').html(total_time_week);
			$('#total_title_week').html(total_title_week);
			$('#total_person_week').html(total_person_week);
			$('#month_week').html(month_week);
			$('#week_week').html(week_week);
			$('img').attr('week_week',week_week);	
		});
		
		//안건 별 통계 정보
		$.each(msg.agendaList, function(i,item){ //msg 자체는 action에 들어가 있는 모든 값이기 때문에 msg.list 로 지정을 해준다.
			var month_agenda=item.month_agenda+'월';
			$('#month_agenda').html(month_agenda);
				
		});
		
		
		//이번 달 표
		$(function(){
			
			
			var info_table='<h2><i class="fa fa-angle-right"></i>회의정보</h2>';
			info_table+='<section id="unseen">';
			info_table+='<table class="table table-bordered table-striped table-condensed">';
			info_table+='<thead>';
			info_table+='<tr>';
			info_table+='<th>날 짜</th>';
			info_table+='<th>제 목</th>';
			info_table+='<th class="numeric">장 소</th>';
			info_table+='<th class="numeric">시작 시간</th>';
			info_table+='<th class="numeric">종료 시간</th>';
			info_table+='</tr>';
			info_table+='</thead>';
			info_table+='<tbody>';
            
            $.each(msg.month_table_list, function(i,item){ 
            	info_table+='<tr>';	
            	info_table+='<td>'+item.inputdate+'</td>';
            	info_table+='<td>'+item.title+'</td>';			
            	info_table+='<td class="numeric">'+item.place+'</td>';
            	info_table+='<td class="numeric">'+item.starttime+'</td>';
            	info_table+='<td class="numeric">'+item.endtime+'</td>';
            	info_table+='</tr>';
            });
            info_table+='</tbody>';
            info_table+='</table>';
            info_table+='</section>';
                
                $('#info_table').html(info_table);
		})
		
		
		//그래프 그리기
		$(function () {
	        //달 막대
	    	Morris.Bar({
	        element: 'month-bar',
	        data: msg.month_graph_list,
	        xkey: 'graph_month',
	        ykeys: ['graph_count_month'],
	        labels: ['미팅 횟수'],
	        barRatio: 0.4,
	        xLabelAngle: 35,
	        hideHover: 'auto',
	        barColors: ['#4da74d'],//#ac92ec
	        gridTextSize: 20
	      });
	      
	    	//달 꺾은선
	    	Morris.Line({
	          element: 'month-line',
	          data: msg.month_graph_list,
	          xkey: 'graph_month',
	          ykeys: ['graph_time_month'],
	          xLabelAngle: 35,
	          parseTime: false,
	          lineColors:['#ed5565','#ed5565'],
	          hideHover: 'auto',
	          labels: ['미팅 시간(시간)'],
	          gridTextSize: 20
	        });
	    	
	    	//이번 주 막대
	    	Morris.Bar({
		        element: 'week-bar',
		        data: msg.week_graph_list,
		        xkey: 'graph_we',
		        ykeys: ['graph_count_week'],
		        labels: ['미팅 횟수'],
		        hideHover: 'auto',
		        barColors: ['#4da74d'],//#ac92ec#4da74d
		        gridTextSize: 20
		      });
	    	
	    	//이번 주 꺾은선
	    	Morris.Line({
		          element: 'week-line',
		          data: msg.week_graph_list,
		          xkey: 'graph_we',
		          ykeys: ['graph_time_week'],
		          parseTime: false,
		          lineColors:['#ed5565'],
		          hideHover: 'auto',
		          labels: ['미팅 시간(분)'],
		          gridTextSize: 20
		        });
	    	
	    	//안건 별 막대
	    	Morris.Bar({
		        element: 'agenda-bar',
		        data: msg.agendaList,
		        xkey: 'title_agenda',
		        ykeys: ['count_agenda'],
		        labels: ['미팅 횟수'],
		        barRatio: 0.4,
		        xLabelAngle: 35,
		        hideHover: 'auto',
		        barColors: ['#4da74d'],//#ac92ec
		        gridTextSize: 20
		      });
	    	
	    	//안건 별 꺾은선
	    	Morris.Line({
		          element: 'agenda-line',
		          data: msg.agendaList,
		          xkey: 'title_agenda',
		          ykeys: ['runtime_agenda'],
		          parseTime: false,
		          lineColors:['#ed5565'],
		          hideHover: 'auto',
		          labels: ['미팅 시간(분)'],
		          gridTextSize: 20
		        });
	      
	   
	    })
	    
}
	 









