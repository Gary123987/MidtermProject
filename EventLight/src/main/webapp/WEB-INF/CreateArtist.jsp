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
			<div class="container">
 				 <div class="row justify-content-center">
					<div class= "col-3">
						<div class="container">
							
							
							<h2>Create an Artist:</h2>
								<form action="createArtist.do" method="POST" class="needs-validation" novalidate>
								  <div class="form-group">
								    <label for="firstName">First Name:</label>
								    <input type="text" name="firstName" class="form-control"/>
								  </div>
								
								  <div class="form-group">
								    <label for="lastName">Last Name:</label>
								    <input type="text" name="lastName" class="form-control"/>
								  </div>
								
								  <div class="form-group">
								    <label for="stageName">Stage Name:</label>
								    <input type="text" name="stageName" class="form-control" required/>
								    <div class="invalid-feedback">Please enter the stage name.</div>
								  </div>
								
								  <div class="form-group">
								    <label for="instrument">Instrument:</label>
								    <input type="text" name="instrument" class="form-control"/>
								  </div>
								
								  <input type="submit" value="Submit" class="btn btn-primary">
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