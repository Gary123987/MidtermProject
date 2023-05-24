
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en" class="h-100">

<head>
<title>Sign Up</title>
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
					<div class= "col-4">
						<div class="container">
		
							<h2>Please fill in the below details for an account:</h2>

						<form action="signUp.do" method="POST" class="container">
							  <div class="mb-3">
							    <label for="username" class="form-label">Username:</label>
							    <input type="text" name="username" class="form-control" required/>
							  </div>
							
							  <div class="mb-3">
							    <label for="password" class="form-label">Password:</label>
							    <input type="password" name="password" class="form-control" required/>
							  </div>
							
							  <div class="mb-3">
							    <label for="role" class="form-label">Role:</label>
							    <div class="form-check">
							      <input type="radio" name="role" value="vo" id="voRadio" class="form-check-input" required/>
							      <label for="voRadio" class="form-check-label">Venue Owner</label>
							    </div>
							    
							    <div class="form-check">
							      <input type="radio" name="role" value="att" id="attRadio" class="form-check-input" required/>
							      <label for="attRadio" class="form-check-label">Attendee</label>
							    </div>
							  </div>
							
							  <div class="mb-3">
							    <label for="firstName" class="form-label">First Name:</label>
							    <input type="text" name="firstName" class="form-control" required/>
							  </div>
							
							  <div class="mb-3">
							    <label for="lastName" class="form-label">Last Name:</label>
							    <input type="text" name="lastName" class="form-control" required/>
							  </div>
							
							  <div class="mb-3">
							    <label for="profilePicture" class="form-label">Profile Picture Image Link:</label>
							    <input type="text" name="profilePicture" class="form-control"/>
							  </div>
							
							  <div class="mb-3">
							    <label for="aboutMe" class="form-label">About Me:</label>
							    <input type="text" name="aboutMe" class="form-control"/>
							  </div>
							
							  <div class="mb-3">
							    <label for="street" class="form-label">Street:</label>
							    <input type="text" name="street" class="form-control" required/>
							  </div>
							
							  <div class="mb-3">
							    <label for="city" class="form-label">City:</label>
							    <input type="text" name="city" class="form-control" required/>
							  </div>
							
							  <div class="mb-3">
							    <label for="state" class="form-label">State:</label>
							    <input type="text" name="state" class="form-control"/>
							  </div>
							
							  <div class="mb-3">
							    <label for="zip" class="form-label">Zip Code:</label>
							    <input type="text" name="zip" class="form-control"/>
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



