<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Events By Venue</title>
</head>
<body>


	<h1>Events at Venue: ${event.venue.name }</h1>

	<c:forEach var="event" items="${eventsById }">
		<ul>
			<li>${event.id }</li>
			<li>${event.title }</li>
			<li><img src="${event.image }" width="250" height="200"></li>
			<li>${event.eventDate }</li>
			<li>${event.startTime }- ${event.endTime }</li>
			<li>${event.bands }</li>
			<li><a href="updateEventPage.do?id=${event.id }">Update
					Event</a></li>
				<form action="deleteEventForm.do" method="post">
					<input type="hidden" name="eventId" value="${event.id}"> <input
						type="submit" value="Remove this Event">
				</form>
			</li>
		</ul>
	</c:forEach>
	<a href="home.do" class="btn btn-secondary" role="button">Back to
		Home</a>


</body>
</html>