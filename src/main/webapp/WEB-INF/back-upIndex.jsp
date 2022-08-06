<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<h2>Register</h2>
	
		<form:form action="/register" modelAttribute="newUser" class="form">
		
			<div>
			 	<form:errors path="userName"/>
				<form:label for="userName" path="userName">User Name:</form:label>
				<form:input type="text" placeholder="create user name"  path="userName"/>
			</div>
			
			<div>
				<form:errors path="email"/>
				<form:label for="email" path="email">Email:</form:label>
				<form:input type="email" placeholder="enter email" path="email"/>
			</div>
			
			<div>
				<form:errors path="password"/>
				<form:label for="password" path="password">Password:</form:label>
				<form:input type="password" placeholder="create password"  path="password"/>
			</div>
			
			<div>
				<form:errors path="confirm"/>
				<form:label for="" path="confirm">Confirm Password:</form:label>
				<form:input type="password" placeholder="confirm password" path="confirm"/>
			</div>
			
			<div>
				<input type="submit" value="Submit" class="btn-primary"/>
			</div>
			
		</form:form>
	</div>
	
	<!-- START OF LOG IN PORTION -->

	<div>
	
	<h2>Log In</h2>
	
		<form:form action="/login" modelAttribute="newLogin" class="form">
			<div>
				<form:errors path="email"/>
				<form:label for="email" path="email">Email:</form:label>
				<form:input type="text" placeholder="enter valid email"  path="email"/>
			</div>
			
			<div>
				<form:errors path="password"/>
				<form:label for="password" path="password">Password:</form:label>
				<form:input type="password" placeholder="enter valid password"  path="password"/>
			</div>
			
			<div>
				<input type="submit" value="Submit" class="btn-primary"/>
			</div>
		
		</form:form>
	</div>
</body>
</html>