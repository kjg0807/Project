<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
	<section class="container-fluid col-lg-5 mt-5">
	<h1>SHOP List</h1>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>SHOPNAME</th><th>SHOPPHONE</th>
			</tr>
		</thead>
		<tbody>			

				<c:forEach items="${requestScope.list}" var="gg">
				
				<tr>
					<td><a href="detailHTML?shopNum=${gg.shopNum}">${gg.shopName}</a></td>
					<td>${pageScope.gg.shopPhone}</td>
				</tr>
			
			</c:forEach>
		</tbody>
		
	
	</table>
		<nav aria-label="Page navigation example">
			<ul class="pagination">
			<c:if test="${shopPager.pre}">
				<li class="page-item">
					<a class="page-link" href="./list?shopPage=${shopPager.startNum-1}">&laquo;</a>
				</li>
			</c:if>
			
			<c:forEach begin="${shopPager.startNum}" end="${shopPager.lastNum}" var="i">
				<li class="page-item">
					<a class="page-link" href="./list?shopPage=${i}">${i}</a>
				</li>
			</c:forEach>
			<li class="page-item ${shopPager.next?'':'disabled'}">
			<a class="page-link" href="./list?shopPage=${shopPager.lastNum+1}">&raquo;</a>
			</ul>
		</nav>
		<a class="btn btn-secondary" href="./add" role="add">가게등록</a>
</section>
</body>
</html>