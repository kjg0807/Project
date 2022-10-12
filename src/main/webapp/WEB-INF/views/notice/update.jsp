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
textarea {
	resize: none;
}
</style>
<body>

	<section class="container-fluid col-lg-9 mt-5">
		<h1 style="text-align: center;">공지사항 수정 페이지</h1>
		<form action="./update" method="post">
			<table class="table table-striped table-hover">
				<input type="hidden" name="num" readonly="readonly" value="${dto.num}">
				<tr>
					<th><label for="formGroupExampleInput" class="form-label">제목</label></th>
					<th><label for="formGroupExampleInput2" class="form-label">작성자</label></th>
				</tr>
				<tr>
					<td>
						<input type="text" class="form-control" name="title" value="${dto.title}">
					</td>
					<td>
						<input type="text" class="form-control" name="userID" value="${dto.userID}" disabled>
					</td>
				</tr>
			</table>
			<table class="table table-striped table-hover">
				<tr>
					<th><label for="formGroupExampleInput2" class="form-label">글내용</label></th>
				</tr>
				<tr>
					<td>
						<textarea class="form-control" style="width: 100%; height: 400px;" name="contents" id="" cols="50" rows="10">${dto.contents}</textarea>
					</td>
				</tr>
			</table>
			<br>

			<p>
				<div>
					<button onclick="location='./list'" class="btn btn-primary">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
							<path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
						</svg>
					목록
					</button>	
				</div>
			</p>

			<div style="display: inline-block; margin: 0 5px;  float: left;">
				<button onclick="location='/'" class="btn btn-primary">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
						<path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
					</svg>
					홈으로
				</button>
			</div>

			<div style="display: inline-block; margin: 0 5px;  float: right;">
				<button type="submit" class="btn btn-success">수정완료</button>
			</div>
		</form>
	</section>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"
	></script>

	<c:import url="../template/footerHTML.jsp"></c:import>
</body>

</html>