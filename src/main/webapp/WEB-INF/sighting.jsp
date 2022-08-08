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
<link rel="stylesheet" type="text/css" href="/css/sightingPage.css">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="background-image">

		<a href="/home">Home</a>
		
		<div class="display">		
			<h2><c:out value="${sighting.animal}"/></h2>
			<p>Added By: <c:out value="${sighting.user.userName}"/></p>
			<p>Date - Time Spotted: <c:out value="${sighting.dateSpotted}"/></p>
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