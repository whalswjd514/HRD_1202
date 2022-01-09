<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	String productId=request.getParameter("productId");
	String name=request.getParameter("name");
	String unitprice=request.getParameter("unitprice");
	String description=request.getParameter("description");
	String manufacturer=request.getParameter("manufacturer");
	String category=request.getParameter("category");
	String unitsInstock=request.getParameter("unitsInstock");
	String condition=request.getParameter("condition");
	try{
		String sql="insert into product1202 values(?,?,?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		pstmt.setString(2, name);
		pstmt.setString(3, unitprice);
		pstmt.setString(4, description);
		pstmt.setString(5, manufacturer);
		pstmt.setString(6, category);
		pstmt.setString(7, unitsInstock);
		pstmt.setString(8, condition);
		pstmt.executeUpdate();
		System.out.println("데이터 등록 성공");
%>
	<script>
		alert("등록 성공");
		location.href="productList.jsp";
	</script>
<%
	}catch(SQLException e){
		System.out.println("데이터 등록 실패");
	}
%>
	<script>
		alert("등록 실패");
		location.href="index.jsp";
	</script>
</body>
</html>