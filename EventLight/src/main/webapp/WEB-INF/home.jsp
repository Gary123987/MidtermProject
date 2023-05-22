<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EventLight</title>
</head>
<body>
<h1>WELCOME TO EVENT LIGHT</h1>

${SMOKETEST}
<form action="listAll.do" method="GET">
		<input type="submit" value="List All Events" />

</form> 

<form action="loginpage.do" method="GET">
		<input type="submit" value="Log in" />

</form> 

<form action="SignUpPage.do" method="GET">
		<input type="submit" value="Sign Up" />

</form> 

</body>
</html>