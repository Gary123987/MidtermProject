<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Venue Details</title>
</head>
<body>
<h2>${venue.name }</h2>
<ul>
<li>ID: ${venue.id }</li>
<li>Address: <br>${venue.address.street }<br>${venue.address.city }, ${venue.address.state } ${venue.address.zip }
<li>Phone Number: ${venue.phoneNumber }</li>
<li>Venue Description: ${venue.description }</li>
<li>Venue Owner: ${venue.user.firstName } ${venue.user.lastName }</li>
<li><img src="${venue.picture }" height="200" width="250"></li>

</ul>

<a href="home.do" class="btn btn-secondary" role="button">Back to
		Home</a>


</body>
</html>