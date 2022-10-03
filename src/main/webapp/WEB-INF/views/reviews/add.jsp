<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- summernote JQUERY -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<!-- summernote bootstrap -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
 
<!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
<c:import url="../template/headerHTML.jsp"></c:import>
<section class="container-fluid col-lg-6 mt-5">

	<h1>리뷰 글쓰기 페이지</h1>
	

	<form action="./add" method="post" enctype="multipart/form-data">
	
		<div class="mb-3">
		  <label for="formGroupExampleInput" class="form-label">제목</label>
		  <input type="text" class="form-control" name="title" placeholder="제목 : ${dto.title}">
		</div>
		
		<div class="mb-3">
		  <label for="formGroupExampleInput2" class="form-label">글내용</label>
		  <textarea class="form-control" name="contents" id="contents" rows="5" placeholder="내용: ${dto.contents}"></textarea>
		</div>
		
		<br>
		<br>
		<br>
		
		<div id="fileAdd" class="mb-3">
			<button id="addFiles" type="button" class="btn btn-secondary">파일추가</button>
		</div>

		<div style="display: inline-block; margin: 0 5px;  float: right;">
			<button type="submit" class="btn btn-success">글쓰기</button>
		</div>
		
	</form>
	
<a href="./list">리스트</a>
<a href="./update?reviewNum=${dto.reviewNum}">수정</a>
<a href="./delete?reviewNum=${dto.reviewNum}">삭제</a>
<div>
<button onclick="location='/'" class="btn btn-primary">홈으로</button>	
</div>

</section>
<c:import url="../template/footerHTML.jsp"></c:import>
<!-- 부트스트랩 -->
<!-- 부트스트랩 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script type="text/javascript">
	$("#contents").summernote();
</script>
<script src="../../../resources/hjs/js/reviewsFile.js"></script>			 
</body>
</html>