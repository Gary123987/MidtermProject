<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>Create an Event</h2>
<form action="createEvent.do">
Event Name: <input type="text" name="name"/><br>
Description: <input type="text" name="description"/> <br>
Date:<input type="date" name="date"/> <br>
Start Time: <input type="time" name="start"/> <br>
End Time: <input type="time" name="end"/> <br>
<br>
<input type="submit" value="Create Event and Select Bands"/>

</form>

</body>
</html>