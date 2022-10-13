<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
		 crossorigin="anonymous">
		 <c:import url="../template/headerHTML.jsp"></c:import>
</head>
<body>
	<h1 class="align-center">Reply Page</h1>
<section class="container-fluid col-lg-4">
	
	<div class="row">
		<form action="./reply" method="post">
			<input type="hidden" name="num" value="${qnaDTO.num}">
			<div class="mb-3">
			  <label for="userID" class="form-label">작성자</label>
			  <input type="text" name="userID" class="form-control" value="${dto.userID}" readonly disabled>
			</div>
			<div class="mb-3">
			  <label for="title" class="form-label">제목</label>
			  <input type="text" name="title" class="form-control" id="title" placeholder="제목을 입력하세요.">
			</div>
			<div class="mb-3">
			  <label for="contents" class="form-label">내용</label>
			  <textarea class="form-control" name="contents" id="contents" rows="3" placeholder="내용을 입력하세요."></textarea>
			</div>
			
			<div style="display: inline-block; margin: 0 5px;  float: right;">
				<div class="mb-3">
					<button class="btn btn-success">작성완료</button>
				</div>
			</div>
			
		</form>
	</div>
	</section>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
    			 integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" 
    			 crossorigin="anonymous"></script>
    			 <c:import url="../template/footerHTML.jsp"></c:import>
</body>
</html>