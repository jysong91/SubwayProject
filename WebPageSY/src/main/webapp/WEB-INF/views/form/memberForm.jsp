<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="home" value="/"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#id").keyup(function(){
		var inputed = $('#id').val();
		$.ajax({
	        data : { id : inputed },
	        type : "POST",
	        url : "/WebPageSY/member/idChkProc2",
	        success : function(data) {
	            if(inputed=="" && data=='0') {
	            	$("#idMsg").html("<p style='color:red'>아이디를 입력하세요!!</p>");
	            } else if (data == '0') {
	            	$("#idMsg").html("<p style='color:blue'>사용 가능한 아이디입니다!!</p>");
	            } else if (data == '1') {
	            	$("#idMsg").html("<p style='color:red'>아이디가 중복됩니다!!</p>");
	            } 
	        } 
	    });
	});	
	//비번체크(비밀번호부분 focusout때도 실행해야)
	$("#pwOk").focusout(function(){
		var pw = $("#pw").val();
		var pwOk = $("#pwOk").val();
		if(pw!=pwOk){
			$('#pwMsg').html("<p style='color:red'>비밀번호와 비밀번호 확인이 서로 다릅니다!!</p>")
		}else{
			$("#pwMsg").html("<p style='color:blue'>안전한 비밀번호 입니다!!</p>");
		}
	});
	$("#authSendBtn").on("click", function(){
		var email = $("#email").val();
		if(validateEmail(email)){
			$.ajax({
				data:{email:email},
				type:"POST",
				url:"/WebPageSY/member/authProc",
				success:function(data){
					alert(data);
					$('#authMsg').html("<p style='color:blue'>이메일에서 인증번호를 확인하세요!</p>");
				}
			});
		}else{
			$('#authMsg').text("정확한 이메일 주소를 입력하세요!");
			$('#authMsg').css("color", "red");
		}
	});
	function validateEmail(email) {
		  var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		  return re.test(email);
		}

});
</script>
<center>
<form action="${home }member/memberProc" id="frm" method="post">
<table>
	<tr>
		<td align='right' height=40>아이디</td>
		<td>
			<input type=text name='id' id="id" placeholder='id 입력' value="${member.id }" /> 
		</td>
		<td colspan="2" width=400>
			<div id="idMsg"></div>
		</td>
	</tr>
	<tr>
		<td align='right' height=40>패스워드</td>
		<td>
			<input type=password name='pw' id="pw" placeholder='pw 입력'/> 
		</td>
		<td colspan="2">
		</td>
	</tr>
	<tr>
		<td align='right'>패스워드 확인</td>
		<td>
			<input type=password name='pwOk' id="pwOk" placeholder='pw 입력'/> 
		</td>
		<td colspan="2">
			<div id="pwMsg"></div>
		</td>
	</tr>
	<tr>
		<td align='right' height=40>E-Mail</td>
		<td>
			<input type=email name='email' id="email" placeholder='E-Mail 입력' value="${member.email }"/> 
		</td>
		<td colspan="1">
			<input type="button" value="인증번호 전송" id="authSendBtn">
		</td>
		<td><div id="authMsg"></div></td>
	</tr>
	<tr>
		<td align='right'>인증번호</td>
		<td>
			<input type=text name='authNum' placeholder='인증번호 입력'/> 
		</td>
		<td colspan="2"><button >인증번호 확인</button></td>
	</tr>
	<tr>
		<td align='right'>우편번호</td>
		<td>
			<input type=text name='zipcode' readonly="readonly" value="${member.zipcode }" /> 
		</td>
		<td colspan="2"><button >우편번호 검색</button></td>
	</tr>
	<tr>
		<td align='right'>주소</td>
		<td colspan="3">
			<input type=text name='addr1' readonly="readonly" value="${member.addr1 }" style="width: 475px; "/> 
		</td>
	</tr>
	<tr>
		<td align='right'>상세주소</td>
		<td colspan="3">
			<input type=text name='addr2' value="${member.addr2 }" style="width: 475px; "/> 
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
			<input type=submit value='로그인' style="width: 120px; "/>
			<input type=reset value='취소' style="width: 120px; "/>	 
		</td>
	</tr>
</table>
</form>
</center>