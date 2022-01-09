<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String str="2012-12-21";  // str.substring(0,3)
	System.out.println("년도"+str.substring(0,4));
	System.out.println("월"+str.substring(5,7));
	System.out.println("일"+str.substring(8,10));
	
	String mail="대#한#민#국";
	
	String[] ary=mail.split("#");
	String mail1="", mail2="";
	for(int i=0;i<ary.length;i++){
		/* mail1=ary[0];
		mail2=ary[1]; */
		System.out.println("ary : "+ary[i]);
	}
/* 	System.out.println("mail1 : "+mail1);
	System.out.println("mail2 : "+mail2); */
	
	
%>
</body>
</html>