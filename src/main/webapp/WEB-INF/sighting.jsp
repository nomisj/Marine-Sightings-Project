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
</head>
<body>
	<div>
		<h1><c:out value="${sighting.animal}"/></h1>
		<a href="/home">Home</a>
		
		<div>
			<p>Added By: <c:out value="${sighting.user.userName}"/></p>
			<p>Date Spotted: <c:out value="${sighting.dateSpotted}"/></p>
			<p>Description: <c:out value="${sighting.description}"/></p>
		</div>
		
		<c:if test="${sighting.user.id == user.id }">
		<button class="btn-warning"><a href="/sightings/${sighting.id}/edit">Update</a></button>
<!-- 		ADD DELETE METHOD HERE then add to controller-->
		<form action="/sightings/${sighting.id}" method="post">
    		<input type="hidden" name="_method" value="delete">
    		<input type="submit" value="Delete">
		</form>
		</c:if>
	</div>
</body>
</html>