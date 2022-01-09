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
	String name=request.getParameter("name");
	String unitprice=request.getParameter("unitprice");
	String description=request.getParameter("description");
	String manufacturer=request.getParameter("manufacturer");
	String category=request.getParameter("category");
	String unitsInstock=request.getParameter("unitsInstock");
	String condition=request.getParameter("condition");
	String productId=request.getParameter("productId");
	try{
		String sql="update product1202 set name=?,unitprice=?,description=?,manufacturer=?,category=?,unitsInstock=?,condition=? where productId=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, unitprice);
		pstmt.setString(3, description);
		pstmt.setString(4, manufacturer);
		pstmt.setString(5, category);
		pstmt.setString(6, unitsInstock);
		pstmt.setString(7, condition);
		pstmt.setString(8, productId);
		pstmt.executeUpdate();
		System.out.println("데이터 수정 성공");
%>
	<script>
		alert("수정 완료되었습니다.");
		location.href="productList.jsp"
	</script>
<%
	}catch(SQLException e){
		System.out.println("데이터 수정 실패");
	}
%>
	<script>
		alert("수정 실패");
		location.href="index.jsp";
	</script>
</body>
</html>