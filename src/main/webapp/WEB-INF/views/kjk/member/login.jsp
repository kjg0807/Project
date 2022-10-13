<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"
>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"
></script>
</head>
<style>
.log {
	width: 120px;
	border-radius: 5px;
}
</style>

<body>
	<c:import url="../../template/headerHTML.jsp"></c:import>

	<form action="../member/login" method="post">
		<br>
		<h1 style="text-align: center;">로그인</h1>
		<section class="col-lg-6 container-fluid mt-4">
			<div class="row">
				<div class="mb-3">
					<label>아이디</label>
					<input type="text" id="userID" class="form-control" name="userID" placeholder="ID Input" onfocus="this.placeholder=''"
						onblur="this.placeholder='ID Input'" autocomplete="off"
					>
					<div>We'll never share your ID with anyone else.</div>
				</div>
				<div class="mb-3">
					<label>비밀번호</label>
					<input type="password" id="pwd" class="form-control" name="pwd" placeholder="Password Input" onfocus="this.placeholder=''"
						onblur="this.placeholder='Password Input'" autocomplete="off"
					>
				</div>
				<div class="mb-3">
					<button type="submit" class="btn btn-primary log">로그인</button>
				</div>
			</div>
		</section>
	</form>

	<c:import url="../../template/footerHTML.jsp"></c:import>
</body>

</html>