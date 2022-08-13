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
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="background-image">
	<h2>Welcome, <c:out value="${user.userName}"/>!</h2>

	
	<div>
	
	<h3>Recent Marine Sightings</h3>
	
	<p class="add-page-link"><a href="/addPage">Click here to add a sighting</a></p>
	
		<table class="table table-borderless">
		
			<tr>
				<th>Mammal Sighted</th>
				<th>Added by</th>
				<th>Date Spotted</th>
			</tr>
			
			<tbody>
			<c:forEach var="sighting" items="${sightings}">
		
			<tr>
				<td><a href="sightings/${sighting.id}"><c:out value="${sighting.animal}"/></a></td>
				<td><c:out value="${sighting.user.userName}"/></td>
				<td><c:out value="${sighting.dateSpotted}"/></td>
			</tr>
			</c:forEach>
			</tbody>
			
		</table>
	
	</div>
	

	<p class="logout-link"><a href="/logout">Logout</a></p>
	</div>
</body>
</html>