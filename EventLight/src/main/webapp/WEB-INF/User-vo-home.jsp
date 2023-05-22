<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

you are a venue owner

<c:choose>
<c:when test="${not empty user.venue}">

update a venue

you currently own the venue ${user.venue.name }

<a href="updateVenuePage.do">Update Venue</a><br>
<a href="SeeMyEvents.do">See My Events</a>



</c:when>

<c:otherwise>
<form action=createVenue.do method="POST">
 <label for="name">Name of Venue: </label>
			<input type="text" name="name" required/> 
			<br>
 <label for="description">Description: </label>
			<input type="text" name="description" required/> 
			<br>
 <label for="phoneNumber">Phone number: </label>
			<input type="text" name="phoneNumber" required/> 
			<br>
 <label for="picture">Picture: </label>
			<input type="text" name="picture" /> 
			<br>

 <label for="logo">Logo Picture: </label>
			<input type="text" name="logo" /> 
			<br>
 <label for="street">Street: </label>
			<input type="text" name="street" required/> 
			<br>
		    <label for="city">City: </label>
			<input type="text" name="city"required/> 
			<br>
		    <label for="state">State: </label>
			<input type="text" name="state" /> 
			<br>
		    <label for="zip">Zip Code:  </label>
			<input type="text" name="zip"  /> 
			<br>
			<input type="submit" value="Submit" />
</form>








</c:otherwise>








</c:choose>
<a href="home.do" class="btn btn-secondary" role="button">Back to
		Home</a>
</body>
</html>