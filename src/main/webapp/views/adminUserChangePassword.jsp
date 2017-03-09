<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
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


<h1>Change Password</h1>
<form:form method="POST"
	action="${pageContext.request.contextPath}/doChangeAdminUserPassword">
	<c:if test="${not empty error}">
		<span class="error">Error: ${error}</span>
	</c:if>
	<table>
		<tr>
			<td><label path="passwordString" class="req_start">password</label></td>
			<td><input type="password" id="password" name="password" placeholder="Enter password"
				required></input></td>
		</tr>
		<tr>
			<td><label path="confirmPasswordString" class="req_start">Confirm Password</label></td>
			<td><input type="password" id="confPassword" name="confPassword" placeholder="Confirm password"
				required></input></td>
		</tr>
		<tr>
			<td><label path="secPasswordString" class="req_start">Second Password</label></td>
			<td><input type="password" id="secPassword" name="secPassword" placeholder="Second password"
				required></input></td>
		</tr>
		<tr>
			<td><label path="confirmSecPasswordString" class="req_start">Confirm
					Second Password</label></td>
			<td><input type="password" id="confSecPassword" placeholder="Enter Confirm Second password"
				name="confSecPassword" required></input></td>
		</tr>
		<tr>
			<td><input type="submit" value="Submit" class="btn btn-info" />
				<a
				href="${pageContext.request.contextPath}/views/adminUserDashboard.jsp"
				class="btn btn-info" role="button">Back</a></td>
		</tr>

	</table>

</form:form>