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
	String productId=request.getParameter("productId");
	try{
		String sql="select * from product1202 where productId=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String name=rs.getString("name");
			int unitprice=rs.getInt("unitprice");
			String description=rs.getString("description");
			String category=rs.getString("category");
			String manufacturer=rs.getString("manufacturer");
			int unitsInstock=rs.getInt("unitsInstock");
			String condition=rs.getString("condition");
			System.out.println("데이터 조회 성공");
%>
<form name="form" method="post" action="updateProduct_Process.jsp">
<h1>상품 등록 화면</h1>
<table border="1" id="tab1">
	<tr>
		<th id="th1">상품코드</th>
		<td><input type="text" name="productId" id="in1" value="<%=productId %>"></td>
	</tr>
	<tr>
		<th id="th1">상품명</th>
		<td><input type="text" name="name" id="in1" value="<%=name %>"></td>
	</tr>
	<tr>
		<th id="th1">가 격</th>
		<td><input type="text" name="unitprice" id="in1" value="<%=unitprice %>"></td>
	</tr>
	<tr>
		<th id="th1">상세정보</th>
		<td><input type="text" name="description" id="in1" value="<%=description %>"></td>
	</tr>
	<tr>
		<th id="th1">제조사</th>
		<td><input type="text" name="category" id="in1" value="<%=category %>"></td>
	</tr>
	<tr>
		<th id="th1">분 류</th>
		<td><input type="text" name="manufacturer" id="in1" value="<%=manufacturer %>"></td>
	</tr>
	<tr>
		<th id="th1">재고수</th>
		<td><input type="text" name="unitsInstock" id="in1" value="<%=unitsInstock %>"></td>
	</tr>
	<tr>
		<th id="th1">상 태</th>
		<td>
			<input type="radio" name="condition" value="신규 제품"<%if(condition.equals("신규 제품")){%>checked<%}%>>신규 제품
			<input type="radio" name="condition" value="중고 제품"<%if(condition.equals("중고 제품")){%>checked<%}%>>중고 제품
			<input type="radio" name="condition" value="재생 제품"<%if(condition.equals("재생 제품")){%>checked<%}%>>재생 제품
		</td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="등록" id="btn2" onclick="check()">
			<input type="reset" value="취소" id="btn2">
		</td>
	</tr>
<%
		}
	}catch(SQLException e){
		System.out.println("데이터 조회 실패");
	}
%>
</table>
</form>
<script>
	function check(){
		if(document.form.productId.value==""){
			alert("상품코드를 입력하세요.");
			document.form.productId.focus();
		}else if(document.form.name.value==""){
			alert("상품명을 입력하세요.");
			document.form.name.focus();
		}else if(document.form.unitprice.value==""){
			alert("가격을 입력하세요.");
			document.form.unitprice.focus();
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