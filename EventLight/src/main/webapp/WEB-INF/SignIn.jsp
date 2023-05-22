<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In</title>
</head>
<body>
	<form action="login.do" method="get">
		<label for="username">Username</label> <input type="text"
			name="username" value="${user.username }" /> 
			<br> 
			<label for="password">Password</label> <input type="password" name="password"
			value="${user.password}" /> <br>
			<input type="submit" value="Log In"/>
			
	</form>
	
	<form action ="home.do">
		<input type="submit" class="col btn btn-primary" value="Back to home"/>
		</form>

</body>
</html>