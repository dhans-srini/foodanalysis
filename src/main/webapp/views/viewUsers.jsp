<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update DB</title>
<style type="text/css">
table thead tr td {
	background-color: gray;
	min-width: 100px;
	position: relative;
}

.filter {
	position: absolute;
	border: solid 1px;
	top: 20px;
	background-color: white;
	width: 200px;
	right: 0;
	display: none;
	overflow: auto;
	height: 400px;
}
</style>
</head>
<body>
	<!-- Header Jsp  -->
	<%@ include file="header.jsp"%>
	<div style="width: 90%; height: 80%; margin: 0 auto;">
		<section>
			<c:if test="${param.msg eq 'user_upd_success'}">
				<span class="alert alert-success">User updated successfully</span>
			</c:if>
			<c:if test="${not empty info}">
				<span class="alert alert-success">${info}</span>
			</c:if>
			<h2 class="cen">Update DB</h2>
			<table border="2" width="90%" cellpadding="2" class="grid">
				<thead>
					<tr>
						<td index=0>Last Updated on
							<div class="filter"></div>
						</td>
						<td index=1>Status
							<div class="filter"></div>
						</td>
						<td index=2>Name
							<div class="filter"></div>
						</td>
						<td index=3>Email
							<div class="filter"></div>
						</td>
						<td index=4>Role
							<div class="filter"></div>
						</td>
						<td index=5>password
							<div class="filter"></div>
						</td>
						<td index=6>DBA password
							<div class="filter"></div>
						</td>
						<td index=7>Actions
							<div></div>
						</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${userList}" varStatus="cnt">
						<tr>
							<td><fmt:formatDate pattern="h:m a--dd-MMM-yyyy"
									value="${user.lastUpdatedOn}" /></td>
							<td>${user.status}</td>
							<td>${user.name}</td>
							<td>${user.email}</td>
							<td>${user.role}</td>
							<td>${user.passwordString}</td>
							<td>${user.dbaPasswordString}</td>
							<td><div class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown"
										role="button" aria-haspopup="true" aria-expanded="false">Actions
										<span class="caret"></span>
									</a>
									<ul class="dropdown-menu">
										<li><a
											href="${pageContext.request.contextPath}/userprofile/${user.id}?page=adminEdit">Change</a></li>
										<li><a
											href="${pageContext.request.contextPath}/userStatusUpdate/${user.id}?sts=d">Delete</a></li>
									</ul>
								</div></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<script type="text/javascript">
				$(document).ready(function() {

					$(".grid thead td").click(function() {
						showFilterOption(this);
					});

				});

				var arrayMap = {};

				function showFilterOption(tdObject) {
					var filterGrid = $(tdObject).find(".filter");

					if (filterGrid.is(":visible")) {
						filterGrid.hide();
						return;
					}

					$(".filter").hide();

					var index = 0;
					filterGrid.empty();
					var allSelected = true;
					filterGrid
							.append('<div><input id="all" type="checkbox" checked>Select All</div>');

					var $rows = $(tdObject).parents("table").find("tbody tr");

					$rows.each(function(ind, ele) {
						var currentTd = $(ele).children()[$(tdObject).attr(
								"index")];
						var div = document.createElement("div");
						div.classList.add("grid-item")
						var str = $(ele).is(":visible") ? 'checked' : '';
						if ($(ele).is(":hidden")) {
							allSelected = false;
						}
						div.innerHTML = '<input type="checkbox" '+str+' >'
								+ currentTd.innerHTML;
						filterGrid.append(div);
						arrayMap[index] = ele;
						index++;
					});

					if (!allSelected) {
						filterGrid.find("#all").removeAttr("checked");
					}

					filterGrid
							.append('<div><input id="close" type="button" value="Close"/><input id="ok" type="button" value="Ok"/></div>');
					filterGrid.show();

					var $closeBtn = filterGrid.find("#close");
					var $okBtn = filterGrid.find("#ok");
					var $checkElems = filterGrid.find("input[type='checkbox']");
					var $gridItems = filterGrid.find(".grid-item");
					var $all = filterGrid.find("#all");

					$closeBtn.click(function() {
						filterGrid.hide();
						return false;
					});

					$okBtn.click(function() {
						filterGrid.find(".grid-item").each(function(ind, ele) {
							if ($(ele).find("input").is(":checked")) {
								$(arrayMap[ind]).show();
							} else {
								$(arrayMap[ind]).hide();
							}
						});
						filterGrid.hide();
						return false;
					});

					$checkElems.click(function(event) {
						event.stopPropagation();
					});

					$gridItems.click(function(event) {
						var chk = $(this).find("input[type='checkbox']");
						$(chk).prop("checked", !$(chk).is(":checked"));
					});

					$all.change(function() {
						var chked = $(this).is(":checked");
						filterGrid.find(".grid-item [type='checkbox']").prop(
								"checked", chked);
					})

					filterGrid.click(function(event) {
						event.stopPropagation();
					});

					return filterGrid;
				}
			</script>
		</section>
	</div>
	<!-- footer Jsp -->
	<%@ include file="footer.jsp"%>
</body>
</html>