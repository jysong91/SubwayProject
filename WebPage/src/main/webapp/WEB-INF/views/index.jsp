<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<body>
<div align="center">
<table style="width:800px;">
<tr>
	<td style="height:100px;"><c:import url="/top"/></td>
</tr>
<tr>
	<td style="height:400px;"><c:import url="/form/${formPath }"/></td>
</tr>
<tr>
	<td style="height:50px;"><c:import url="/footer"/></td>
</tr>
</table>
</div>
</body>
</html>