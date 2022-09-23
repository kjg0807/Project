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
<section class="container-fluid col-lg-7 mt-5">
	<div class="row">
		<h1>카테고리 추가</h1>
			<form action="add" method="post">
				<div class="mb-3">
				<br><input type="text" placeholder="카테고리 이름을 작성해주세요" class="form-control" name="categoryName">
			</div>
			<div class="mb-3">
				<input type="submit" class="btn btn-secondary" value="등록" name="카테고리 추가">
			</div>
			</form>
	</div>
</section>
<c:import url="../../template/footerHTML.jsp"></c:import>
</body>
</html>