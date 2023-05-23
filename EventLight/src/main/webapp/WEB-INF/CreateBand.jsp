<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Create a Band:</h2>
<form action=createBand.do method="POST">
 <label for="name">Band Name: </label>
			<input type="text" name="name" required/> 
			<br>
 <label for="genre">Genre: </label>
			<input type="text" name="genre"/> 
			<br>
 <label for="image">Band Picture (url): </label>
			<input type="text" name="image" /> 
			<br>

 <label for="description">Band Description: </label>
			<input type="text" name="description"/> 
			<br> 
				
			<input type="submit" value="Create Band and Add Artists" />
</form>
<a href="home.do" class="btn btn-secondary" role="button">Back to
		Home</a>

</body>
</html>