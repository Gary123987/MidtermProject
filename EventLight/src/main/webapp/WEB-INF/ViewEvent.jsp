<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Event</title>
</head>
<body>
	<h2>${event.title }</h2>
	<ul>
		<li>ID: ${event.id }</li>
		<li>Venue: <a href="ViewVenuePage.do?venueId=${event.venue.id}">${event.venue.name}</a></li>
		<li>Event Date: ${event.eventDate }</li>
		<li>Event Times: ${event.startTime } - ${event.endTime }</li>
		<li>Event Description: ${event.description }</li>
		<li>Event Bands:</li>
		<li><ul>
				<c:forEach var="band" items="${event.bands}">
					<li><a href="ViewBandPage.do?bandId=${band.id}">${band.name}</a></li>
				</c:forEach>
			</ul></li>
		<li><img src="${event.image }" height="200" width="250"></li>

	</ul>

	<a href="home.do" class="btn btn-secondary" role="button">Back to
		Home</a>
</body>
</html>