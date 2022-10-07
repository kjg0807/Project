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
						<input type="text" class="form-control" name="writer" value="${dto.writer}" disabled>
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
			<button onclick="location='/'" class="btn btn-primary">홈으로</button>
			<button type="submit" class="btn btn-success">수정완료</button>
		</form>
	</section>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"
	></script>

	<c:import url="../template/footerHTML.jsp"></c:import>
</body>

</html>