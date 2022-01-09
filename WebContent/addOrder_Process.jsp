<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String orderDate=request.getParameter("orderDate");
	String orderName=request.getParameter("orderName");
	String productId=request.getParameter("productId");
	String unitprice=request.getParameter("unitprice");
	String orderQty=request.getParameter("orderQty");
	String address=request.getParameter("address");   //2번째 address: 폼에서 받아온 name이 address이므로 address
	
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
		String sql="insert into order1202 values(?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, orderDate);
		pstmt.setString(2, orderName);
		pstmt.setString(3, productId);
		pstmt.setString(4, unitprice);
		pstmt.setString(5, orderQty);
		pstmt.setString(6, address);     //이 address는 위에 String address로 넘어온 값 address를 받음
		pstmt.executeUpdate();
		System.out.println("주문정보 저장 성공");
		
		//재고 수정
		int stock=0;
		sql="select unitsInstock from product1202 where productId=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs=pstmt.executeQuery();
		if(rs.next()){
			stock=rs.getInt(1);   //1대신 unitsInstock
		}else{
			stock=0;
		}
		sql="update product1202 set unitsInstock=? where productId=?";
		pstmt=conn.prepareStatement(sql);
		stock=stock-Integer.parseInt(orderQty);  //위에 string으로 넘겼으니까 int로 넘겨야 함
		pstmt.setInt(1, stock);
		pstmt.setString(2, productId);
		pstmt.executeUpdate();
		%>
			<script>
				alert("저장 및 수정 성공");
				history.back(-1);
			</script>
		<%		
	}catch(SQLException e){
		System.out.println("저장 실패");
		e.printStackTrace();
	}
%>