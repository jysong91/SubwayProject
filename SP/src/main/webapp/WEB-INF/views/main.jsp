<%@ page session="false" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value="/resources/" var="res"></c:url>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<title>서울교통공사 지하철안전지킴이 실시간 열차 정보</title>
<link rel="stylesheet" href="${res}css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="${res }css/traininfo_user.css" />
<script type="text/javascript" src="${res }js/jquery.js"></script>
<script type="text/javascript" src="${res }js/jquery-ui.js"></script>
<script type="text/javascript" src="${res }js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript">
//Zoom
var currZoom = 1;
var maxZoom = 1.25;
var minZoom = 0.875;
var zoomStep = 0.125;
var rv = 0;

$(document).ready(function(e) {
	
	//익스플로러 버전 체크
	rv = getInternetExplorerVersion();
	
	if ( rv >= 0 && rv <= 8 ){
		$("#zoomIn").hide();
		$("#zoomOut").hide();
		alert("실시간 열차운행 정보는 Internet Explorer 9 이상만 지원합니다. \n\n정상적인 서비스 이용을 위해 상위 버전의 브라우저를 사용해주세요.");
	}
	// 공지사항 팝업
	callNoticePop();
	 
	// 드래그 가능(노선도)
	$("#trainMap").draggable({
		cursor: "move",
		scroll: false
	});
	containOptionForDraggable();

	//확대 init
	if(currZoom >= maxZoom) {
		$("#zoomIn").addClass("disabled");
	} else if(currZoom <= minZoom) {
		$("#zoomOut").addClass("disabled");
	}
	
	// 확대
	$("#zoomIn").click(function(){
        if(currZoom < maxZoom){
	        currZoom += zoomStep;
	        zoomMap();
        }
    });

	// 축소
    $("#zoomOut").click(function(){
    	if(currZoom > minZoom){
	        currZoom -= zoomStep;
	        zoomMap();
    	}  
    });
	
    // 마우스휠업 이벤트 
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
    
	// 화면 이동 (2호선 노선도)
	moveScreen(300, -270);
	
	
});

$(window).resize(function(){
	containOptionForDraggable();
	$("#trainMap").css({'left':0,'top':0});
});


// 공지사항 팝업
function callNoticePop() {
	
}

// 호선 선택
// function lineChange(searchLine) {
	
// 	$("#subwayMap").attr("class","subway"+(searchLine == 0 ? "All":searchLine)+($("#isCb").val() == "Y" ? "_cb":""));
// 	$("div[class$=line_metro], div[class$=line_korail]").html("");
	
// 	$("div[class^=line]").html("");
// 	$(".line"+searchLine).append("<div class='line_on'></div>");
// 	$("input[name=searchLineNumCd]").val(searchLine);

	
// 	// 화면이동
// 	if(searchLine == 1){
// 		moveScreen(0, -10);
// 	} else if(searchLine == 2){
// 		moveScreen(0, 0);
// 	} else if(searchLine == 3){
// 		moveScreen(0, -60);
// 	} else if(searchLine == 4){
// 		moveScreen(0, 30);
// 	} else if(searchLine == 5){
// 		moveScreen(30, -20);
// 	} else if(searchLine == 6){
// 		moveScreen(80, -200);
// 	} else if(searchLine == 7){
// 		moveScreen(-10, -150);
// 	} else if(searchLine == 8){
// 		moveScreen(500, 300);
// 	} else if (searchLine == 0){
// 		moveScreen(0, 0);
// 	}
// }

// //자동 새로고침 시간 갱신용
// function autoReloadTimeReset() {
// 	autoReloadSec = autoReloadSec -1;
// 	if( autoReloadSec < 0 ) {
// 		autoReloadSec = 0;
// 	}
// 	autoReloadSecTimeOut = setTimeout(autoReloadTimeReset,1000); // 1초
// }

//인터넷익스플로러 버전 체크
function getInternetExplorerVersion() {    
    var rv = -1;   
    if (navigator.appName == 'Microsoft Internet Explorer') {        
         var ua = navigator.userAgent;        
         var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");        
         if (re.exec(ua) != null)            
             rv = parseFloat(RegExp.$1);    
        }    
    return rv; 
} 


// zoom in/out
function zoomMap(){
	// tooltip Off
	$(".tip").tooltip( "close" );
	
	//크롬,사파리,오페라
	$('#trainMap').css('-webkit-transform','scale(' + currZoom + ','+ currZoom + ')');
    //모질라(파폭)
	$('#trainMap').css('-moz-transform','scale(' + currZoom + ','+ currZoom + ')');
    //익스9
    $('#trainMap').css('-ms-transform','scale(' + currZoom + ','+ currZoom + ')');
    //오페라
    $('#trainMap').css('-o-transform','scale(' + currZoom + ','+ currZoom + ')');
    
    $('#trainMap').css('transform-origin','50% 50%');
    
    containOptionForDraggable();
    
    if(currZoom >= maxZoom){
		$("#zoomIn").addClass("disabled");
    } else if(currZoom <= minZoom){
		$("#zoomOut").addClass("disabled");
	} else {
		$("#zoomIn").removeClass("disabled");
		$("#zoomOut").removeClass("disabled");
	}
}
function containOptionForDraggable(){
	var mapWidth = 1928 * currZoom;
	var mapHeight = 1565 * currZoom;
	
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

// 화면 이동
function moveScreen(left, top){
	var screenMoveToLeft = ((1928 - $(window).width())/2 + 90 + left) * -1;
	var screenMoveToTop = ((1565 - $(window).height())/2 + top) * -1;
	if(screenMoveToLeft > 0){
		screenMoveToLeft = 0;
	}
	if(screenMoveToTop > 0){
		screenMoveToTop = 0;
	}
    $("#trainMap").animate({'left':screenMoveToLeft+'px','top':screenMoveToTop+'px'}, 500);
}
</script>
</head>
<body  oncontextmenu="return false;" onselectstart="return false;">
<!--   <nav id="traininfo-nav"> -->
<!--     <div id="metro_logo"> -->
<!--       <img src="/images/train/user/logo_metro.png" alt="서울교통공사" /> -->
<!--     </div> -->
<!--     <div id="logo"> -->
<!--       <img src="/images/train/user/menu_title.png" alt="실시간 열차 운행 정보" /> -->
<!--     </div> -->
<!--     <div class="menu"> -->
<!--       <div class="lineAll" onclick="javascript:lineChange('0')"></div> -->
<!--       <div class="line1" onclick="javascript:lineChange('1')"></div> -->
<!--       <div class="line2" onclick="javascript:lineChange('2')"></div> -->
<!--       <div class="line3" onclick="javascript:lineChange('3')"></div> -->
<!--       <div class="line4" onclick="javascript:lineChange('4')"></div> -->
<!--       <div class="line5" onclick="javascript:lineChange('5')"></div> -->
<!--       <div class="line6" onclick="javascript:lineChange('6')"></div> -->
<!--       <div class="line7" onclick="javascript:lineChange('7')"></div> -->
<!--       <div class="line8" onclick="javascript:lineChange('8')"></div> -->
<!--       <div style="font-size:11px; color:yellow;padding:10px 5px;">※ 전동차 운행상황에 따라 정보의<br/>　오차가 있을 수 있습니다.</div> -->
<!--     </div> -->
<!--   </nav> -->
  <div id="traininfo-contents">
      <!-- 노선도 -->						
      <div class="subwayAll" id="trainMap" style="position: relative; -ms-overflow-style: none; left: 0px; top: 0px; display:block;">
      
<script>
$(document).ready(function(){
	var searchLine = 0;
	
	var imgDefaultName = "";
	var imgDefaultName2 = "";
	var imgName = "";
	var imgName2 = "";
	var left = 0;
	var top = 0;
	var isError = false;
	$("div[class^=T]").each(function(idx, obj){
		if($(obj).attr("data-statnTcd") != ""){
			imgDefaultName = $(obj).css("background-image");
			imgDefaultName2 = imgDefaultName.substring(imgDefaultName.indexOf("/images/"),imgDefaultName.length-2);
			imgName = $(obj).css("background-image").replace("default",$(obj).attr("data-statnTcd"));
			imgName2 = imgName.substring(imgName.indexOf("/images/")).replace(")","").replace("\"","").replace("\'","");
			
			// 열차 이미지 추가
			if(imgDefaultName != undefined && imgDefaultName != "none"){
				$(obj).append(
					$("<img/>")
						.on('load', function() {
							if($(this).attr("src") != "/images/common/transparent.png" ){
								$(obj).css("background-image","url(/images/common/transparent.png)");
							}
						})
					    .on('error', function() { 
					    	$(this).attr("src","/images/common/transparent.png");
					    })
					    .attr("src",imgName2)
					    .css({"width":"38px","height":"29px"})
				);
			
				// 익스플로러 8이하 일때
				if(rv != undefined && rv >= 0 && rv <= 8){
					$(obj).css({
						"width":"38px",
						"height":"29px",
						"margin":"5.5px 1px",
						"background-image":"url(/images/common/transparent.png))",
						"filter":"progid:DXImageTransform.Microsoft.AlphaImageLoader( src='" + imgDefaultName2 + "', sizingMethod='scale'",
						"-ms-filter":"\"progid:DXImageTransform.Microsoft.AlphaImageLoader( src='" + imgDefaultName2 + "', sizingMethod=\'scale\')\""
					});
					
				} else {
					$(obj).find("img").css("margin","5.5px 1px");
				}
			}
		}
	});
	
	// 서울시 API의 메트로 구간 데이터 display off
	$("div[class$='korail'] div").filter(function(index){
		return $(this).css("background-image") === "none";
	}).css("display", "none");
	
	$("div[class^=t_way]").on("click",function(e){
		var changeLine = $(this).parent().attr('class').substr(0,1);
		if(searchLine != changeLine) {
			lineChange(changeLine);
		} else {
			lineChange('0');
		}
	});
	
	$(".tip").tooltip({
		position: {
			my: "center bottom",
	        at: "center top-10",
	        collision: "flip",
	        using: function( position, feedback ) {
	            $( this ).addClass( feedback.vertical )
	                .css( position );
	        }
		}
		/**
		,content: function(callback) { 
		     callback($(this).prop('title').replace('열차 ', '열차<br/>')); 
		}
		*/
	});
	
	//zoom 효과 유지
	//if(currZoomStep != undefined && currZoomStep != 0){
	//	zoomMap(0, currZoomStep);
	//}
});
$('.tip').mouseover(function(){
	$(this).css('z-index',9999);
}).mouseout(function(){
	$(this).css('z-index',9998); 
});
</script>
		<div class="t_way1_0155" id="dongdaemoon">
		</div>
      </div>
    
    <div id="zoomIn"></div>
    <div id="zoomOut"></div>
    
  </div>
</body>
</html>
