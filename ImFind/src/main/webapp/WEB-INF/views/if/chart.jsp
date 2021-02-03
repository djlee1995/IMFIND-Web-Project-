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
   var kind =["����","�ͱݼ�","������ǰ","����","���ι�","��������ǰ","�Ǳ�","��������","�Ƿ�","�ڵ���","���ڱ��","����","����","ī��","��ǻ��","����","�޴���","��Ÿ��ǰ"];

   var chart = {
      type: 'bar'
   };
   var title = {
      text: '�нǹ� ǰ�� �� ��� �׷���'   
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
         text: '�нǹ� ����',
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

          alert("ajax��� ����2")

       }
 });
   console.log(lost_data)
   var series= [{
          	name: '�нǹ�',
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