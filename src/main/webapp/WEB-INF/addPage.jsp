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

	<div>
	
	<h1>Add a new sighting</h1>	
	<p><a href="/home">Go Back</a></p>
		<form:form action="/sightings" modelAttribute="sighting" class="form" method="post">
		
			<div class="form-group">
			 	<form:errors path="animal" class="error"/>
				<form:label for="animal" path="animal" class="label">Type of animal:</form:label>
				<form:input type="text" path="animal" class="form-control"/>
			</div>
			
			<div class="form-group">
				<form:errors path="description" class="error"/>
				<form:label for="description" path="description" class="label">Description of Behaviour:</form:label>
				<form:input type="text" path="description" class="form-control"/>
			</div>
			
			<div class="form-group">
				<form:errors path="location" class="error"/>
				<form:label for="location" path="location" class="label">Location Sighted:</form:label>
				<form:input type="text" path="location" class="form-control"/>
			</div>
			
			<div class="form-group">
				<form:errors path="dateSpotted" class="error"/>
				<form:label for="dateSpotted" path="dateSpotted" class="label">Date of Sighting:</form:label>
				<form:input type="date" path="dateSpotted" class="form-control"/>
			</div>
			
			<div>
				<form:errors path="user" class="error"/>
				<form:input type="hidden" path="user" value="${user.id}"/>
			</div>
			
			<div class="form-group"><input type="submit" value="Submit" class="btn btn-primary"/></div>
			
		</form:form>
	</div>
	

	
</div> 
</body>
</html>