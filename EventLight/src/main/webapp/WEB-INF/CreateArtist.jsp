<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Artist</title>
</head>
<body>
<h2>Create an Artist:</h2>
<form action=createArtist.do method="POST">
 <label for="firstName">First Name: </label>
			<input type="text" name="firstName"/> 
			<br>
 <label for="lastName">Last Name: </label>
			<input type="text" name="lastName"/> 
			<br>
 <label for="stageName">Stage Name: </label>
			<input type="text" name="stageName" required/> 
			<br>

 <label for="instrument">Instrument: </label>
			<input type="text" name="instrument"/> 
			<br> 
			<input type="submit" value="Submit" />
</form>
<a href="home.do" class="btn btn-secondary" role="button">Back to
		Home</a>

</body>
</html>