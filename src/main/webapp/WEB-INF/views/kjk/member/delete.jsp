<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>회원 정보 삭제</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
				crossorigin="anonymous">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
				crossorigin="anonymous"></script>
		</head>
		<!-- jquery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

		<link rel="stylesheet" href="/resources/kjk/css/footerHold.css">

		<body>
			<c:import url="../../template/headerHTML.jsp"></c:import>

			<form action="../member/delete" method="post" id="frm">
				<h1 style="text-align: center;">회원 탈퇴</h1>
				<section class="col-lg-6 container-fluid mt-4">
					<div id="body-wrapper">
						<div class="row" id="body-content">
							<input type="hidden" name="userid" value="${dto.userID}">
							<!-- 이름 입력 -->
							<div class="mb-3">
								<label class="form-label">이름</label>
								<input type="hidden" name="userName" id="user" value="${dto.userName}">
								<input type="text" class="form-control" name="username" id="username"
									placeholder="이름 입력" onfocus="this.placeholder=''" onblur="this.placeholder='이름 입력'">
								<div style="font-size: small;">
									<b>이름을 입력하세요.</b>
								</div>
								<div id="nameText" style="display: none; color:red">이름이 틀립니다.</div>
							</div>
							<!-- 비밀번호 입력 -->
							<div class="mb-3">
								<label class="form-label">비밀번호</label>
								<input type="hidden" name="pwd" id="pass" value="${dto.pwd}">
								<input type="text" class="form-control" name="pwdd" id="pwdd" placeholder="탈퇴하려면 비밀번호 입력"
									onfocus="this.placeholder=''" onblur="this.placeholder='탈퇴하려면 비밀번호 입력'">
								<div style="font-size: small;">
									<b>로그인할때 비밀번호를 입력하세요.</b>
								</div>
								<div id="pwdText" style="display: none; color: red;">비밀번호가 틀립니다.</div>
								<br>
								<button type="button" id="btn" class="btn btn-primary">회원 탈퇴</button>
							</div>
						</div>
					</div>

				</section>
			</form>

			<c:import url="../../template/footerHTML.jsp"></c:import>
			<script src="/resources/kjk/js/delete.js"></script>
		</body>

		</html>