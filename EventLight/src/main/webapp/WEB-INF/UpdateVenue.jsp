<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action=updateVenue.do method="POST">
 <label for="name">Name of Venue: </label>
			<input type="text" name="name" value="${ venue.name}" required/> 
			<br>
 <label for="description">Description: </label>
			<input type="text" name="description"  value="${ venue.description}" required/> 
			<br>
 <label for="phoneNumber">Phone number: </label>
			<input type="text" name="phoneNumber"  value="${ venue.phoneNumber}" required/> 
			<br>
 <label for="picture">Picture: </label>
			<input type="text" name="picture"  value="${ venue.picture}" /> 
			<br>

 <label for="logo">Logo Picture: </label>
			<input type="text" name="logo"  value="${ venue.pictureLogo}"/> 
			<br>
 <label for="street">Street: </label>
			<input type="text" name="street"  value="${ venue.address.street}" required/> 
			<br>
		    <label for="city">City: </label>
			<input type="text" name="city" value="${ venue.address.city}" required/> 
			<br>
		    <label for="state">State: </label>
			<input type="text" name="state" value="${venue.address.state}" /> 
			<br>
		    <label for="zip">Zip Code:  </label>
			<input type="text" name="zip" value="${ venue.address.zip}"/> 
			<br>
			<input type="submit" value="Submit" />
</form>

</body>
</html>