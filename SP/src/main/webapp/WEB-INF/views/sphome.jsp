<%@ page session="false" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/resources/" var="res"></c:url>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>train</title>
    <!-- Bootstrap core CSS -->
    <link href="${res }css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
#scroll {
    width:100%;
    height:800px;
    overflow:hidden;
}
#map {
     width: 2948px; 
     height: 2126px; 
}
.moveCursor{
	cursor:move;
}
.defaultCursor{
	cursor:default;
}    	
    </style>
  </head>

  <body>
	<div id="scroll">
		<img id="map" alt="지하철지도" src="${res }img/forHome/map_korea.jpg">
	</div>
	<div class="imgmap_css_container" id="imgmap2017102017458">
	<a style="position: absolute; top: 245px; left: 838px; width: 16px; height: 10px;"
	  alt="" title="" href="" target="" ><em>아</em></a>
	  <!-- Created by Online Image Map Editor (http://www.maschek.hu/imagemap/index) -->
  	</div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${res }js/jquery.min.js"></script>
    <script src="${res }js/bootstrap.min.js"></script>
    <script src="${res }js/jquery-ui.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
// 	    $("#map").draggable({
// 	    	cursor:"move",
// 	    	containment:[-2948, -2126,0,0 ],
// 	    	scroll:"true"
// 	    });
//		지도 이동용
	    var clicking = false;
	    var previousX;
	    var previousY;
// 	        줌변수
	    var zoomCnt=0;
//		지도 이동용
	    $("#scroll").mousedown(function(e) {
	        e.preventDefault();
	        previousX = e.clientX;
	        previousY = e.clientY;
	        clicking = true;
	    });
	    $(document).mouseup(function() {
	        clicking = false;
	    });
	    $("#scroll").mousemove(function(e) {
	        if (clicking) {
	            e.preventDefault();
	            var directionX = (previousX - e.clientX) > 0 ? 1 : -1;
	            var directionY = (previousY - e.clientY) > 0 ? 1 : -1;
	            //$("#scroll").scrollLeft($("#scroll").scrollLeft() + 10 * directionX);
	            //$("#scroll").scrollTop($("#scroll").scrollTop() + 10 * directionY);
	            $("#scroll").scrollLeft($("#scroll").scrollLeft() + (previousX - e.clientX));
	            $("#scroll").scrollTop($("#scroll").scrollTop() + (previousY - e.clientY));
	            previousX = e.clientX;
	            previousY = e.clientY;
	            $(this).attr('class','moveCursor');
	        }else{
	        	$(this).attr('class','defaultCursor');
	        }
	    });
	    $("#scroll").mouseleave(function(e) {
	        clicking = false;
	    });
// 	    기본적인 줌
// 	    $("#map").on("click", function(){
// 		    $("#map").animate({zoom: '50%'}, "slow");
// 		});
		$('#map').bind('wheel mousewheel', function(e){
			var delta;
			
	        
	        if (e.originalEvent.wheelDelta !== undefined)
	            delta = e.originalEvent.wheelDelta;
	        else
	            delta = e.originalEvent.deltaY * -1;
	
            if(delta > 0&&zoomCnt<=10) {
                $("#map").css("width", "+=100");
                $("#map").css("height", "+=100");
                zoomCnt++;
            }
            else if(zoomCnt>-6){
                $("#map").css("width", "-=100");
                $("#map").css("height", "-=100");
                zoomCnt--;
            }
        });
    });
    </script>
  </body>
</html>
