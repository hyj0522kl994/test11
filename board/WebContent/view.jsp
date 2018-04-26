<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.PrintWriter" %>
 <%@ page import="board.Board" %>
 <%@ page import="board.BoardDAO" %>
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
		
		int boardID=0;
		if (request.getParameter("boardID") != null){
			boardID=Integer.parseInt(request.getParameter("boardID"));
		}
		if(boardID == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다')");
			script.println("location.href='board.jsp'");
			script.println("</script>");
		}
		Board board = new BoardDAO().getBoard(boardID);
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
							<th colspan="3" style="background-color: #eeeeee; text-align:center;">게시판 글보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width:20%;">글 제목</td>
							<td colspan="2"><%= board.getBoardTitle().replaceAll(" ", "$nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
						</tr>
						<tr>
							<td>작성자</td>
							<td colspan="2"><%= board.getUserID() %></td>
						</tr>
						<tr>
							<td>작성 일자</td>
							<td colspan="2"><%= board.getBoardDate().substring(0,11) + board.getBoardDate().substring(11,13) + "시" + board.getBoardDate().substring(14,16)+"분" %></td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="2" style="min-height:200px; text-align:left;"><%= board.getBoardContent().replaceAll(" ", "$nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>") %></td>
							
						</tr>
					</tbody>	
				</table>
				<a href="board.jsp" class="btn btn-primary">목록</a>
				<% 
					if(userID != null && userID.equals(board.getUserID())){
				%>
				<a href="update.jsp?boardID=<%= boardID %>" class="btn btn-primary">수정 </a>
				<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?boardID=<%= boardID %>" class="btn btn-primary">삭제 </a>
				<%
					}
				%>
		</div>
	</div>

</body>
</html>
