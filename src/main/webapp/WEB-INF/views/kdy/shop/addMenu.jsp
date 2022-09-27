<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<c:import url="../../template/headerHTML.jsp"></c:import>
	<section class="container-fluid col-lg-7 mt-5">
	<div class="row">
		<h1>메뉴등록</h1>
		
		<form action="./addMenu" method="post">
			<input type="hidden" name="shopNum" value="${shopNum }">
			<div class="mb-3">
				<br><input type="text" placeholder="메뉴이름을 입력해주세요" class="form-control" name="menuName" data-shopnum="${shopNum}">
			</div>
			<div class="mb-3">
				<br><input type="text" placeholder="메뉴가격을 입력해주세요" class="form-control" name="menuPrice">
			</div>
		
			<div class="mb-3">
				<input type="submit" class="btn btn-secondary" value="등록" name="가게 등록">
			</div>
			
		</form>
		</div>
		</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

	<script src="/resources/js/shop_files.js"></script>

</body>
</html>