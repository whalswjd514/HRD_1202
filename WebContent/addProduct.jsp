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
<form name="form" method="post" action="addProduct_Process.jsp">
<h1>상품 등록 화면</h1>
<table border="1" id="tab1">
	<tr>
		<th id="th1">상품코드</th>
		<td><input type="text" name="productId" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">상품명</th>
		<td><input type="text" name="name" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">가 격</th>
		<td><input type="text" name="unitprice" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">상세정보</th>
		<td><input type="text" name="description" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">제조사</th>
		<td><input type="text" name="category" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">분 류</th>
		<td><input type="text" name="manufacturer" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">재고수</th>
		<td><input type="text" name="unitsInstock" id="in1"></td>
	</tr>
	<tr>
		<th id="th1">상 태</th>
		<td>
			<input type="radio" name="condition" value="신규 제품" checked>신규 제품
			<input type="radio" name="condition" value="중고 제품">중고 제품
			<input type="radio" name="condition" value="재생 제품">재생 제품
		</td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="등록" id="btn2" onclick="check()">
			<input type="reset" value="취소" id="btn2">
		</td>
	</tr>
</table>
</form>
<script>
	function check(){
		var productId=document.getElementById("productId");
		var name=document.getElementById("name");
		var unitprice=document.getElementById("unitprice");
		var unitsInstock=document.getElementById("unitsInstock");
		if(!document.form.productId.value){
			alert("상품코드를 입력하세요.");
			document.form.productId.focus();
		}else if(!document.form.unitprice.value){
			alert("가격을 입력하세요.");
			document.form.unitprice.focus();
		}else if(!document.form.name.value){
			alert("상품명을 입력하세요.");
			document.form.name.focus();
		}else if(name.value.length<4||name.value.length>50){
			alert("[상품명]\n 최소 4자에서 최대 50자까지 입력하세요");
			document.form.name.focus();
		}else if(unitprice.value.length==0 || isNaN(unitprice.value)){
			alert("[가격]\n 숫자만 입력하세요");
			document.form.unitprice.focus();
		}else if(unitprice.value<0){
			alert("[가격]\n 음수를 입력할 수 없습니다.");
			document.form.unitprice.focus();
		}else if(unitsInstock.value.length==0 || isNaN(unitsInstock.value)){
			alert("[재고]\n 숫자만 입력하세요.");
			document.form.unitsInstock.focus();
		}else if(unitsInstock.value<0){
			alert("[재고]\n 음수를 입력할 수 없습니다.");
			document.form.unitsInstock.focus();
		}else{
			document.form.submit();
			alert("등록이 완료되었습니다.");
		}
	}
</script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>