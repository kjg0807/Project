<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../template/headerHTML.jsp"></c:import>
	<form action="./mypage" method="post">
		<section class="container-fluid col-lg-6">
			<div class="row mt-3">
				<table class="table table-hover">
					<tr>
						<td>ID</td>
						<td>Name</td>
						<td>Email</td>
						<td>Phone</td>
						<td style="color: red;">Class</td>
					</tr>
					<tr>
						<td>${dto.userid }</td>
						<td>${dto.username }</td>
						<td>${dto.email }</td>
						<td>${dto.phone }</td>
						<td style="color: red;">${dto.classDTOs["0"].className}</td>
					</tr>
				</table>
			</div>
		</section>
	</form>
	<c:import url="../template/footerHTML.jsp"></c:import>
</body>
</html>