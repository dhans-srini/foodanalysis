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



<form:form method="POST" action="doRegisterAdminUser" id="adminRegFrom"
	onsubmit="validate()" modelAttribute="adminUser">
	<c:if test="${not empty error}">
		<span class="error">Error: ${error}</span>
	</c:if>
	<h1>Admin Registration</h1>
	<table>
		<tr>
			<td><form:label path="firstName">First Name</form:label></td>
			<td><form:input path="firstName" required="required" /></td>
			<td><form:errors path="firstName" cssClass="error" /></td>
		</tr>
		<tr>
			<td><form:label path="lastName">Last Name</form:label></td>
			<td><form:input path="lastName" required="required" /></td>
			<td><form:errors path="lastName" cssClass="error" /></td>
		</tr>
		<tr>
			<td><form:label path="email">Email</form:label></td>
			<td><form:input path="email" type="email" required="required" /></td>
			<td><form:errors path="email" cssClass="error" /></td>
		</tr>
		<tr>
			<td><form:label path="passwordString">password</form:label></td>
			<td><form:password path="passwordString" required="required"
					id="password" name="password" /></td>
			<td><form:errors path="passwordString" cssClass="error" /></td>
		</tr>
		<tr>
			<td><form:label path="confirmPasswordString">Confirm Password</form:label></td>
			<td><form:password path="confirmPasswordString"
					id="confirmPassword" name="confirmPassword" required="required" /></td>
			<td><form:errors path="confirmPasswordString" cssClass="error" /></td>
		</tr>
		<tr>
			<td><form:label path="secondPasswordString"> Second Password</form:label></td>
			<td><form:password path="secondPasswordString"
					required="required" /></td>
			<td><form:errors path="secondPasswordString" cssClass="error" /></td>
		</tr>
		<tr>
			<td><form:label path="confirmSecondPasswordString">Confirm Second Password</form:label></td>
			<td><form:password path="confirmSecondPasswordString"
					required="required" /></td>
			<td><form:errors path="confirmSecondPasswordString"
					cssClass="error" /></td>
		</tr>
		<tr>
			<td><input type="submit" value="Submit" class="btn btn-info" />
				<a href="${pageContext.request.contextPath}" class="btn btn-info"
				role="button">Back</a></td>
		</tr>

	</table>
</form:form>