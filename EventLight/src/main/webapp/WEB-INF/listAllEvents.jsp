<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Events</title>
</head>
<body>
<h1>All Events</h1>
<c:forEach var="event" items="${eventList }">
<ul>
<h3>Event ID: ${event.id }</h3>
<li>${event.title }</li>
<li><img src ="${event.image }" width="250" height="200"></li>
<li>${event.eventDate }</li>
<li>${event.startTime } - ${event.endTime }</li>
<li>${event.description }</li>
<li>${event.venue }</li>
<li>${event.bands }</li>
<li><a href="favoriteEvents.do?eventId=${event.id}">Add event to favorites</a></li>
<li></li>
<li></li>

</ul>
</c:forEach>
	<a href="home.do" class="btn btn-secondary" role="button">Back to
		Home</a>
</body>
</html>