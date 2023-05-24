<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en" class="h-100">

<head>
<title>Welcome to EventLight</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">

<!-- In line CSS -->

<style type="text/css">
main>.container {
	padding: 60px 15px 0;
	margin-bottom: 5rem;
}

body>main {
	margin-top: 20px;
	margin-bottom: 60px;
}

.sticky-footer {
	position: sticky;
	left: 0;
	bottom: 0;
	width: 100%;
}

.homeBG {
	width: 100%;
	background-color: lighgray;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	background-attachment: fixed;
}

.minHeight {
	min-height: 80vh;
}
</style>

</head>

<body class="d-flex flex-column h-100 homeBG">

	
	<jsp:include page="navvenueowner.jsp" />

		
	<main class="flex-shrink-0">
  <div class="container text-center mt-5">
    <div class="container">
      <div class="row justify-content-center">
        <h1>Events at Venue: ${event.venue.name}</h1>

        <table class="table mt-4">
          <thead>
            <tr>
              <th>Event ID</th>
              <th>Title</th>
              <th>Event Date</th>
              <th>Time</th>
              <th>Bands</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
          
          
          
            <c:forEach var="event" items="${eventsById}">
              <tr>
                <td>${event.id}</td>
                <td><a href="ViewEventPage.do?eventId=${event.id}">${event.title}</a></td>
                <td>${event.eventDate}</td>
                <td>${event.startTime} - ${event.endTime}</td>
                <td>  <ul>
                
                
                
                  <c:forEach var="band" items="${event.bands}">
                    <li><a href="ViewBandPage.do?bandId=${band.id}">${band.name}</a></li>
                  </c:forEach>
                  
                  
              
                </ul></td>
                <td>
                  <a href="updateEventPage.do?id=${event.id}" class="btn btn-primary">Update Event</a>
                  <form action="deleteEventForm.do" method="post" class="d-inline">
                    <input type="hidden" name="eventId" value="${event.id}">
                    <input type="submit" value="Remove this Event" class="btn btn-danger">
                  </form>
                </td>
              </tr>
            </c:forEach>
            
            
            
            
          </tbody>
        </table>
      </div>
    </div>
  </div>
</main>
	
			
	
	
	<footer class="footer mt-auto py-3 bg-dark sticky-footer">
		<div class="container-fluid text-center">
			<span class="text-white">© 2023 EventLight. All rights
				reserved.</span>
		</div>
	</footer>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous">
		
	</script>
</body>

</html>