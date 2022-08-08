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
<link rel="stylesheet" type="text/css" href="/css/index.css">
</head>
<body>
<!-- Start of Registration Form -->
	<div class="background-image">
	<h1>Marine Sightings</h1>
		<div class="form-box">
			<div class="button-box">
				<div id="btn"></div>
				<button type="button" class="toggle-btn" onclick="login()">Login</button>
				<button type="button" class="toggle-btn" onclick="register()">Register</button>
			</div>
<!-- Login Form -->
		<form:form action="/login" modelAttribute="newLogin" id="login" class="input-group">
			<form:errors path="email"/>
			<form:label for="email" path="email">Email:</form:label>
			<form:input type="text" path="email" class="input-field"/>
			
			<form:errors path="password"/>
			<form:label for="password" path="password">Password:</form:label>
			<form:input type="password" path="password" class="input-field"/>
			
			<input type="submit" value="Submit" class="submit-btn"/>	
		</form:form>
		
<!-- Registration Form -->
		<form:form action="/register" modelAttribute="newUser" id="register" class="input-group">
			<form:errors path="userName"/>
			<form:label for="userName" path="userName">User Name:</form:label>
			<form:input type="text" path="userName" class="input-field"/>
			
			<form:errors path="email"/>
			<form:label for="email" path="email">Email:</form:label>
			<form:input type="email" path="email" class="input-field"/>
			
			<form:errors path="password"/>
			<form:label for="password" path="password">Password:</form:label>
			<form:input type="password" path="password" class="input-field"/>
			
			<form:errors path="confirm"/>
			<form:label for="" path="confirm">Confirm Password:</form:label>
			<form:input type="password" path="confirm" class="input-field"/>
			
			<input type="submit" value="Submit" class="submit-btn"/>
		</form:form>
		</div>
	</div>

		<script>
		
		var x = document.getElementById("login");
		var y = document.getElementById("register");
		var z = document.getElementById("btn");
		
		function register(){
			x.style.left = "-400px";
			y.style.left = "50px";
			z.style.left = "110px";
		}
		
		function login(){
			x.style.left = "50px";
			y.style.left = "450px";
			z.style.left = "0";
		}
		</script>

</body>
</html>