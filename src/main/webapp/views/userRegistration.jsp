<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>

<style>
.img1 {
	width: 100%;
	z-index
	=3;
}

#register {
	position: absolute;
	background: url('img/grey.jpg');
	right: 50%;
	top: 20%;
}
</style>
<%@ include file="header.jsp"%>
<!-- Header Jsp  -->


<!--  <ul class="topnav">
  <li><a class="active" href="./goToIndex.request">Home</a></li>
  <li><a href="#news">News</a></li>
  <li><a href="#contact">Contact</a></li>
  
  <li class="right"><a href="./goToLogin.request">Login</a></li>
  
</ul> -->


<!-- <img class="img1" src="img/closed_door.jpg" alt="">  -->



<form:form method="POST" action="doRegisterUser" modelAttribute="user">
	<c:if test="${not empty error}">
		<span class="error">Error: ${error}</span>
	</c:if>
	<table>
		<h1>Registration</h1>
		<tr>
			<td><form:label path="firstName">First Name</form:label></td>
			<td><form:input path="firstName" /></td>
			<td><form:errors path="firstName" cssClass="error" /></td>
		</tr>
		<tr>
			<td><form:label path="lastName">Last Name</form:label></td>
			<td><form:input path="lastName" /></td>
			<td><form:errors path="lastName" cssClass="error" /></td>
		</tr>

		<tr>
			<td><form:label path="email">Email</form:label></td>
			<td><form:input path="email" /></td>
			<td><form:errors path="email" cssClass="error" /></td>
		</tr>

		<tr>
			<td><form:label path="passwordString">password</form:label></td>
			<td><form:password path="passwordString" /></td>
			<td><form:errors path="passwordString" cssClass="error" /></td>
		</tr>

		<tr>
			<td><form:label path="confirmPasswordString">Confirm Password</form:label></td>
			<td><form:password path="confirmPasswordString" /></td>
			<td><form:errors path="confirmPasswordString" cssClass="error" /></td>
		</tr>

		<tr>
			<td><form:label path="age">Age</form:label></td>
			<td><form:select path="age">
					<form:option value="NONE" label="--- Select ---" />
					<form:option value="Between 18 to 30" label="Between 18 to 30" />
					<form:option value="Between 31 to 50" label="Between 31 to 50" />
					<form:option value="Between 51 to 70" label="Between 51 to 70" />
					<form:option value="70 and above" label="70 and above" />
				</form:select></td>
			<td><form:errors path="age" cssClass="error" /></td>
		</tr>
		<tr>
			<td><form:label path="gender">Gender</form:label></td>
			<td><form:select path="Gender">
					<form:option value="NONE" label="--- Select ---" />
					<form:option value="MALE" label="Male" />
					<form:option value="FEMALE" label="Female" />
				</form:select></td>
			<td><form:errors path="gender" cssClass="error" /></td>
		</tr>
		<tr>
			<td><form:label path="weightString">Weight</form:label></td>
			<td><form:input path="weightString" /></td>
			<td><form:errors path="weightString" cssClass="error" /></td>
		</tr>
		<tr>
			<td><form:label path="HeightInFeetsString">Height</form:label></td>
			<td><form:input path="HeightInFeetsString" /> Feets <form:label
					path="HeightWithRemainingInchString"></form:label> <form:input
					path="HeightWithRemainingInchString" /></td>Inches
			<td><form:errors path="HeightInFeetsString" cssClass="error" />
				<form:errors path="HeightWithRemainingInchString" cssClass="error" /></td>
		</tr>
		<tr>
			<td><form:label path="alergies">Alergies</form:label></td>
			<td><form:input path="alergies" /></td>
		</tr>
		<tr>
			<td><form:label path="healthIssues">Health Issues</form:label></td>
			<td><form:input path="healthIssues" /></td>
		</tr>
		<tr>
			<td><form:label path="phone">Phone</form:label></td>
			<td><form:input path="phone" /></td>
			<td><form:errors path="phone" cssClass="error" /></td>
		</tr>

		<tr>
			<td><input type="submit" value="Submit" /></td>
		</tr>

	</table>

</form:form>