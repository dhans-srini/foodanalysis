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

<h2>Welcome ${sessionScope.user.name}</h2>
<br />
<c:if test="${not empty info}">
	<span class="alert alert-success">${info}</span>
</c:if>
<c:if test="${param.suc eq 'usr_upd_suc'}">
	<span class="alert alert-success">User updated successfully</span>
</c:if>
<br />
<br />
<c:if test="${sessionScope.user.role eq 'user'}">
	<a href="${pageContext.request.contextPath}/views/searchItems.jsp">Search
		Items</a>
</c:if>