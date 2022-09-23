<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
		 crossorigin="anonymous">
</head>
<body>

<section class="container-fluid col-lg-6 mt-5">
	<div class="row mt-5 bg-light">
		<h1>리뷰 detail 페이지</h1>
	</div>
	
	<div class="row border border-danger mt-5 bg-light" style="height: 75px">
			<div class="col-lg-2 border border-danger">
				글번호 : ${dto.reviewNum}
			</div>
			<div class="col-lg-4 border border-danger">
				닉네임 : ${dto.userId}
			</div>
			<div class="col-lg-6 border border-danger">
				제목 : ${dto.title}
			</div>
			<div class="col-lg-4 border border-danger">
				작성날짜 : ${dto.reviewDate}
			</div>
			<div class="col-lg-2 border border-danger">
				조회수 : ${dto.hits}
			</div>
				<div class="row border border-top-0 border-danger bg-light"  style="min-height: 60vh" >
					<div class="border border-danger">
						내용 : ${dto.contents}
					</div>
				</div>
		</div>
		
		<div class="row border border-top-0 border-danger bg-light"  style="min-height: 60vh" >
			<div class="col">
				<c:forEach items="${reviewsDTO.reviewsFilesDTOs}" var="fileDTO">
					<a href="../resources/upload/reviews/${filesDTO.fileName}">${filesDTO.oriName}</a>
				</c:forEach>
			</div>
		</div>
		
		
<%-- 	<table border="1" class="table table-striped table-hover">
		<thead>
			<tr>
				<th>리뷰글 번호</th>
				<th>닉네임</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		
		<tbody>
				<tr>
					<td>${requestScope.dto.getReviewNum()}</td>
					<td>${requestScope.dto.userId}</td>
					<td>${requestScope.dto.title}</td>
					<td>${requestScope.dto.contents}</td>
					<td>${requestScope.dto.reviewDate}</td>
					<td>${requestScope.dto.hits}</td>
					
				
				</tr>

		</tbody>
	</table> --%>

<a href="./list">목록</a>
<a href="./update?reviewNum=${dto.reviewNum}">수정</a>
<a href="./delete?reviewNum=${dto.reviewNum}">삭제</a>
<div  style="display: inline-block; margin: 0 5px;  float: right;">
	<button onclick="location='/'" class="btn btn-primary">홈으로</button>
</div>
		</section>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
    			 integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" 
    			 crossorigin="anonymous"></script>
	

</body>
</html>