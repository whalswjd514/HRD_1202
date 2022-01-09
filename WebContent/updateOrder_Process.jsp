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
	String orderDate=request.getParameter("orderDate");
	String orderName=request.getParameter("orderName");
	String productId=request.getParameter("productId");
	String name=request.getParameter("name");
	String unitprice=request.getParameter("unitprice");
	String orderQty=request.getParameter("orderQty");
	String orderAddress=request.getParameter("orderAddress");
	try{
		String sql="update order1202 a,product1202 b set to_char(orderDate,'yyyy-mm-dd')=?,orderName=?,a.productId=?,b.name=?,a.unitprice=?,orderQty=?,orderAddress=? where a.productId=b.productId";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, orderDate);
		pstmt.setString(2, orderName);
		pstmt.setString(3, productId);
		pstmt.setString(4, name);
		pstmt.setString(5, unitprice);
		pstmt.setString(6, orderQty);
		pstmt.setString(7, orderAddress);
		pstmt.executeUpdate();
		System.out.println("데이터 수정 성공");
%>
		<script>
			alert("수정 완료");
			history.back(-1);
		</script>
<%
	}catch(SQLException e){
		System.out.println("데이터 수정 실패");
	}
	
%>
		<script>
			alert("수정 실패");
			history.back(-1);
		</script>
</body>
</html>