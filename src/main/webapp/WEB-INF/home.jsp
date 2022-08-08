<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Marine Sightings</title>
<link rel="stylesheet" type="text/css" href="/css/home.css">
</head>
<body>
	<div class="background-image">
	<h1>Welcome, <c:out value="${user.userName}"/>!</h1>
	<a href="/logout">Logout</a>
	
	<div>
	<h3>Recent Marine Sightings</h3>
		<table class="table-box">
		
			<tr>
				<th>Mammal Sighted</th>
				<th>Added by</th>
				<th>Date/Time Spotted</th>
			</tr>
			<c:forEach var="sighting" items="${sightings}">
		
			<tr>
				<td><a href="sightings/${sighting.id}"><c:out value="${sighting.animal}"/></a></td>
				<td><c:out value="${sighting.user.userName}"/></td>
				<td><c:out value="${sighting.dateSpotted}"/></td>
			</tr>
			</c:forEach>
			
			
		</table>
	
	</div>
	
	<a href="/addPage">Click here to add a sighting</a>
	</div>
</body>
</html>