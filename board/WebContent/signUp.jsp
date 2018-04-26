<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>JSP 게시판 웹 사이트</title>
</head>
<body>

	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top:20px;">
				<form method="post" action="signUpAction.jsp">
					<h3 style="text-align:center;">회원가입</h3> 
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" >
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPass" >
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="userName" >
					</div>
					<div class="form-group" style="text-align:center;">
						<div class ="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active">
								 <input type="radio" name="userGender" autocomplete="off" checked>남자
							</label>
							<label class="btn btn-primary">
								 <input type="radio" name="userGender" autocomplete="off" checked>여자
							</label>
						</div>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="userEmail" >
					</div>
					<input type="submit" class="btn btn-primary form-control" value="회원가입">
				</form>
			</div>
		</div>
	</div>

</body>
</html>
