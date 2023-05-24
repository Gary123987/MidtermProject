<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attendee Home</title>
</head>
<body>
	<c:choose>
		<c:when test="${!empty user.favoriteEvents}">
			<h1>Your Favorite Events</h1>
			<c:forEach var="event" items="${user.favoriteEvents}">
				<ul>
					<li><strong>Event ID: ${event.id }</strong></li>
					<li><a href="ViewEventPage.do?eventId=${event.id}">${event.title}</a></li>
					<li><img src="${event.image }" width="250" height="200"></li>
					<li>${event.eventDate }</li>
					<li>${event.startTime }-${event.endTime }</li>
					<li>${event.description }</li>
					<li>${event.venue }</li>
					<li>Bands:</li>
		<li><ul>
				<c:forEach var="band" items="${event.bands}">
					<li><a href="ViewBandPage.do?bandId=${band.id}">${band.name}</a></li>
				</c:forEach>
			</ul></li>
				</ul>
			</c:forEach>
		</c:when>
		<c:otherwise>
				<h2>No favorite events in your list...</h2>
		
		</c:otherwise>
	</c:choose>
	<a href="home.do" class="btn btn-secondary" role="button">Back to
		Home</a> you are an attendee

</body>
</html>