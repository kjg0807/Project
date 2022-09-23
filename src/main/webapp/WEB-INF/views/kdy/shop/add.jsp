<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script></head>
<body>
<c:import url="../../template/headerHTML.jsp"></c:import>
	<section class="container-fluid col-lg-7 mt-5">
	<div class="row">
		<h1>가게등록</h1>
		
		<form action="add" method="post" enctype="multipart/form-data">
		
			<div class="mb-3">
				<br><input type="text" placeholder="카테고리를 선택해주세요" class="form-control" name="categoryNum">
			</div>
			
			<div class="mb-3">
				<br><input type="text" placeholder="가게 전화번호를 입력해주세요"class="form-control" name="shopPhone">
			</div>
			
			<div class="mb-3">
			<br><input type="text" placeholder="가게 이름을 입력해주세요"class="form-control" name="shopName">
			</div>
			<div class="mb-3">
			<br><input type="text" placeholder="가게 주소를 입력해주세요"class="form-control" name="shopAddress">
			</div>
			<div class="mb-3">
			<br><input type="text" placeholder="가게 평균 가격을 입력해주세요"class="form-control" name="priceAvg">
			</div>
			<div class="mb-3">
			<br><input type="text" placeholder="가게 배달비를"class="form-control" name="delivery">
			</div>
		
			<div class="mb-3">
			<textarea class="form-control" name="contents" placeholder="가게를 소개해주세요" rows="3"></textarea>
			</div>
			
			<div class="mb-3">
			<textarea class="form-control" name="title" placeholder="제목을 입력하세요" rows="3"></textarea>
			</div>
		
		<div id="addFiles">
			<i class="fa-regular fa-image" >
			</i>
				<button type="button" id="fileAdd">파일추가</button>
		</div>
		
			<div class="mb-3">
				<input type="submit" class="btn btn-secondary" value="등록" name="가게 등록">
			</div>
			
		</form>
		</div>
		</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script type="text/javascript">
		$("#contents").summernote();
	</script>
	<script src="/resources/js/shop_files.js"></script>

</body>
</html>