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
	<form action="./adpage" method="post">
		<%
		try
		{
		%>
		<c:if test="${dto.classDTOs.get(0).className eq 'admin'}">
			<td style="color: red;">Class</td>
		</c:if>
		<section class="container-fluid col-lg-6">
			<div class="row mt-3">
				<table class="table table-hover">
					<h2>전체 회원 정보</h2>
					<tr>
						<td>ID</td>
						<td>Name</td>
						<td>PWD</td>
						<td>Email</td>
						<td>Age</td>
						<td>Birth</td>
						<td>Phone</td>
						<td>Gender</td>
					</tr>
					<tr>
						<td>${dto.userid}</td>
						<td>${dto.username}</td>
						<td>${dto.pwd}</td>
						<td>${dto.email}</td>
						<td>${dto.age}</td>
						<td>${dto.birth}</td>
						<td>${dto.phone}</td>
						<td>${dto.gender}</td>
					</tr>
				</table>
			</div>
		</section>
		<%
		} catch (Exception e)
		{

		}
		%>
		<c:catch></c:catch>
	</form>
	<c:import url="../template/footerHTML.jsp"></c:import>
</body>
</html>