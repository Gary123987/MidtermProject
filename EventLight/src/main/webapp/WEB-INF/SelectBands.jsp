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
					<div class= "col-3">
						<div class="container">
							 <h2>Select Bands for the Event: ${event.title }</h2><br><br>

								<form action="addBandsToEvent.do" method="POST" class="form">
								
									  <div class="row">
									    <div class="col-md-6">
									      <c:forEach var="band" items="${allBands }">
									        <div class="form-check">
									          <input class="form-check-input" type="checkbox" name="bandsSelected" value="${band.name }" id="band-${band.name }">
									          <label class="form-check-label" for="band-${band.name }">${band.name }</label>
									        </div>
									      </c:forEach>
									    </div>
									  </div>
								
									  <div class="row mt-3">
									    <div class="col-md-6">
									      <button type="submit" class="btn btn-primary">Add these Bands to your Event</button>
									    </div>
									    
									     <div class="col-md-6">
									      <a href="createBandPage.do" class="btn btn-secondary m-1">Create a new Band</a>
									    </div>
									  </div>
								
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

