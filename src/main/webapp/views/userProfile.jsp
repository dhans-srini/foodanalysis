<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Profile</title>
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



<form:form method="POST"
	action="${pageContext.request.contextPath}/doUpdateUser"
	modelAttribute="user">
	<c:if test="${not empty error}">
		<span class="error">Error: ${error}</span>
	</c:if>
	<input hidden="true" id="page" name="page" value="${param.page}"></input>
	<h1>User Profile</h1>
	<table>
		<tr>
			<form:hidden path="id" />
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
			<td><form:input path="email" readonly="true" /></td>
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
		<c:if test="${param.page ne null}">
			<tr>
				<td><form:label path="isActive">Active</form:label></td>
				<td><form:checkbox path="isActive" /></td>
			</tr>
		</c:if>
		<tr>
			<td><input type="submit" value="Submit" /></td>
			<td><c:if test="${param.page eq null}">
					<a
						href="${pageContext.request.contextPath}/views/userDashboard.jsp"
						class="btn btn-info" role="button">Back</a>
				</c:if> <c:if test="${param.page ne null}">
					<a href="${pageContext.request.contextPath}/viewUsers"
						class="btn btn-info" role="button">Back</a>
				</c:if></td>
		</tr>

	</table>

</form:form>