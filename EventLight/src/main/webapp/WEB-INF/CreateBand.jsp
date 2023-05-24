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

<<<<<<< Updated upstream
	
=======
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.do">EventLight</a>
			
			
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
				aria-controls="navbarCollapse" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav me-auto mb-2 mb-md-0">
					<li class="nav-item"><a class="nav-link"
						aria-current="page" href="index.do">Home</a></li>

					<li class="nav-item"><a class="nav-link" href="aboutUs.do">About
							Us</a></li>

					<li class="nav-item"><a class="nav-link" href="listAll.do">See
							All Events</a></li>

					<li class="nav-item"><a class="nav-link" href="contactUs.do">Contact
							Us</a></li>
				</ul>

				<a href="logout.do" class="btn btn-primary">Log out</a>
				<a href="home.do" class="btn btn-secondary m-1">Home</a>
			</div>
		</div>
	</nav>

	<jsp:include page="navvenueowner.jsp" />
>>>>>>> Stashed changes
		
	<main class="flex-shrink-0">
		<div class="container text-center mt-5">
			<div class="container">
 				 <div class="row justify-content-center">
					<div class= "col-3">
						<div class="container">
							
							
							<h2>Create a Band:</h2>
							
							
								<form action="createBand.do" method="POST" class="needs-validation" novalidate>
								  <div class="form-group">
								    <label for="name">Band Name:</label>
								    <input type="text" name="name" class="form-control" required/>
								    <div class="invalid-feedback">Please enter the band name.</div>
								  </div>

								  <div class="form-group">
								    <label for="genre">Genre:</label>
								    <input type="text" name="genre" class="form-control"/>
								  </div>
								
								  <div class="form-group">
								    <label for="image">Band Picture (URL):</label>
								    <input type="text" name="image" class="form-control"/>
								  </div>
								
								  <div class="form-group">
								    <label for="description">Band Description:</label>
								    <input type="text" name="description" class="form-control"/>
								  </div>

								  <input type="submit" value="Create Band and Add Artists" class="btn btn-primary"/>
								</form>
							
  
						</div>
					</div>
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