<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Sign Up</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
				crossorigin="anonymous">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
				crossorigin="anonymous"></script>
		</head>

		<body>

			<c:import url="../template/headerHTML.jsp"></c:import>

			<form action="./join" method="post" enctype="multipart/form-data" id="frm">
				<br>
				<h1>Join Page</h1>
				<section class="col-lg-6 container-fluid mt-4">
					<div class="row">
						<!-- id -->
						<div class="mb-3">
							<label class="form-label">ID</label> <input type="text" class="form-control" name="userid"
								aria-describedby="emailHelp" id="id" placeholder="ID Input"
								onfocus="this.placeholder=''" onblur="this.placeholder='ID Input'">
							<!-- id를 입력하고 나왔을 때 2글자 미만이면 메세지 출력 : id는 2글자 이상 -->
							<div id="idText" style="display: none; color: red;">ID는 2글자 이상 입력해야 합니다.</div>
						</div>
						<!-- password 1 -->
						<div class="mb-3">
							<label class="form-label">Password</label> <input type="password" class="form-control"
								name="pwd" placeholder="Password Input" id="pwd" onfocus="this.placeholder=''"
								onblur="this.placeholder='Password Input'">
							<!-- pwd를 입력할 때마다 (1글자씩) 메세지를 출력 : pwd - 최소 6글자 이상 -->
							<div id="pwdText" style="display: none; color: red;">PWD는 6글자 이상 입력해야 합니다.</div>
						</div>
						<!-- password 2 -->
						<div class="mb-3">
							<label class="form-label">Password</label>
							<!-- name="pwd"-->
							<input type="password" class="form-control" placeholder="Password Input" id="pwd2"
								onfocus="this.placeholder=''" onblur="this.placeholder='Password Input'">
							<!-- pwd를 입력하고 나왔을 때 첫번째 pwd와 값 비교 후 메세지 출력 : 같다, 다르다 -->
							<div id="pwdText2" style="display: none; color: red;">PWD가 일치하지 않습니다.</div>
						</div>
						<!-- name -->
						<div class="mb-3">
							<label class="form-label">Name</label> <input type="text" class="form-control" name="name"
								aria-describedby="emailHelp" id="name" placeholder="Name Input"
								onfocus="this.placeholder=''" onblur="this.placeholder='Name Input'">
							<!-- 입력 후 최소 1글자 이상 -->
							<div id="nameText" style="display: none; color: red;">최소 1글자를 입력하세요.</div>
						</div>
						<!-- email -->
						<div class="mb-3">
							<label class="form-label">Email</label> <input type="email" required class="form-control"
								name="email" aria-describedby="emailHelp" id="email" placeholder="Eamil Input"
								onfocus="this.placeholder=''" onblur="this.placeholder='Eamil Input'">
							<!-- 입력 후 최소 1글자 이상 -->
							<div id="emailText11" style="display: none; color: red;">이메일 형식에 맞게 입력하세요.</div>
							<div id="emailText" style="display: none; color: red;">최소 1글자를 입력하세요.</div>
						</div>
						<!-- phone -->
						<div class="mb-3">
							<label class="form-label">Phone</label> <input type="text" class="form-control" name="phone"
								id="phone" placeholder="Phone Input" onfocus="this.placeholder=''"
								onblur="this.placeholder='Phone Input'">
							<!-- 입력 후 최소 1글자 이상 -->
							<div id="phoneText" style="display: none; color: red;">최소 1글자를 입력하세요.</div>
						</div>
						<!-- 나이 -->
						<div class="mb-3">
							<label class="form-label">Age</label> <input type="text" class="form-control" name="age"
								id="age" placeholder="Age Input" onfocus="this.placeholder=''"
								onblur="this.placeholder='Age Input'">
							<!-- 입력 후 최소 1글자 이상 -->
							<div id="ageText" style="display: none; color: red;">최소 1글자를 입력하세요.</div>
							<div id="ageText1" style="display: none; color: red;">0보다 큰 숫자를 입력하세요.</div>
							<div id="ageText2" style="display: none; color: red;">숫자를 입력하세요.</div>
							<div id="ageText3" style="display: none; color: red;">2자리만 입력 가능합니다.</div>
						</div>
						<!-- 생년월일 -->
						<div class="mb-3">
							<label class="form-label">birth</label> <input type="text" class="form-control" name="birth"
								id="birth" placeholder="birth Input - ex)990807" onfocus="this.placeholder=''"
								onblur="this.placeholder='birth Input - ex)990807'">
							<div id="birthText" style="display: none; color: red;">6자를 입력하세요</div>
							<div id="birthText1" style="display: none; color: red;">6자를 입력하세요</div>
							<div id="birthText2" style="display: none; color: red;">숫자를 입력하세요.</div>
						</div>
						<!-- 성별 -->
						<div class="mb-3">
							<label class="form-label">Gender</label> <input type="text" class="form-control"
								name="Gender" id="gender" placeholder="Gender Input - ex)1"
								onfocus="this.placeholder=''" onblur="this.placeholder='Gender Input - man: 1, women: 2'">
							<!-- 입력 후 최소 1글자 이상 -->
							<div id="genderText" style="display: none; color: red;">최소 1글자를 입력하세요.</div>
							<div id="genderText1" style="display: none; color: red;">남자는 1, 여자는 2를 입력하세요.</div>
							<div id="genderText2" style="display: none; color: red;">1글자만 입력 가능합니다.</div>
						</div>

						<!-- id, pwd, name, email, phone의 각 조건을 검사 후 조건이 맞을때만 회원가입 -->
						<div>
							<button type="button" id="btn" class="btn btn-primary">Sign Up</button>
							<button type="reset" class="btn btn-primary">Reset</button>
						</div>
					</div>
				</section>
			</form>

			<c:import url="../template/footerHTML.jsp"></c:import>
			<script src="/resources/js/join.js"></script>

		</body>

		</html>