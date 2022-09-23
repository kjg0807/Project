<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/styles.css">
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/test.js"></script> --%>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="../">Home</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"
			>
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item"><a class="nav-link" href="#!">About</a></li>

					<li class="nav-item"><a class="nac-link" href="../shop/listHTML">가게 목록</a></li>
					
					<li class="nav-item"><a class="nav-link" href="../shop/add">가게 정보 추가</a></li>
					<li class="nav-item"><a class="nav-link" href="../category/list">카테고리 목록</a></li>
					
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
						aria-expanded="false">Shop</a>
				</ul>
				<form class="d-flex" action="../member/login">
					<button class="btn btn-outline-dark" type="submit">
						<!-- <i class="bi-cart-fill me-1"></i> -->
						Login
						<!-- <span class="badge bg-dark text-white ms-1 rounded-pill">0</span> -->
					</button>
				</form>
			</div>
		</div>
	</nav>
	<!--  menu bar -->

</body>
</html>