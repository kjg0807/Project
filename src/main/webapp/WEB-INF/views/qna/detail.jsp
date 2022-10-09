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
</style>
<body>
	<section class="container-fluid col-lg-6 mt-5">

		<h1>Q&A Detail Page</h1>

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
					<td>${dto.num}</td>
					<td>${dto.title}</td>
					<td>${dto.writer}</td>
					<td id="context">
						<textarea style="border:none" name="" id="" cols="50" style="height: 200px;" rows="10" disabled>${dto.contents}</textarea>
					</td>
					<td>${dto.regDate}</td>
					<td>${dto.hit}</td>
				</tr>
			</tbody>
		</table>


		<!-- <a href="./list">리스트</a> <a href="./update?num=${dto.num}">수정</a>
		<a href="./delete?num=${dto.num}">삭제</a> 
		<a href="./reply?num=${qnaDTO.num}" class="btn btn-default" role="button">답글입력</a> -->

		<button onclick="'./list'">목록</button>
		<button onclick="location='./update?num=${dto.num}'" class="btn btn-primary">수정</button>
		<button onclick="location='./delete?num=${dto.num}'" class="btn btn-primary">삭제</button>
		<br>
		<br>
		<button onclick="location='./reply?num=${qnaDTO.num}'" class="btn btn-secondary btn-sm">답글 달기</button>


	</section>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"
	></script>
	<c:import url="../template/footerHTML.jsp"></c:import>
</body>
</html>