<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Header Jsp  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>
<form id="loginForm" method="post" action="${pageContext.request.contextPath}/doAdminLogin">
	<h1 style="">Food Analysis</h1>
	<br />
	<c:if test="${not empty error}">
		<span class="error">Error: ${error}</span>
	</c:if>
	<table>
		<tr>
			<td>User ID :</td>
			<td><input type="text" id="email" name="email" required /></td>
		</tr>
		<tr>
			<td>Password :</td>
			<td><input type="password" id="password" name="password"
				required /></td>
		</tr>
		<tr>
			<td>Second Password :</td>
			<td><input type="password" id="secPassword" name="secPassword"
				required /></td>
		</tr>
		<tr>
			<td><input type="submit" name="loginBtn" value="Submit" /></td>
			<td><a href="forgotpassword.jsp">Forgot Password?</a></td>
		</tr>
	</table>
</form>
