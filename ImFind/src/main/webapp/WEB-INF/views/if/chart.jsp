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

   var chart = {
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
  
});
</script>

</body>
</html>