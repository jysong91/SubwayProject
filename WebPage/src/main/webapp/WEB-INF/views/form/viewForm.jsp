<%@ page contentType="text/html; charset=UTF-8"%>

<center>
<table style="width: 650px; ">
	<tr>
		<td style="width: 300px; height:40px;" valign="middle"><h2>${boardInfo.title }</h2></td>
		<td style="width: 350px; height:40px;" align="right" valign="bottom">${boardInfo.writedate }</td>
	</tr>
	<tr>
		<td colspan=2><hr/></td>
	</tr>
	<tr>
		<td  style="width: 300px; height:40px;" valign="top">${boardInfo.id }</td>
		<td style="width: 350px; height:40px;" align="right" valign="top">첨부파일</td>
	</tr>
	<tr>
		<td colspan=2 style="width: 650px; height: 300px" valign="top">
		<pre>
${boardInfo.contents }
		</pre>
		</td>
	</tr>
	<tr>
		<td colspan=2><hr/></td>
	</tr>
	<tr>
		<td colspan=2 align="right">
			<input type=button style="width: 60px; " value='글쓰기'/> 
			<input type=button style="width: 60px; " value='답글'/>
			<input type=button style="width: 60px; " value='수정'/>
			<input type=button style="width: 60px; " value='삭제'/>
			<input type=button style="width: 60px; " value='목록'/>
		</td>
	</tr>
</table>
</center>