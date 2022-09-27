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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"
></script>
<link rel="stylesheet" href="/resources/kjk/css/footerHold.css">
</head>

<body>
	<c:import url="../../template/headerHTML.jsp"></c:import>
	<form action="../member/mypage" method="post">
		<section class="container-fluid col-lg-6">
			<div id="body-wrapper">
				<div class="row mt-3" id="body-content">
					<table class="table table-hover">
						<tr>
							<td>아이디</td>
							<td>이름</td>
							<td>이메일</td>
							<td>전화번호</td>
							<td>메뉴</td>
						</tr>
						<tr>
							<td>${dto.userid }</td>
							<td>${dto.username }</td>
							<td>${dto.email }</td>
							<td>${dto.phone }</td>
							<td>
								<a class="abc" href="./update?userid=${dto.userid}">수정</a> <a class="abc" href="./delete?userid=${dto.userid}">삭제</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</section>
	</form>
	<c:import url="../../template/footerHTML.jsp"></c:import>
</body>

</html>