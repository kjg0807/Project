<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>정보 수정</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
				crossorigin="anonymous">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
				crossorigin="anonymous"></script>

			<!-- jquery -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		</head>
		<style>
			.emcs {
				display: flex;
				input: read-only;
				background-color: #dedede;
			}

			/* read-only style */
			select {
				padding: 7px;
				vertical-align: middle
			}
		</style>

		<body>
			<c:import url="../../template/headerHTML.jsp"></c:import>

			<form action="../member/update" method="post" id="frm">
				<br>
				<h1 style="text-align: center;">정보 수정</h1>
				<section class="col-lg-6 container-fluid mt-4">
					<div class="row">
						<!-- id -->
						<div class="mb-3">
							<!-- <label class="form-label">아이디</label> -->
							<p><b>아이디: ${dto.userID}</b></p>
							<input type="hidden" class="form-control" name="userID" id="id" value="${dto.userID}">
							<!-- id를 입력하고 나왔을 때 2글자 미만이면 메세지 출력 : id는 2글자 이상 -->
							<div id="idText" style="display: none; color: red;">ID는 2글자 이상 입력해야 합니다.</div>
						</div>
						<!-- password 1 -->
						<div class="mb-3">
							<label class="form-label">비밀번호</label>
							<input type="text" class="form-control" name="pwd" id="pwd" value="${dto.pwd}">
							<!-- pwd를 입력할 때마다 (1글자씩) 메세지를 출력 : pwd - 최소 6글자 이상 -->
							<div id="pwdText" style="display: none; color: red;">PWD는 6글자 이상 입력해야 합니다.</div>
						</div>
						<!-- password 2 -->
						<div class="mb-3">
							<label class="form-label">비밀번호 확인</label>
							<!-- name="pwd"-->
							<input type="password" class="form-control" id="pwd2" value="${dto.pwd}">
							<!-- pwd를 입력하고 나왔을 때 첫번째 pwd와 값 비교 후 메세지 출력 : 같다, 다르다 -->
							<div id="pwdText2" style="display: none; color: red;">PWD가 일치하지 않습니다.</div>
						</div>
						<!-- name -->
						<div class="mb-3">
							<label class="form-label">닉네임</label>
							<input type="text" class="form-control" name="userName" id="name" value="${dto.userName}">
							<!-- 입력 후 최소 1글자 이상 -->
							<div id="nameText" style="display: none; color: red;">최소 1글자를 입력하세요.</div>
						</div>
						<!-- email -->
						<div class="mb-7">
							<label class="form-label" required>이메일</label>
							<div class="emcs">
								<!-- 이메일 @뒤 내용 스크롤 만들기 -->
								<!-- style="width: 46%; padding: 5px; border: 1px solid #dedede" -->
								<input type="hidden" name="email" id="email" value="${dto.email}">
								<input style="width: 37%; padding: 5px; border: 1px solid #dedede" name="emaill"
									id="emaill" type="text">
								<input style="width: 37%; padding: 5px; border: 1px solid #dedede" name="email2"
									id="email2" type="text" placeholder="빈칸일시 수정되지 않음" onfocus="this.placeholder=''"
									onblur="this.placeholder='빈칸일시 수정되지 않음'">
								<br>
								<select style="width: 27%; justify-content: right;" name="select_email" id="emses"
									class="kind">
									<option class="kinds" value="">직접입력</option>
									<option class="kinds" value="@naver.com">naver.com</option>
									<option class="kinds" value="@gmail.com">gmail.com</option>
									<option class="kinds" value="@daum.com">daum.com</option>
								</select>
							</div>
							<br>
							<!-- 입력 후 최소 1글자 이상 -->
							<div id="emailText11" style="display: none; color: red;">이메일 형식에 맞게 입력하세요.</div>
							<div id="emailText" style="display: none; color: red;">최소 1글자를 입력하세요.</div>
						</div>
						<!-- phone -->
						<br> <br> <br>
						<div class="mb-3">
							<label class="form-label">전화번호</label>
							<input type="text" class="form-control" name="phone" id="phone" value="${dto.phone}">
							<!-- 입력 후 최소 1글자 이상 -->
							<div id="phoneText" style="display: none; color: red;">최소 1글자를 입력하세요.</div>
							<div id="phoneText1" style="display: none; color: red;">휴대전화 번호 형식에 맞지 않습니다.</div>
							<div id="phoneText2" style="display: none; color: red;">숫자를 입력하세요.</div>
						</div>
						<!-- 나이 -->
						<div class="mb-3">
							<label class="form-label">나이</label>
							<input type="text" class="form-control" name="age" id="age" value="${dto.age}">
							<!-- 입력 후 최소 1글자 이상 -->
							<div id="ageText" style="display: none; color: red;">최소 1글자를 입력하세요.</div>
							<div id="ageText1" style="display: none; color: red;">0보다 큰 숫자를 입력하세요.</div>
							<div id="ageText2" style="display: none; color: red;">숫자를 입력하세요.</div>
							<div id="ageText3" style="display: none; color: red;">2자리 이하만 입력 가능합니다.</div>
						</div>
						<!-- 생년월일 -->
						<div class="mb-3">
							<label class="form-label">생년월일</label>
							<input type="text" class="form-control" name="birth" id="birth" value="${dto.birth}">
							<div id="birthText" style="display: none; color: red;">6자를 입력하세요</div>
							<div id="birthText1" style="display: none; color: red;">6자를 입력하세요</div>
							<div id="birthText2" style="display: none; color: red;">숫자를 입력하세요.</div>
						</div>
						<!-- 성별 -->
						<div class="mb-3">
							<label class="form-label">성별</label>
							<input type="text" class="form-control" name="gender" id="gender" value="${dto.gender}">
							<!-- 입력 후 최소 1글자 이상 -->
							<div id="genderText" style="display: none; color: red;">최소 1글자를 입력하세요.</div>
							<div id="genderText1" style="display: none; color: red;">형식에 맞게 입력하세요.</div>
							<div id="genderText2" style="display: none; color: red;">1 또는 2만 입력 가능합니다.</div>
							<div id="genderText3" style="display: none; color: red;">숫자를 입력하세요.</div>
						</div>
						<div>
							<button type="button" id="btn" class="btn btn-primary">정보 수정</button>
							<button type="reset" class="btn btn-primary">초기화</button>
						</div>
					</div>
				</section>
				<br> <br>
			</form>

			<c:import url="../../template/footerHTML.jsp"></c:import>
			<script src="/resources/kjk/js/update.js"></script>
		</body>

		</html>