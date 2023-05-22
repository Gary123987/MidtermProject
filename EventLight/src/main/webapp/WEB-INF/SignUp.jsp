<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>
<h2>Please fill in the below details for an account:</h2>
<form action="signUp.do" method="POST">
		    <label for="username">Username: </label>
			<input type="text" name="username" required/> 
			<br>
		    <label for="password">Password: </label>
			<input type="password" name="password" required/> 
			<br>
		    <label for="role">Role: </label>
			<INPUT TYPE="radio" name="role" value="VO"/>Venue Owner
			<INPUT TYPE="radio" NAME="role" VALUE="ATT"/>Attendee
			<br>
		    <label for="firstName">First Name: </label>
			<input type="text" name="firstName" required/> 
			<br>
		    <label for="lastName">Last Name: </label>
			<input type="text" name="lastName"required/> 
			<br>
		    <label for="profilePicture">Profile Picture Image Link: </label>
			<input type="text" name="profilePicture"/> 
			<br>
		    <label for="aboutMe">About Me: </label>
			<input type="text" name="aboutMe"/> 
			<br>
			 <label for="street">Street: </label>
			<input type="text" name="street" required/> 
			<br>
		    <label for="city">City: </label>
			<input type="text" name="city"required/> 
			<br>
		    <label for="state">State: </label>
			<input type="text" name="state"/> 
			<br>
		    <label for="zip">Zip Code:  </label>
			<input type="text" name="zip"/> 
			<br>
			<input type="submit" value="Submit" />
			</form>
			<a href="home.do" class="btn btn-secondary" role="button">Back to
		Home</a>

</body>
</html>