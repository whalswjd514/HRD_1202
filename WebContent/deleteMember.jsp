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
	String id=request.getParameter("id");
	try{
		String sql="delete from member1202 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		System.out.println("데이터 삭제 성공");
%>
	<script>
		alert("삭제가 완료되었습니다.");
		location.href="selectMember.jsp"
	</script>
<%
	}catch(SQLException e){
		System.out.println("데이터 삭제 실패");
	}
%>
	<script>
		alert("삭제 실패");
		location.href="index.jsp";
	</script>
</body>
</html>