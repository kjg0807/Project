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
<c:import url="../../template/headerHTML.jsp"></c:import>
<section class="container-fluid col-lg-5 mt-5">
	<h1>CATEGORY list</h1>
		<a class="btn btn-secondary" href="./add" role="add">카테고리 추가</a>
		<a class="btn btn-secondary" href="./delete" role="delete">카테고리 삭제</a>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>CATEGORYNAME</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list}" var="list">
			
			<%-- <tr>
				<td><a href="listHTML?categoryNum=${list.categoryNum}">${list.categoryName}</a></td>
			</tr> --%>
			<tr>
				<td>${list.categoryName}</td>
			</tr>
			
			</c:forEach>
		</tbody>
	</table>
	
</section>
<c:import url="../../template/footerHTML.jsp"></c:import>
</body>
</html>