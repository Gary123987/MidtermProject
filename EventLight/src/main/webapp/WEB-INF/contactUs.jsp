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
			
			
	<div class="container my-5">
  <div class="row justify-content-center">
    <div class="col-lg-9">
      <h1 class="mb-3">Contact Us</h1>
      <form>
        <div class="row g-3">
          <div class="col-md-6">
            <label for="firstName" class="form-label">First Name</label>
            <input type="text" class="form-control" id="firstName" name="firstName" required>
          </div>
          <div class="col-md-6">
            <label for="lastName" class="form-label">Last Name</label>
            <input type="text" class="form-control" id="lastName" name="lastName" required>
          </div>
          <div class="col-md-6">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
          </div>
          <div class="col-md-6">
            <label for="subject" class="form-label">Subject</label>
            <input type="text" class="form-control" id="subject" name="subject">
          </div>
          <div class="col-12">
            <label for="message" class="form-label">Comment</label>
            <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
          </div>
          <div class="col-12">
            <button type="submit" class="btn btn-dark w-100 fw-bold">Send</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
	
			
			

	</main>
	
	
	
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous">
		
	</script>
</body>

</html>