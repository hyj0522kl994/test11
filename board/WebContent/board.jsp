<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.PrintWriter" %>
 <%@ page import="board.BoardDAO" %>
 <%@ page import="board.Board" %>
 <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Yoojin's</title>
<style type="text/css">
	a, a:hover{
		color:#000000;
		text-decoration:none;
	}
</style>
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
		int pageNumber =1;
		if (request.getParameter("pageNumber") !=null){
			pageNumber= Integer.parseInt(request.getParameter("pageNumber"));
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
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align:center;">번호</th>
						<th style="background-color: #eeeeee; text-align:center;">제목</th>
						<th style="background-color: #eeeeee; text-align:center;">작성자</th>
						<th style="background-color: #eeeeee; text-align:center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BoardDAO boardDAO = new BoardDAO();
						ArrayList<Board> list = boardDAO.getList(pageNumber);
						for (int i=0; i< list.size(); i++){
					%>
					<tr>
						<td><%= list.get(i).getBoardID() %></td>
						<td><a href="view.jsp?boardID=<%=list.get(i).getBoardID()%>"><%= list.get(i).getBoardTitle() %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBoardDate().substring(0,11) + list.get(i).getBoardDate().substring(11,13)+"시"+ list.get(i).getBoardDate().substring(14,16)+"분" %></td>
					</tr>
					<%
						}
					%>
				</tbody>	
			</table>
				<%
					if(pageNumber !=1){
				%>
				<a href="board.jsp?pageNumber=<%= pageNumber - 1 %>" class="btn btn-success btn-arrow-left">이전</a>
				<%
					}if(boardDAO.nextPage(pageNumber + 1)){
				%>
				<a href="board.jsp?pageNumber=<%= pageNumber + 1 %>" class="btn btn-success btn-arrow-left">다음</a>
				<%
					}
				%>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
			
		</div>
	</div>

</body>
</html>
