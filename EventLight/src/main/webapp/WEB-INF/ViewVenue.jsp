
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

<jsp:include page="navmain.jsp" />

<main class="flex-shrink-0">
		<div class="container text-center mt-5">
			<div class="container">
 				 <div class="row justify-content-center">
		
					<h2>${venue.name}</h2>
						<table class="table">
						  <tbody>
						  <%--   <tr>
						      <td>ID:</td>
						      <td>${venue.id}</td>
						    </tr> --%>
						    <tr>
						      <td>Address:</td>
						      <td>${venue.address.street}<br>${venue.address.city}, ${venue.address.state} ${venue.address.zip}</td>
						    </tr>
						    <tr>
						      <td>Phone Number:</td>
						      <td>${venue.phoneNumber}</td>
						    </tr>
						    <tr>
						      <td>Venue Description:</td>
						      <td>${venue.description}</td>
						    </tr>
						    <tr>
						      <td>Venue Owner:</td>
						      <td>${venue.user.firstName} ${venue.user.lastName}</td>
						    </tr>
						    <tr>
						      <td></td>
						      <td><img src="${venue.picture}" height="200" width="250"></td>
						    </tr>
						  </tbody>
						</table>

					<a href= "home.do">Go Back to Dashboard</a>
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



