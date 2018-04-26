<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="css/style.css">
<title>Yoojin's</title>
</head>
<body>
	<%
		session.invalidate();
	%>
	<script>
		location.href='login.jsp';
	</script>
</body>
</html>
