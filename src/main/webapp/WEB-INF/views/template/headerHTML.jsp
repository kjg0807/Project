<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../../../resources/kdy/css/styles.css">
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/test.js"></script> --%>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container px-4 px-lg-5">
			<img src="../../../resources/kdy/images/realLodo.jpg" style="width: 89px; height: 50px; margin: 0px 90px 0px 0px;" href="../../" alt="">
			<a class="navbar-brand" href="../../">Home</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"
			>
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
						aria-expanded="false"
					>Shop</a>
					<li class="nav-item"><a class="nav-link" href="/notice/list">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="/qna/list">Q&A</a></li>
					<!-- <li class="nav-item"><a class="nav-link" href="./../kdy/shop/detailHTML">리뷰</a></li> -->
				</ul>
				<!-- login -->
				<!-- 로그인 한 등급이 admin이면 실행 -->
				<ul class="navbar-nav mb-2 mb-lg-0 ms-lg-4">
					<c:choose>
						<c:when test="${member != null }">
							<%
							try
							{
							%>
							<c:choose>
								<c:when test="${member.classDTOs.get(0).className eq 'admin'}">
									<li class="nav-item"><b><a class="nav-link" href="#"> 관리자님 안녕하세요 </a></b></li>
								</c:when>
								<c:otherwise>
									<li class="nav-item"><b><a class="nav-link" href="#">'${member.userName}'님안녕하세요!</a></b></li>
								</c:otherwise>
							</c:choose>
							<%
							} catch (Exception e)
							{

							}
							%>
							<c:catch></c:catch>
							<%
							try
							{
							%>
							<%-- <c:if test="${member.classDTOs.get(0).className eq 'admin'}">
								<button class="btn btn-outline-dark" onclick="location.href='/kjk/member/adpage';" type="submit" style="width: auto; margin-left: 3px">관리자
									페이지</button>
							</c:if> --%>
							<c:choose>
								<c:when test="${member.classDTOs.get(0).className eq 'admin'}">
									<button class="btn btn-outline-dark" onclick="location.href='/kjk/member/adpage';" type="submit" style="width: auto; margin-left: 3px">관리자
										페이지</button>
								</c:when>
								<c:otherwise>
									<button class="btn btn-outline-dark" onclick="location.href='/kjk/member/mypage';" type="submit" style="width: auto; margin-left: 3px">내
										정보</button>
								</c:otherwise>
							</c:choose>
							<%
							} catch (Exception e)
							{

							}
							%>
							<!-- <button class="btn btn-outline-dark" onclick="location.href='/kjk/member/mypage';" type="submit" style="width: auto; margin-left: 3px">내
								정보</button> -->
							<button class="btn btn-outline-dark" onclick="location.href='/kjk/member/logout';" type="submit" style="width: auto; margin-left: 3px">
								로그아웃</button>
						</c:when>
						<c:otherwise>
							<button class="btn btn-outline-dark" onclick="location.href='/kjk/member/login';" type="submit" style="width: auto; margin-left: 3px;">
								로그인</button>
							<button class="btn btn-outline-dark" onclick="location.href='/kjk/member/join';" type="submit" style="width: auto; margin-left: 3px">회원
								가입</button>
						</c:otherwise>
					</c:choose>
				</ul>
				<!-- login -->
			</div>
		</div>
	</nav>
	<!--  menu bar -->

</body>
</html>