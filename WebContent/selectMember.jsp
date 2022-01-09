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
<h1>회원 목록</h1>
<table border=1 id="tab2">
	<tr>
		<th id="th2">아이디</th>
		<th id="th2">성 명</th>
		<th id="th2">비밀번호</th>
		<th id="th2">성별</th>
		<th id="th2">생년월일</th>
		<th id="th2">이메일</th>
		<th id="th2">연락처</th>
		<th id="th2">주소</th>
		<th id="th2">입력일</th>
		<th id="th2">구분</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try{
		String sql="select * from member1202 order by id";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			int id=rs.getInt("id");
			String name=rs.getString("name");
			String password=rs.getString("password");
			String gender=rs.getString("gender");
			String birth=rs.getString("birth");
			String mail=rs.getString("mail");
			String phone=rs.getString("phone");
			String address=rs.getString("address");
			String timestamp=rs.getString("timestamp");
			System.out.println("테이블 조회 성공");
%>
	<tr>
		<td><%=id %></td>
		<td><%=name %></td>
		<td><%=password %></td>
		<td><%=gender %></td>
		<td><%=birth %></td>
		<td><%=mail%></td>
		<td><%=phone %></td>
		<td><%=address %></td>
		<td><%=timestamp %></td>
		<td><a href="updateMember.jsp?id=<%=id %>">수정</a> /<br>
			<a href="deleteMember.jsp?id=<%=id %>">삭제</a>
		</td>
	</tr>
<%	
			}
	}catch(SQLException e){
		System.out.println("테이블 조회 실패");
		e.printStackTrace();
	}
%>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>