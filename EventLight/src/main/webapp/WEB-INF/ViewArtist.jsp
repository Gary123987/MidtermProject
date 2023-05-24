<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Artist Details</title>
</head>
<body>
<h2>Artist Details</h2>
<h3>${artist.firstName } ${artist.lastName }</h3>
<ul>
<li>Stage Name: ${artist.stageName }</li>
<li>Instrument: ${artist.instrument }</li>
<li>Description: ${artist.description }</li>
<li><img src="${artist.image }" height="250" width="200"></li>
<li>Artist ID: ${artist.id }</li>

</ul>
<a href="home.do" class="btn btn-secondary" role="button">Back to
		Home</a>

</body>
</html>