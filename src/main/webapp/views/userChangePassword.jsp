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
	action="${pageContext.request.contextPath}/doChangeUserPassword">
	<c:if test="${not empty error}">
		<span class="error">Error: ${error}</span>
	</c:if>
	<br />
	<input hidden="true" name="userId" value="${param.userId}"></input>
	<label path="passwordString">password</label>
	<input type="password" id="passwordString" placeholder="Enter password"
		name="passwordString" required></input>
	<br />
	<label path="confirmPasswordString">Confirm Password</label>
	<input type="password" id="confirmPasswordString"
		placeholder="Enter confirm password" name="confirmPasswordString"
		required></input>
	<br />
	<c:if test="${param.page eq 'admin'}">
		<input hidden="true" name="page" value="${param.page}"></input>
		<label>DBA password</label>
		<input type="password" placeholder="Enter DBA password" name="dbaPwd"
			required></input>
		<br />
		<label>Confirm Password</label>
		<input type="password" placeholder="Enter confirm DBA password"
			name="confDbaPwd" required></input>
		<br />
	</c:if>
	<input type="submit" value="Submit" />
</form:form>