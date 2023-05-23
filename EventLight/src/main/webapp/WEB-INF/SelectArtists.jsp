<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>Select Artists for the Band: ${band.name}</h2><br><br>


<form action="addArtistsToBand.do" method="POST">
<c:forEach var="artist" items="${allArtists }">

<input type="checkbox" name="artistSelected" value="${artist.id}">${artist.firstName } ${artist.lastName } playing: ${artist.instrument }<br>

</c:forEach>
<input type="submit" value="Add these Artist to your Band"/>
</form>
<a href="createArtistPage.do">Create a New Artist</a>








</body>
</html>