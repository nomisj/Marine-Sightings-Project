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

	<h1>Marine Sightings</h1>

	<h2>Register</h2>

	<div>
		<form:form action="/register" modelAttribute="newUser" class="form">
		
			<div>
			 	<form:errors path="userName"/>
				<form:label for="userName" path="userName">User Name:</form:label>
				<form:input type="text" path="userName"/>
			</div>
			
			<div>
				<form:errors path="email"/>
				<form:label for="email" path="email">Email:</form:label>
				<form:input type="text" path="email"/>
			</div>
			
			<div>
				<form:errors path="password"/>
				<form:label for="password" path="password">Confirm Password:</form:label>
				<form:input type="text" path="password"/>
			</div>
			
			<div>
				<form:errors path="confirm"/>
				<form:label for="" path="confirm">Confirm:</form:label>
				<form:input type="text" path="confirm"/>
			</div>
			
			<div>
				<input type="submit" value="Submit" class="btn-primary"/>
			</div>
			
		</form:form>
	</div>
	
	<!-- START OF LOG IN PORTION -->
	
	<h2>Log In</h2>

	<div>
		<form:form action="/login" modelAttribute="newLogin" class="form">
			<div>
				<form:errors path="email"/>
				<form:label for="email" path="email">Email:</form:label>
				<form:input type="text" path="email" class="form-control"/>
			</div>
			
			<div>
				<form:errors path="password"/>
				<form:label for="password" path="password">Password:</form:label>
				<form:input type="text" path="password" class="form-control"/>
			</div>
			
			<div>
				<input type="submit" value="Submit" class="btn-primary"/>
			</div>
		
		</form:form>
	</div>

</div> <!-- DIV FOR WRAPPING THE WHOLE FOURM TOGETHER -->
</body>
</html>