<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Header Jsp  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>

<h1 style="">User forgot password</h1>
<br />
<div class="col-sm-12">
	<c:if test="${not empty error}">
		<span class="error">Error: ${error}</span>
	</c:if>
	<span>${info}</span>
</div>

<div class="col-sm-5">
	<form method="post"
		action="${pageContext.request.contextPath}/forgotpwd">
		<input hidden="true" id="page" name="page" value="${param.page}"></input>
		<label for="email">Email:</label> <input type="email" id="email"
			name="email" required placeholder="Enter email"> <br /> <label
			for="favFriendName">Favourite friend name? </label> <input
			name="favFriendName" placeholder="Enter friend name" /><br /> <label
			for="favMovieName">Favourite movie name? </label> <input
			name="favMovieName" placeholder="Enter movie name" /> <br /> <input
			type="submit" name="loginBtn" value="Submit" /> <a
			href="${pageContext.request.contextPath}/views/userLogin.jsp">Back</a>

	</form>
</div>
