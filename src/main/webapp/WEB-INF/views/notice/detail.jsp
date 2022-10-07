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
#context {
	width: 200px;
}

textarea {
	resize: none;
}
</style>

<body>

	<section class="container-fluid col-lg-10 mt-5">
		<h1 style="text-align: center;">공지사항 Detail Page</h1>

		<table border="1" class="table table-striped table-hover">
			<thead>
				<tr>
					<th>NUM</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>CONTENTS</th>
					<th>REGDATE</th>
					<th>HIT</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${requestScope.dto.getNum()}</td>
					<td>${requestScope.dto.getTitle()}</td>
					<td>${requestScope.dto.writer}</td>
					<td id="context">
						<textarea name="" id="" cols="50" style="height: 200px;" rows="10" disabled>${requestScope.dto.contents}</textarea>
					</td>
					<td>${requestScope.dto.regDate}</td>
					<td>${requestScope.dto.hit}</td>
				</tr>
			</tbody>
		</table>

		<!-- <a href="./update?num=${dto.num}">수정하기</a> <a href="./delete?num=${dto.num}">삭제하기</a> -->
		<button onclick="location='/'" class="btn btn-primary">홈으로</button>
		<div style="display: inline-flex; margin-left: 54%;">
			<button style="margin-right: 2px;" onclick="location='./update?num=${dto.num}'" class="btn btn-primary">수정하기</button>
			<button onclick="location='./delete?num=${dto.num}'" id="deleteBtn" class="btn btn-danger">삭제하기</button>
			<!-- <button class="btn btn-danger" id="deleteBtn">asda</button> -->
		</div>
	</section>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"
	></script>
	<c:import url="../template/footerHTML.jsp"></c:import>
</body>

</html>