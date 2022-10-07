<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
	<section class="container-fluid col-lg-4">
	
	<div class="row">
		<form action="./add" method="post" enctype="multipart/form-data">
			  <input type="hidden" name="userName" value = "${member.userName}" class="form-control" >
			  <input type="hidden" name="userID" value = "${member.userID}" class="form-control">
			  <input type="hidden" name="shopNum" value = "${partyListDTO.shopNum}" class="form-control">
			  	
			<div class="mb-3">
			  <label for="title" class="form-label">Title</label>
			  <input type="text" name="partyTitle" class="form-control" id="title" placeholder="제목 입력">
			</div>
			<div class="mb-3">
			  <label for="contents" class="form-label">Contents</label>
			  <textarea class="form-control" name="partyContents" id="contents" rows="3"></textarea>
			</div>

			<div id="addFiles">
				<button type="button" class="btn btn-danger" id="fileAdd">파일 추가</button>
			</div>

			
			<div class="mb-3">
				<button class="btn btn-success">WRITE</button>
			</div>
			
		</form>	
	</div>
</section>
    <script src="/resources/js/party_files.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>