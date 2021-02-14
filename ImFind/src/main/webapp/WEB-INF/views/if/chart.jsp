<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js" ></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<div id="container" style="width: 300px; height: 450px; margin: 0 auto"></div>
<script>
$(document).ready(function() {
	function chart() {
		var sum=0;
		var lost_data=[];
		var kind =["지갑","카드","휴대폰","현금","귀금속","가방"];
		var alldata;
		$.ajax({
		       url :'chartcount.if',
		       //type : 'POST',
		       data : {'kind': kind},
		       async:false,
		       contentType: 'application/x-www-form-urlencoded;charset=utf-8',
		       //dataType:'json',
		       success: function(data){
		     	lost_data=data;
		     	
		    		for (var i=0; i<lost_data.length; i++){
		    			sum +=lost_data[i]
		    		}
		    		alldata =sum
		     	
		          },
		          
		       error : function() {
		          alert("ajax통신 실패2")
		       }
		 });
		
		var chart = {
		       plotBackgroundColor: null,
		       plotBorderWidth: null,
		       plotShadow: false
		   };
		   var title = {
		      text: '분실물 통계'   
		   };      
		   var tooltip = {
		      pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		   };
		   var plotOptions = {
		      pie: {
		         allowPointSelect: true,
		         cursor: 'pointer',
		         dataLabels: {
		            enabled: true,
		            format: '<b>{point.name}%</b>: {point.percentage:.1f} %',
		            style: {
		               color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
		            }
		         }
		      }
		   };
		   var series= [{
		      type: 'pie',
		      name: '습득물 퍼센트',
		      data: [
		         ['지갑',   Math.round(((lost_data[0]/alldata)*100)*100)/100],
		         ['카드',       Math.round(((lost_data[1]/alldata)*100)*100)/100],
		         ['휴대폰',  Math.round(((lost_data[2]/alldata)*100)*100)/100],
		         ['현금',    Math.round(((lost_data[3]/alldata)*100)*100)/100],
		         ['귀금속',     Math.round(((lost_data[4]/alldata)*100)*100)/100],
		         ['가방',   Math.round(((lost_data[5]/alldata)*100)*100)/100]
		      ]
		   }];     
		      
		   var json = {};   
		   json.chart = chart; 
		   json.title = title;     
		   json.tooltip = tooltip;  
		   json.series = series;
		   json.plotOptions = plotOptions;
		   $('#container').highcharts(json);  
		}); 
	}
	
   
  /*  var chart = {
		      type: 'bar'
		   };
		   var title = {
		      text: '분실물 품목 별 통계 그래프'   
		   };
		   
		   var xAxis = {	  
		      categories: kind,
		      title: {
		         text: null
		      }
		   };
		   var yAxis = {
		      min: 0,
		      title: {
		         text: '분실물 갯수',
		         align: 'high'
		      },
		      labels: {
		         overflow: 'justify'
		      }
		   };
		   var tooltip = {
		      valueSuffix: ' millions'
		   };
		   var plotOptions = {
		      bar: {
		         dataLabels: {
		            enabled: true
		         }
		      }
		   };
		   var legend = {
		      layout: 'vertical',
		      align: 'right',
		      verticalAlign: 'top',
		      x: -40,
		      y: 100,
		      floating: true,
		      borderWidth: 1,
		      backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
		      shadow: true
		   };
		   var credits = {
		      enabled: false
		   };
		   var lost_data=[];
		   $.ajax({
		       url :'chartcount.if',
		       //type : 'POST',
		       data : {'kind': kind},
		       async:false,
		       contentType: 'application/x-www-form-urlencoded;charset=utf-8',
		       //dataType:'json',
		       success: function(data){
		     	lost_data=data;
		     	
		          },
		          
		       error : function() {
		          alert("ajax통신 실패2")
		       }
		 });
		   console.log(lost_data)
		   var series= [{
		          	name: '분실물',
		            data: lost_data
		        }
		   ];     
		      
		   var json = {};   
		   json.chart = chart; 
		   json.title = title;   
		  // json.subtitle = subtitle; 
		   json.tooltip = tooltip;
		   json.xAxis = xAxis;
		   json.yAxis = yAxis;  
		   json.series = series;
		   json.plotOptions = plotOptions;
		   json.legend = legend;
		   json.credits = credits;
		   $('#container').highcharts(json);
		  
		}); */
</script>
<div id="container" style="width: 550px; height: 400px; margin: 0 auto"></div>
</body>
</html>