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
	action="${pageContext.request.contextPath}/doUpdateAdminUser"
	modelAttribute="adminUser">
	<c:if test="${not empty error}">
		<span class="error">Error: ${error}</span>
	</c:if>
	<table>
		<h1>User Profile</h1>
		<tr>
			<form:hidden path="id" />
			<td><form:label path="firstName" cssClass="req_start">First Name</form:label></td>
			<td><form:input path="firstName" placeholder="Enter First name" /></td>
			<td><form:errors path="firstName" cssClass="error" /></td>
		</tr>
		<tr>
			<td><form:label path="lastName" cssClass="req_start">Last Name</form:label></td>
			<td><form:input path="lastName" placeholder="Enter Last name" /></td>
			<td><form:errors path="lastName" cssClass="error" /></td>
		</tr>

		<tr>
			<td><form:label path="email" cssClass="req_start">Email</form:label></td>
			<td><form:input path="email" readonly="true" /></td>
		</tr>
		<tr>
			<td><input type="submit" value="Submit" class="btn btn-info"/></td>
			<td><a
				href="${pageContext.request.contextPath}/views/adminUserDashboard.jsp"
				class="btn btn-info" role="button">Back</a></td>
		</tr>

	</table>

</form:form>