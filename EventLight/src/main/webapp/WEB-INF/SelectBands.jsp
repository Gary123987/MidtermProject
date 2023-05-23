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

<h2>Select Bands for the Event: ${event.title }</h2><br><br>


<form action="addBandsToEvent.do" method="POST">
<c:forEach var="band" items="${allBands }">

<input type="checkbox" name="bandsSelected" value="${band.name }">${band.name }<br>

</c:forEach>
<input type="submit" value="Add these Bands to your Event"/>
</form>

<a href="createBandPage.do">Create a new Band</a>









</body>
</html>