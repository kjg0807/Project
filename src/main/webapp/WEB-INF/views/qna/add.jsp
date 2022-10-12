<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"
>
<c:import url="../template/headerHTML.jsp"></c:import>
</head>
<style>
#on {
	align-content: right;
	justify-content: right;
	/* margin-left: 46%; */
}
</style>
<body>

	<section class="container-fluid col-lg-6 mt-5">
		<p>
			<h1>Q&A 글쓰기 페이지</h1>
		</p>
		
		<form action="./add" method="post">
			<div class="mb-3">
				<label for="formGroupExampleInput2" class="form-label">작성자</label>
				<input type="hidden" name="writer" value="${member.userName}">
				<input type="text" class="form-control" readonly value="${member.userName}">
			</div>

			<!-- <div class="mb-3">
				작성자 :<input type="text" name="writer" class="form-label" value="${member.userName}" readonly>

			</div> -->

			<div class="mb-3">
				<label for="formGroupExampleInput" class="form-label">제목</label>
				<input type="text" class="form-control" name="title" placeholder="제목을 입력해주세요.">
			</div>


			<div class="mb-3">
				<label for="formGroupExampleInput2" class="form-label">글 내용</label>
				<textarea name="contents" id="contents" class="form-control" cols="20" rows="5" placeholder="내용을 입력해주세요."></textarea>
			</div>
			<br>

			
			<!-- <button onclick="location='../qna/list'" class="btn btn-primary">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
					<path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
					<path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
				</svg>
				뒤로가기
			</button> -->


			<div style="display: inline-block; margin: 0 5px;  float: right;">
				<button id="on" type="submit" class="btn btn-success">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-all" viewBox="0 0 16 16">
						<path d="M8.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L2.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093L8.95 4.992a.252.252 0 0 1 .02-.022zm-.92 5.14.92.92a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 1 0-1.091-1.028L9.477 9.417l-.485-.486-.943 1.179z"/>
					</svg>
					작성완료
				</button>
			</div>
		</form>

	</section>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"
	></script>

	<c:import url="../template/footerHTML.jsp"></c:import>
</body>
</html>