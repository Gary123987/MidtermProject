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

.mainDiv {
		
			min-height: 1200px;
		
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


 .newsletter-section {
            background-color: #4287f5;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
            min-height: 400px;]
        }
        
        .newsletter-title {
            font-size: 30px;
            margin-bottom: 20px;
        }
        
        .newsletter-description {
            font-size: 18px;
            margin-bottom: 30px;
        }
</style>

</head>

<body class="d-flex flex-column h-100 homeBG">


	<jsp:include page="navmain.jsp" />
	
	
	
	

	<main class="flex-shrink-0 mb-0">
	


		<div class="container text-center mt-5 mainDiv">
			<h1 class="text-black display-3">Discover, Connect, and
				Experience with EventLight</h1>
			<h3 class="text-black">Your One Stop Shop to Find Events and Connect with the Community</h3>
		</div>
		
		
		<jsp:include page="indexsection1.jsp" />
		
		<div><h1 class="text-center mb-4">Latest Events</h1></div>
	<div class="container-fluid text-center bg-light">
      
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
	
	
	<section class="newsletter-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="newsletter-title">Sign Up for Our Newsletter</h2>
                <p class="newsletter-description">Stay up-to-date with the latest news and updates.</p>
                <form class="form-inline justify-content-center" action="#" method="post">
                    <div class="form-group">
                        <input class="form-control mr-2" type="email" name="email" placeholder="Enter your email" required>
                    </div>
                    <button class="btn btn-danger mt-3" type="submit">Sign Up</button>
                </form>
            </div>
        </div>
    </div>
</section>
	
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