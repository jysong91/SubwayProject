<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="home" value="/"/>
<script type="text/javascript">
<!--
function formProc(cmd){
	var frm = document.getElementById('frm');
	frm.action=cmd;
	frm.submit();
}
function SearchPostCode(cmd){
	window.open(cmd, "_blank", "width=400, height=400");
}
//-->
</script>
<h1>인증번호 : ${sessionInfo}</h1> 
<h1>인증번호 : ${sessionInfo.authNum}</h1>
<center>
${msg }
<form id='frm' action="${home }member/memberProc" method="post">
<table>
	<tr>
		<td align='right' height=40>아이디</td>
		<td>
			<input type=text name='id' placeholder='id 입력' value="${member.id }"/> 
		</td>
		<td colspan="2"><input type="button" onclick="formProc('${home}member/isExistId');" value="ID 중복확인"/></td>
	</tr>
	<tr>
		<td align='right' height=40>패스워드</td>
		<td>
			<input type=text name='pw' placeholder='pw 입력' value="${member.pw }"/> 
		</td>
		<td align='right'>패스워드 확인</td>
		<td>
			<input type=text name='pwOk' placeholder='pw 입력'/> 
		</td>
	</tr>
	<tr>
		<td align='right' height=40>E-Mail</td>
		<td>
			<input type=text name='email' placeholder='E-Mail 입력' value="${member.email }"/> 
		</td>
		<td colspan="2"><input type="button" onclick="formProc('${home}member/reqAuthNum');" value="인증번호 전송"/></td>
	</tr>
	<tr>
		<td align='right'>인증번호</td>
		<td>
			<input type=text name='authNum' placeholder='인증번호 입력'/> 
		</td>
		<td colspan="2"><input type="button" onclick="formProc('${home}member/authNumConfirm');" value="인증번호 확인"/></td>
	</tr>
	<tr>
		<td align='right'>우편번호</td>
		<td>
			<input type=text id='zipcode' name='zipcode' readonly="readonly" value="${member.zipcode }"/> 
		</td>
		<td colspan="2"><input type="button" onclick='SearchPostCode("${home}member/searchPostCode");' value="우편번호 검색"/></td>
	</tr>
	<tr>
		<td align='right'>주소</td>
		<td colspan="3">
			<input type=text id='addr1' name='addr1' readonly="readonly" style="width: 475px; " value="${member.addr1 }"/> 
		</td>
	</tr>
	<tr>
		<td align='right'>상세주소</td>
		<td colspan="3">
			<input type=text name='addr2' style="width: 475px; " value="${member.addr2 }"/> 
		</td>
	</tr>
	<tr>
		<td align='right' width=120>성 별</td>
		<td colspan="3">
			<input type=radio name='gender' value='m' checked="checked"/>남자
			<input type=radio name='gender' value='w' />여자 
		</td>
	</tr>
	
	<tr>
		<td align='center' height=40 colspan=4>
			<input type=submit value='회원가입' style="width: 120px; "/>
			<input type=reset value='취소' style="width: 120px; "/>	 
		</td>
	</tr>
</table>
</form>
</center>