<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Band Page</title>
</head>
<body>
<h2>${band.name }</h2>
<ul>
<li>ID: ${band.id }</li>
<li>Genre: ${band.genre }</li>
<li>Description: ${band.description }</li>
<li><img src="${band.image}" height="200" width="250"></li>
<li>Band Members:</li>
<c:forEach var="artist" items="${band.artists }">
<li><a href="ViewArtistPage.do?artistId=${artist.id}">${artist.firstName } ${artist.lastName }</a></li>
</c:forEach>


</ul>

<a href="home.do" class="btn btn-secondary" role="button">Back to
		Home</a>


</body>
</html>