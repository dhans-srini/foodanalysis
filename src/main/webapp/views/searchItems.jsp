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
			<div class="col-sm-12">
				<div class="col-sm-7">
					<form action="${pageContext.request.contextPath}/searchItem"
						method="get">
						<input type="text" class="form-control" id="search" name="search"
							required placeholder="Enter Item"> <input type="submit"
							value="Search" class="btn btn-info" />
						</td> <a
							href="${pageContext.request.contextPath}/views/userDashboard.jsp"
							class="btn btn-info" role="button">Back</a>
					</form>
				</div>
			</div>
			<div class="col-sm-12">
				<c:if test="${param.search ne null}">
					<c:forEach var="searchItem" items="${searchItems}" varStatus="cnt">
						<div class="col-sm-5"
							style="border-style: solid; border-color: #aad8e6; height: 500; margin-left: 10px; margin-bottom: 20px; overflow: auto;">
							<table class="table table-user-information">
								<tbody>
									<tr>
										<td>Name</td>
										<td>${searchItem.name}</td>
									</tr>
									<tr>
										<td>Fats</td>
										<td>${searchItem.fats}</td>
									</tr>
									<tr>
										<td>Proteins</td>
										<td>${searchItem.proteins}</td>
									</tr>
									<tr>
										<td>Carbohydrates</td>
										<td>${searchItem.carbohydrates}</td>
									</tr>
									<tr>
										<td>Vitamins</td>
										<td>${searchItem.vitamins}</td>
									</tr>
									<tr>
										<td>Sugar</td>
										<td>${searchItem.sugar}</td>
									</tr>

									<tr>
										<td>Calorie</td>
										<td>${searchItem.calorie}</td>
									</tr>

									<tr>
										<td>Benefits</td>
										<td>${searchItem.benefits}</td>
									</tr>

									<tr>
										<td>Disadvantages</td>
										<td>${searchItem.disadvantages}</td>
									</tr>
								</tbody>
							</table>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</section>
	</div>
	<!-- footer Jsp -->
	<%@ include file="footer.jsp"%>
</body>
</html>