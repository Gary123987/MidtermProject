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

	<!-- nav bar -->
	<jsp:include page="navvenueowner.jsp" />
		
	<main class="flex-shrink-0">
		<div class="container text-center mt-5">
			<div class="container">
 				 <div class="row justify-content-center">
					<div class= "col-3">
						<form action="updateVenue.do" method="POST" class="container">
							  <div class="form-group">
							    <label for="name">Name of Venue:</label>
							    <input type="text" name="name" value="${venue.name}" class="form-control" required/>
							  </div>
							  <div class="form-group">
							    <label for="description">Description:</label>
							    <input type="text" name="description" value="${venue.description}" class="form-control" required/>
							  </div>
							  <div class="form-group">
							    <label for="phoneNumber">Phone number:</label>
							    <input type="text" name="phoneNumber" value="${venue.phoneNumber}" class="form-control" required/>
							  </div>
							  <div class="form-group">
							    <label for="picture">Picture:</label>
							    <input type="text" name="picture" value="${venue.picture}" class="form-control"/>
							  </div>
							  <div class="form-group">
							    <label for="logo">Logo Picture:</label>
							    <input type="text" name="logo" value="${venue.pictureLogo}" class="form-control"/>
							  </div>
							  <div class="form-group">
							    <label for="street">Street:</label>
							    <input type="text" name="street" value="${venue.address.street}" class="form-control" required/>
							  </div>
							  <div class="form-group">
							    <label for="city">City:</label>
							    <input type="text" name="city" value="${venue.address.city}" class="form-control" required/>
							  </div>
							  <div class="form-group">
							    <label for="state">State:</label>
							    <input type="text" name="state" value="${venue.address.state}" class="form-control"/>
							  </div>
							  <div class="form-group">
							    <label for="zip">Zip Code:</label>
							    <input type="text" name="zip" value="${venue.address.zip}" class="form-control"/>
							  </div>
							  <div class="form-group mt-2">
							    <input type="submit" value="Update" class="btn btn-success"/>
							  </div>
							</form>

					</div>
				</div>
			</div>
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