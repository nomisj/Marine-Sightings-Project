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
<link rel="stylesheet" type="text/css" href="/css/addEditPage.css">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="background-image">

	<h1><c:out value="${sighting.animal}"/></h1>
	<p><a href="/home">Go Back</a></p>

		
	<div>
		<form:form action="/sightings/${sighting.id}" modelAttribute="sighting" class="form" method="post">
			<input type="hidden" name="_method" value="put"/>
			
		
			<div class="form-group">
			 	<form:errors path="animal" class="error"/>
				<form:label for="animal" path="animal">Type of animal:</form:label>
				<form:input type="text" path="animal" class="form-control"/>
			</div>
			
			<div class="form-group">
				<form:errors path="description" class="error"/>
				<form:label for="description" path="description">Description of Behaviour:</form:label>
				<form:input type="text" path="description" class="form-control"/>
			</div>
			
			<div class="form-group">
				<form:errors path="location" class="error"/>
				<form:label for="location" path="location">Location Sighted:</form:label>
				<form:input type="text" path="location" class="form-control"/>
			</div>
			
			<div class="form-group">
				<form:errors path="dateSpotted" class="error"/>
				<form:label for="dateSpotted" path="dateSpotted">Date of Sighting:</form:label>
				<form:input type="date" path="dateSpotted" class="form-control"/>
			</div>
			
			<div>
				<form:errors path="user" class="error"/>
				<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
			</div>
			
			<div class="form-group">
				<input type="submit" value="Submit" class="btn btn-primary"/>
			</div>
			
		</form:form>
		
	</div>
	
	<div>
		<form action="/sightings/${sighting.id}" method="post">
            <input type="hidden" name="_method" value="delete">
    		<input type="submit" value="Delete" class="btn btn-primary" id="delete-btn">
		</form>
	</div>
	
		



</div>
</body>
</html>