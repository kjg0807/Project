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
<h1>SHOP DETAIL</h1>
<section class="container-fluid col-lg-7 mt-5">
<table class="table table-striped">
	<thead>
		<tr>
		<th>shopName</th><th>categoryNum</th><th>shopPhone</th><th>shopAddress</th><th>priceAvg</th><th>delivery</th>
		</tr>
	</thead>
	
	<tbody>
		<tr>
			
			<td>${detail.shopName}</td>
			<td>${detail.categoryNum}</td>
			<td>${detail.shopPhone}</td>
			<td>${detail.shopAddress}</td>
			<td>${detail.priceAvg}</td>
			<td>${detail.delivery}</td>
		</tr>
	</tbody>
	</table>
	  <label for="exampleFormControlTextarea1" class="form-label"><b>내용</b></label>
		<tbody>
			<tr>
				<br><td>${requestScope.detail.shopContents}</td>
			</tr>
		</tbody>
		
		<div class="row">
			<c:forEach items="${detail.shopFileDTOs}" var="fileDTO">
			<p>
			<a href="../resources/upload/shop/${fileDTO.fileName}">${fileDTO.oriName}</a>
		</p>
			</c:forEach>
		</div>
		
		<br><a class="btn btn-secondary" href="delete?shopNum=${detail.shopNum}" role="delete">삭제</a>
		<a class="btn btn-secondary" href="update?shopNum=${detail.shopNum}" role="update">수정</a>
</section>
</body>
</html>