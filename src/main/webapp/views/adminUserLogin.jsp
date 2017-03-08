<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Header Jsp  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>

<h1 style="">Admin Login</h1>
<br />
<div class="col-sm-12">
	<c:if test="${not empty error}">
		<span class="error">Error: ${error}</span>
	</c:if>
</div>

<div class="col-sm-5">
	<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/doAdminLogin">
		<div class="form-group">
			<label class="control-label col-sm-2" for="email">Email:</label>
			<div class="col-sm-10">
				<input type="email" class="form-control" id="email" name="email"
					required placeholder="Enter email">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="pwd">Password:</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="password" required
					name="password" placeholder="Enter password">
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="pwd">Password:</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="secPassword"
					required name="secPassword" placeholder="Enter second password">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" name="loginBtn" value="Submit"
					class="btn btn-info" /> <a
					href="${pageContext.request.contextPath}" class="btn btn-info"
					role="button">Back</a>
			</div>
		</div>
	</form>
</div>