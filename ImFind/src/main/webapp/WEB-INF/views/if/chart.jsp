<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.js" ></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<div id="container" style="width: 1000px; height: 700px; margin: 0 auto"></div>
<script>
$(document).ready(function() {  
   var kind =["가방","귀금속","도서용품","서류","쇼핑백","스포츠용품","악기","유가증권","의류","자동차","전자기기","증명서","지갑","카드","컴퓨터","현금","휴대폰","기타물품"];
   Highcharts.chart('browser_graph', {
	    chart: {
	        plotBackgroundColor: null,
	        plotBorderWidth: null,
	        plotShadow: false,
	        type: 'pie'
	    },
	    title: {
	        text: ''
	    },
	    tooltip: {
	        pointFormat: '<b>{point.percentage:.1f}%</b>'
	    },
	    accessibility: {
	        point: {
	            valueSuffix: '%'
	        }
	    },
	    plotOptions: {
	        pie: {
	            allowPointSelect: true,
	            cursor: 'pointer',
	            dataLabels: {
	                enabled: true,
	                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
	            },
	            size:220
	        }
	    },
	    series: [{
	        colorByPoint: true,
	        colors:['#7cb5ec', '#e5ec7c','#90ed7d','#f15c80','#8085e9','#ff8d00'],
	        data: [
	            {
	                name: 'Chrome',
	                y: ${chrome.chrome},
	                sliced: false,
	                selected: false
	            }, {
	                name: 'Whale',
	                y: ${whale.whale}
	            }, {
	                name: 'Firefox',
	                y: ${firefox.firefox}
	            }, {
	                name: 'Edge',
	                y: ${edge.edge}
	            }, {
	                name: 'Opera',
	                y: ${opera.opera}
	            }, {
	                name: '기타',
	                y: ${other.other}
	            }
	        ]
	    }]
	});
 
   var series= [{
     	name: '분실물',
       data: lost_data
   }
];     
  
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
  
});
</script>
<div id="browser_graph"></div>
</body>
</html>