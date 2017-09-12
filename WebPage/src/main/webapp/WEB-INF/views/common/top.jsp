<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="home" value="/"/>

<style type="text/css">
<!--

a:link{color:black;font-family:sans-serif;text-decoration:none;}
a:visited{color:black;font-family:sans-serif;text-decoration:none;}
a:hover{color:#cc3300; font-weight:bold; }
a:active{color:#ff00cc; text-decoration:underline; }
-->
</style>

<table style="width:800">
	<tr><td align="center" colspan=5><h1>CARE Lab</h1></td></tr>
	<tr align="right">
		<td width=600></td>
		<td><a href="${home }home">홈</a></td>
		<td><a href="${home }loginForm">로그인</a></td>
		<td><a href="${home }memberForm">회원가입</a></td>
		<td><a href="${home }board/selectBoard">게시판</a></td>
	</tr>
	<tr><td align="center" colspan=5><hr/></td></tr>
</table>

