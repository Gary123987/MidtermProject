<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Event</title>
</head>
<body>
<h2>Update Event ID: ${event.id }</h2>
<form action=updateEvent.do method="POST">
 <label for="title">Name of Event: </label>
			<input type="text" name="title" value="${ event.title}" required/> 
			<br>
 <label for="description">Description: </label>
			<input type="text" name="description"  value="${ event.description}" required/> 
			<br>
 <label for="eventDate">Date of Event: </label>
			<input type="date" name="eventDate"  value="${ event.eventDate}" required/> 
			<br>

 <label for="startTime">Start Time: </label>
			<input type="time" name="startTime"  value="${ event.startTime}"/> 
 <label for="endTime">End Time: </label>
			<input type="time" name="endTime"  value="${ event.endTime}" /> 
			<br>
 <label for="image"> Image: </label>
			<input type="text" name="image"  value="${ event.image}" /> 
			<br>
			<input type="submit" value="Submit" />
</form>
<a href="home.do" class="btn btn-secondary" role="button">Back to
		Home</a>

</body>
</html>