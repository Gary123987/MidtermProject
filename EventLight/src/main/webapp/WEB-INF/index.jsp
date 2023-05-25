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


	<jsp:include page="navmain.jsp" />
	

	<main class="flex-shrink-0">
	


		<div class="container text-center mt-5">
			<h1 class="text-black display-3">Discover, Connect, and
				Experience with EventLight</h1>
			<h3 class="text-black">Your One Stop Shop to Find Events and Connect with the Community</h3>
		</div>
		
		
		
	<div class="container-fluid text-center mt-5 bg-light">
      <h1 class="text-center mb-4">Latest Events</h1>
      
      <table class="table">
        <thead>
          <tr>
            <!-- <th>ID</th> -->
            <th>Title</th>
            <th>Date</th>
            <th>Time</th>
            <th>Description</th>
            <th>Venue</th>
            <th>Bands</th>
            <th>Add to Favorites</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="event" items="${eventList}">
            <tr>
              <%-- <td><strong>${event.id}</strong></td> --%>
              <td><a href="ViewEventPage.do?eventId=${event.id}">${event.title}</a></td>
              <td>${event.eventDate}</td>
              <td>${event.startTime} - ${event.endTime}</td>
              <td>${event.description}</td>
              <td><a href="ViewVenuePage.do?venueId=${event.venue.id}">${event.venue.name}</a></td>
              <td>
                  <c:forEach var="band" items="${event.bands}">
                    <a href="ViewBandPage.do?bandId=${band.id}">${band.name}</a>
                  </c:forEach>
              </td>
              <td><a href="favoriteEvents.do?eventId=${event.id}">Add event to favorites</a></td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
  </div>
  

  
		
	</main>
	
	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	
	
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous">
		
	</script>
</body>

</html>