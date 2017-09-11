<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<!-- 
링크 주소에 /move는 절대주소(서비스가 달려지므로 사용X)
그냥 move하면 서비스/move가 됨
 -->
<h1><a href="move">move</a></h1>
<h1><a href="loginProc">login</a></h1>
</body>
</html>
