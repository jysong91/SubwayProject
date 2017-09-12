<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="home" value="/"/>
<!-- findInfoForm -->

<html>
<body>
<form action="${home }member/findInfoProc" method="post">
<h1>
	<c:set var="btnName" value="아이디 검색"/>
	<c:if test='${path eq "/member/searchPw"}'>
		ID : <input type="text" name="id"/><br/>
		<c:set var="btnName" value="패스워드 검색"/>
	</c:if>
	이메일 : <input type="text" name="email"/><br/>
	<input type="submit" value="${btnName }"/>
</h1>
</form>
</body>
</html>








