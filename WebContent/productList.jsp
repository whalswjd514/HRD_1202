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
<h1>상품 목록</h1>
<table border="1" id="tab2">
	<tr>
		<th id="th2">no</th>
		<th id="th2">제품코드</th>
		<th id="th2">제품명</th>
		<th id="th2">단가</th>
		<th id="th2">상세정보</th>
		<th id="th2">제조사</th>
		<th id="th2">분류</th>
		<th id="th2">재고수</th>
		<th id="th2">상태</th>
		<th id="th2">구분</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	try{
		String sql="select * from product1202";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String productId=rs.getString(1);
			String name=rs.getString(2);
			int unitprice=rs.getInt(3);
			String description=rs.getString(4);
			String manufacturer=rs.getString(5);
			String category=rs.getString(6);
			int unitsInstock=rs.getInt(7);
			String condition=rs.getString(8);
			no++;
			System.out.println("테이블 조회 성공");
%>
	<tr>
		<td><%=no %></td>
		<td><%=productId %></td>
		<td><%=name %></td>
		<td><%=unitprice %></td>
		<td><%=description %></td>
		<td><%=manufacturer %></td>
		<td><%=category %></td>
		<td><%=unitsInstock %></td>
		<td><%=condition %></td>
		<td><a href="updateProduct.jsp?productId=<%=productId %>">수정</a> / 
			<a href="deleteProduct.jsp?productId=<%=productId %>">삭제</a>
		</td>
	</tr>
<%
			}
	}catch(SQLException e){
		System.out.println("테이블 조회 실패");
	}
%>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>