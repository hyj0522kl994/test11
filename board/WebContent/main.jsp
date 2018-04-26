<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID= (String) session.getAttribute("userID");
		}
		if(session.getAttribute("userID") == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
	%>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar absce"></span>
	        <span class="icon-bar absce"></span>
	        <span class="icon-bar absce"></span>
	      </button>
	      <a class="navbar-brand" href="#">Yoojin's</a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="#">Home</a></li>
	        <li><a href="board.jsp">게시판</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Log Out</a></li>
	      </ul>
	    </div>
	  </div>
	</nav>

	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>웹사이트 소개</h1>
				<p>게시판 사이트 입니다.</p>
				<p><a class="btn btn-primary btn-pull" href="#" role="button">자세히 알아보기</a></p>
			</div>
		</div>
	</div>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>

			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/1.jpg" width="460" height="345" >
				</div>
				<div class="item">
					<img src="images/2.jpg" width="460" height="345" >
				</div>
				<div class="item">
					<img src="images/3.jpg" width="460" height="345" >
				</div>

			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
</body>
</html>
