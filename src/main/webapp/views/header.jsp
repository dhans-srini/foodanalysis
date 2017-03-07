<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
ul.topnav {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: overflow !important;
}

ul.topnav li.left {
	float: left;
}

ul.topnav li.right {
	float: right;
}

ul.topnav li a {
	display: block;
	color: Black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

ul.topnav li a:hover:not (.active ) ul.topnav li a.active 

ul.topnav li.left {
	float: left;
}

ul.topnav li.right {
	float: right;
}

.error {
	color: #ff0000;
	font-style: italic;
}

@media screen and (max-width: 600px) {
	ul.topnav li.left, ul.topnav li.right, ul.topnav li {
		float: none;
	}
}

.header {
	top: 10px;
}
</style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="./index.request">Home</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<c:if
				test="${sessionScope.adminUser eq null and sessionScope.user eq null}">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Login <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="userloginview">User Login</a></li>
							<li><a
								href="${pageContext.request.contextPath}/adminUserLoginView">Admin
									Login</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Register <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="usrregistration">User Register</a></li>
							<li><a
								href="${pageContext.request.contextPath}/adminUserRegistration">Admin
									Register</a></li>
						</ul></li>
				</ul>
			</c:if>
			<c:if
				test="${sessionScope.adminUser ne null or sessionScope.user ne null}">
				<a href="${pageContext.request.contextPath}/logout">logout</a>
			</c:if>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Reports <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">Update details</a></li>
						<li><a href="#">My Account</a></li>
					</ul></li>
				<li><a href="./aboutus.request">About us</a></li>
				<li><a href="./contact.request">Contact us</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
