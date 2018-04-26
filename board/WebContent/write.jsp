<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Yoojin's</title>
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
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span> 
	      </button>
	      <a class="navbar-brand" href="#">Yoojin's</a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	        <li><a href="main.jsp">Home</a></li>
	        <li class="active"><a href="#">게시판</a></li>

	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Log Out</a></li>
	      </ul>
	    </div>
	  </div>
	</nav>
	
	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align:center;">게시판 글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글제목" name="boardTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea  class="form-control" placeholder="글내용" name="boardContent" maxlength="2048" style="height:350px;"></textarea></td>
						</tr>
					</tbody>	
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>
			
		</div>
	</div>

</body>
</html>
