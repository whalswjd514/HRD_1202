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
	String orderDate=request.getParameter("orderDate");
	String orderName=request.getParameter("orderName");
	String orderQty=request.getParameter("orderQty");
	String name="";
	if(orderDate==null){
		orderDate="";
	}
	if(orderName==null){
		orderName="";
	}
	/* if(productId==null){
		productId="";
	} */
	int unitprice=0;
	int pQty=0,total=0,stock=0;
	if(orderQty==null){
		orderQty="";
		pQty=0;
	}else{
		pQty=Integer.parseInt(orderQty);
	}
	try{
		String sql="select name,unitprice,unitsInstock from product1202 where productId=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs=pstmt.executeQuery();
		if(rs.next()){
			name=rs.getString(1);
			unitprice=rs.getInt(2);
			stock=rs.getInt(3);
			total=pQty*unitprice;
			if(pQty>stock){
			%>
				<script>
					alert("주문수량이 재고수량보다 많습니다.");
					history.back(-1);
				</script>
			<%
			}
		}else if(productId==null || productId.equals("")){
			productId="";
		}else{
			%>
			<script>
				alert("등록되지 않은 코드입니다.");
				history.back(-1);
			</script>
			<%
		}
	}catch(SQLException e){
		System.out.println("database 에러");
	}
%>
<form name="form" method="post" action="addOrder.jsp">
<h1>주문정보 등록</h1>
<table border=1 id="tab3">
	<tr>
		<th id="th2">주문일자</th>
		<td id="td1"><input type="text" name="orderDate" value="<%=orderDate %>" id="in1"></td>
		<th id="th2">주문자 이름</th>
		<td id="td2"><input type="text" name="orderName" value="<%=orderName %>" id="in4"></td>
	</tr>
	<tr>
		<th id="th2">상품코드</th>
		<td id="td1"><input type="text" name="productId" value="<%=productId %>" id="in1" onchange="changesubmit();"></td>
		<th id="th2">상 품 명</th>
		<td id="td2"><input type="text" name="productName" value="<%=name %>" id="in4"></td>
	</tr>
	<tr>
		<th id="th2">단 가</th>
		<td id="td1"><input type="text" name="unitprice" value="<%=unitprice %>" id="in1"></td>
		<th id="th2">주문수량</th>
		<td id="td2"><input type="text" name="orderQty" value="<%=pQty %>" id="in4" onchange="changesubmit();"></td>
	</tr>
	<tr>
		<th id="th2">주문금액</th>
		<td id="td1"><input type="text" name="total" value="<%=total %>" id="in1"></td>
		<th id="th2">주문주소</th>
		<td id="td2"><input type="text" name="address" id="in4"></td>
	</tr>
	<tr>
		<td colspan=4 align=center>
			<button type="button" id="btn3" onclick="history.back(); return false;">목록</button>
			<button type="submit" id="btn3" onclick="check()">저장</button>
		</td>
	</tr>
</table>
</form>
<script>
	function check(){
		if(document.form.orderDate.value==""){
			alert("주문일자를 입력하세요.");
			document.form.orderDate.focus();
		}else if(document.form.orderName.value==""){
			alert("주문자이름을 입력하세요.");
			document.form.orderName.focus();
		}else if(document.form.productId.value==""){
			alert("상품코드를 입력하세요.");
			document.form.productId.focus();
		}else if(document.form.productName.value==""){
			alert("상품명을 입력하세요.");
			document.form.productName.focus();
		}else if(document.form.address.value==""){
			alert("주문자주소를 입력하세요.");
			document.form.address.focus();
		}else{
			form.action="addOrder_Process.jsp";
		}
	}
	
	function changesubmit(){
		document.form.submit();
	}
</script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>