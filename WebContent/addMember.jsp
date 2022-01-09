<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int cnt=0;
	try{
		String sql="select max(id) from member1202";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			cnt=rs.getInt(1)+1;
		}else{
			cnt=1;
		}
	}catch(SQLException e){
		System.out.println("데이터 조회 실패");
	}
%>
<form name="form" method="post" action="addMember_Process.jsp">
<h1>회원 가입 등록 화면</h1>
<table border=1 id="tab1">
	<tr>
		<th id="th1">아이디</th>
		<td><input type="text" name="id" id="in1" value="<%=cnt %>">(마지막번호+1)</td>
	</tr>
	<tr>
		<th id="th1">성명</th>
		<td><input type="text" name="name" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">비밀번호</th>
		<td><input type="text" name="password" id="in2"></td>
	</tr>
	<tr>
		<th id="th1">비밀번호 확인</th>
		<td><input type="text" name="password_check" id="in2"></td>
	</tr>
	<tr>
		<th id="th1">성 별</th>
		<td><input type="radio" name="gender" value="남성" checked>남성
			<input type="radio" name="gender" value="여성">여성
		</td>
	</tr>
	<tr>
		<th id="th1">생 일</th>
		<td><input type="number" name="birth" min="1930" max="2021" step="1" value="2020" id="in3">년
			<select name="birthm">
				<option value="01">1</option>
				<option value="02">2</option>
				<option value="03">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>월
			<select name="birthd">
				<option value="01">1</option>
				<option value="02">2</option>
				<option value="03">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				<option value="25">25</option>
				<option value="26">26</option>
				<option value="27">27</option>
				<option value="28">28</option>
				<option value="29">29</option>
				<option value="30">30</option>
				<option value="31">31</option>
			</select>일
		</td>
	</tr>
	<tr>
		<th id="th1">이메일</th>
		<td><input type="text" name="mail1" value="이메일" onfocus="this.value='';"> @ 
			<input type="text" name="mail2" value="" disabled>
			<select name="mail" onchange="mail_change()">
				<option value="0">선택하세요</option>
				<option value="9">직접입력</option>
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="nate.com">nate.com</option>
				<option value="hotmail.com">hotmail.com</option>
				<option value="gmail.com">gmail.com</option>
			</select>
		</td>
	</tr>
	<tr>
		<th id="th1">연락처</th>
		<td><input type="text" name="phone" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">주소</th>
		<td><input type="text" name="address" id="in1"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type=button value="등록" id="btn1" onclick="check()">
			<input type="reset" value="취소" id="btn1">
		</td>
	</tr>
</table>
</form>
<script>
	function check(){
		if(document.form.name.value==""){
			alert("이름을 입력하세요.");
			document.form.name.focus();
		}else if(document.form.password.value==""){
			alert("비밀번호를 입력하세요.");
			document.form.password.focus();
		}else if(document.form.password_check.value==""){
			alert("확인비밀번호를 입력하세요.");
			doument.form.password_check.focus();	
		}else if(document.form.password.value!=document.form.password_check.value){
			alert("비밀번호를 동일하게 입력하세요.");
			document.form.password_check.focus();
		}else if(document.form.password.value==document.form.password_check.value){
			document.form.submit();
			alert("등록이 완료되었습니다.");
		}
	}
	function mail_change(){
		if(document.form.mail.options[document.form.mail.selectedIndex].value=='0'){
			document.form.mail2.disabled = true;
			document.form.mail2.value="";
		}
		if(document.form.mail.options[document.form.mail.selectedIndex].value=='9'){
			document.form.mail2.disabled = false;
			document.form.mail2.value="";
			document.form.mail2.focus();
		}else{
			document.form.mail2.disabled = true;
			document.form.mail2.value = document.form.mail.options[document.form.mail.selectedIndex].value;
		}
	}
</script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>