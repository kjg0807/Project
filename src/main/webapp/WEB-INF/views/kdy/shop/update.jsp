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
<c:import url="../template/headerHTML.jsp"></c:import>
	<section class="container-fluid col-lg-6 mt-5">
	<h1>가게 정보 수정</h1>
		
<div class="row">
<form action="update" method="post">

	<input type="hidden" name="shopNum" readonly="readonly" value="${detail.shopNum}">
	
	<div class="mb-3">
		식당 이름 수정 : <input type="text" class="form-control" name="shopName" value="${detail.shopName}">
	</div>
	<div class="mb-3">
		카테고리 수정 : <input type="text" class="form-control" name="categoryNum" value="${detail.categoryNum}">
	</div>
	
	<div class="mb-3">
		가게 전화번호 수정 : <input type="text" class="form-control" name="shopPhone" value="${detail.shopPhone}">
	</div>
	
	<div class="mb-3">
		가게 주소 수정 : <input type="text" class="form-control" name="shopAddress" value="${detail.shopAddress}">
	</div>
	<div class="mb-3">
		가게 평균가격 수정 : <input type="text" class="form-control" name="priceAvg" value="${detail.priceAvg}">
	</div>
	<div class="mb-3">
		가게 배달비 수정 : <input type="text" class="form-control" name="delivery" value="${detail.delivery}">
	</div>
	<div class="mb-3">
		가게 소개글 수정 :<br><textarea name="contents" rows="10" cols="60">${detail.contents}</textarea>
	</div>
	
	<div class="mb-3">
		 <input type="submit"  class="btn btn-secondary" value="수정">
	</div>
	
</form>

</div>
</section>
<c:import url="../template/footerHTML.jsp"></c:import>
</body>
</html>