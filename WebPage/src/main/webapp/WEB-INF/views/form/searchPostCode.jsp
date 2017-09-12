<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="home" value="/"/>
<!-- searchPostCode -->
<script type="text/javascript">
<!--
function setParentAddr(zipcode, addr){
	var pDoc = opener.document; 
	pDoc.getElementById('zipcode').value=zipcode;
	pDoc.getElementById('addr1').value=addr;
	window.close();
}
//-->
</script>

<style type="text/css">
<!--
.div_over{background-color: pink;}
.div_out{background-color: #FFFFFF;}
-->
</style>
<html>
<body>
<form action="${home }member/searchZipcode" method="post">
<h1>
	동면<input type="text" name="addr"/>
	<input type="submit" value="우편번호 검색"/>
</h1>
</form>
<br/>
<c:forEach var="zip" items="${zipcodeLst }">
	<c:set var="zipcode" value="${zip.zipcode }"/>
	<c:set var="address" value="${zip.sido } ${zip.sigungu } ${zip.ubmyeun } ${zip.dong1 } ${zip.dong2 } ${zip.ri }"/>
	<div onmouseover="this.className='div_over'"
	onmouseout="this.className='div_out'"
	onclick="setParentAddr('${zipcode }', '${address }')"
	>
	[${zipcode }] ${address }
	</div>
</c:forEach>
</body>
</html>








