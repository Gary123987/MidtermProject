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

	

	<main class="flex-shrink-0">
		<div class="container text-center mt-5">
		
			<c:choose>
				<c:when test="${not empty user.venue}">
	
					<h2>You currently own the venue ${user.venue.name }</h2><br><br>
					
					<a href="updateVenuePage.do">Update Venue</a><br>
					<a href="SeeMyEvents.do">See My Events</a><br>
					<a href="createEventPage.do">Create an Event for this Venue</a><br>
				
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