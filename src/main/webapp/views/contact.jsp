<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FAS-Contact</title>
</head>
<body>
	<!-- Header Jsp  -->
	<%@ include file="header.jsp"%>
	<div style="width: 80%; height: 80%; margin: 0 auto;">
		<section>
			<div class="col-sm-7">
				<div class="table-responsive">
					<table border="2" width="70%" cellpadding="2" class="table">
						<tr>
							<th>Sl.No</th>
							<th>Name</th>
							<th>Email</th>
							<th>phone</th>
						</tr>
						<c:forEach var="contactus" items="${contactus}" varStatus="cnt">
							<tr>
								<td>${cnt.count}</td>
								<td>${contactus.name}</td>
								<td>${contactus.email}</td>
								<td>${contactus.phone}</td>
							</tr>
						</c:forEach>
					</table>
				</div>

			</div>
		</section>
	</div>
	<!-- footer Jsp -->
	<%@ include file="footer.jsp"%>
</body>
</html>