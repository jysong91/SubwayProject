<%@ page session="false" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/resources/" var="res"></c:url>
<c:url value="/" var="home"></c:url>
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
    <link rel="stylesheet" type="text/css" href="${res }css/traininfo_user.css" />

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
    </style>
  </head>

  <body class="modal-open modal-backdrop">
	<div id="scroll">
		<div id="trainMap">
			<img id="map" alt="지하철지도" src="${res }img/forHome/map_korea.jpg">
			<div class="t_way1 t_way1_0155">
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
			</div>
		</div>
	</div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${res }js/jquery.min.js"></script>
    <script src="${res }js/bootstrap.min.js"></script>
    <script src="${res }js/jquery-ui.min.js"></script>
    <script type="text/javascript">
var currZoom = 1;
var maxZoom = 1.25;
var minZoom = 0.875;
var zoomStep = 0.125;
    $(document).ready(function(){
    	//화면이동
	    $("#trainMap").draggable({
			cursor:"move",
			scroll:false
	    });
	    //화면이동 경계설정(containment)
   		containOptionForDraggable();
	    //마우스휠로 줌
	    $("#trainMap").on('mousewheel DOMMouseScroll', function(e) {
	    	var E = e.originalEvent;
	    	var delta = 0;
	    	//파이어폭스
	    	if (E.detail) {
	    		delta = E.detail * -40;
	    	}
	    	//익스 크롬
	    	else {
	    		delta = E.wheelDelta;
	    	}
	    	
	    	// wheel up
	    	if(delta >= 120){
	    		if(currZoom < maxZoom){
	    			currZoom+=zoomStep;
	    			zoomMap();
	    		}
	    	} else if(delta <= -120){
	    		if(currZoom > minZoom){
	    			currZoom-=zoomStep;
	    			zoomMap();
	    		}
	    	}
	    });
	    //페이지 로딩완료시, 이동할 시작 위치
	    moveScreen(70, -100);
	    
	    //클래스가 t_way로 시작하는 div에 적용
	    $("div[class^=t_way]").on("click",function(e){
	    	$('#myModal').modal({
	    		keyboard: false
	    	});
	    });
    });
function containOptionForDraggable(){
	var mapWidth = 2948 * currZoom;
	var mapHeight = 2126 * currZoom;
	
	var x1 = (-(mapWidth-$(window).width()));
	var x2 = 180;
	var y1 = (-(mapHeight-$(window).height()));
	var y2 = 0;
	
	if(x1 > 0){
		x1 = 0;
	}
	if(y1 > 0){
		y1 = 0;
	}
	$("#trainMap").draggable('option',{'containment':[x1,y1,x2,y2]});
}
function zoomMap(){
// 	// tooltip Off(툴팁 사용한다면 사용)
// 	$(".tip").tooltip( "close" );
	
	$('#trainMap').css('-webkit-transform','scale(' + currZoom + ','+ currZoom + ')');
    $('#trainMap').css('-moz-transform','scale(' + currZoom + ','+ currZoom + ')');
    $('#trainMap').css('-ms-transform','scale(' + currZoom + ','+ currZoom + ')');
    $('#trainMap').css('-o-transform','scale(' + currZoom + ','+ currZoom + ')');
    $('#trainMap').css('transform-origin','50% 50%');
    containOptionForDraggable();
    
    //줌인줌아웃 버튼 있을시 사용
//     if(currZoom >= maxZoom){
// 		$("#zoomIn").addClass("disabled");
//     } else if(currZoom <= minZoom){
// 		$("#zoomOut").addClass("disabled");
// 	} else {
// 		$("#zoomIn").removeClass("disabled");
// 		$("#zoomOut").removeClass("disabled");
// 	}
}
//화면이동용
function moveScreen(left, top){
	var screenMoveToLeft = ((2948 - $(window).width())/2 + 90 + left) * -1;
	var screenMoveToTop = ((2126 - $(window).height())/2 + top) * -1;
	if(screenMoveToLeft > 0){
		screenMoveToLeft = 0;
	}
	if(screenMoveToTop > 0){
		screenMoveToTop = 0;
	}
    $("#trainMap").animate({'left':screenMoveToLeft+'px','top':screenMoveToTop+'px'}, 500);
}
    </script>
  </body>
</html>
