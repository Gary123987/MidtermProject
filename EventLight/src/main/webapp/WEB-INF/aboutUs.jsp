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

					<li class="nav-item"><a class="nav-link active" href="aboutUs.do">About
							Us</a></li>

					<li class="nav-item"><a class="nav-link" href="listAll.do">See
							All Events</a></li>

					<li class="nav-item"><a class="nav-link" href="contactUs.do">Contact
							Us</a></li>
				</ul>

				<a href="loginpage.do" class="btn btn-primary">Login</a>
				<a href="home.do" class="btn btn-secondary m-1">Home</a>
			</div>
		</div>
	</nav>


	<main class="flex-shrink-0">
    <div class="container text-center mt-5">
        <h1 class="text-black display-3">About Us</h1>
        <p class="lead">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus rhoncus dui quis commodo vulputate. Maecenas
            interdum ante mi, eget cursus nisl bibendum sit amet. Curabitur varius, elit non feugiat rutrum, urna nisl
            consequat eros, et bibendum risus libero vitae enim. Nullam consequat semper odio id ultricies. Suspendisse
            sollicitudin neque ligula, sed ultrices mauris suscipit eu. In ac fringilla elit, non tristique metus.
            Suspendisse potenti. Nullam consequat arcu id congue pellentesque. Donec lacinia, nisl id aliquam dapibus,
            nisi justo iaculis mauris, eu malesuada nisi lorem nec sem. Nulla facilisi. Nam id tellus dolor. Integer
            commodo arcu eget risus rutrum, a mattis risus tincidunt.
        </p>
        <p>
            Vivamus eu ex quis justo volutpat tincidunt. Mauris ultrices, lorem sit amet blandit ullamcorper, orci lectus
            mattis massa, vel elementum lectus tellus ut massa. Curabitur sagittis nulla odio, eget auctor libero feugiat
            sed. Sed vestibulum mauris in neque vulputate, sit amet dignissim lectus faucibus. Suspendisse volutpat
            tincidunt nulla at elementum. Suspendisse in mauris in elit mollis pellentesque. Quisque in felis ut orci
            hendrerit tincidunt ut at est. Nulla convallis lacinia elit. Ut lacinia cursus dolor sed auctor. Sed vitae
            lectus ante. Fusce hendrerit est vel mi ultricies, sed dignissim nisl tristique. Suspendisse malesuada, orci
            at maximus luctus, neque nunc vulputate neque, ac finibus arcu purus a enim.
        </p>
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