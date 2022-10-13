<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
<link rel="stylesheet" href="/resources/kjk/css/mypageReview.css">
</head>
<style>
/* a {
	text-decoration: none;
	color: black;
}

a:hover {
	color: red;
} */
#up {
	text-decoration: none;
	color: black;
}

#up:hover {
	color: red;
}

.ppa {
	font-size: 15px;
	color: gray;
}

.imgali {
	margin-bottom: 5%;
}

.divtitle {
	margin-bottom: 1%;
}

#cont {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	max-width: 200px;
}
</style>

<body>
	<c:import url="../../template/headerHTML.jsp"></c:import>
	<form action="../member/mypage">
		<!--  action="../member/mypage" -->
		<section class="container-fluid col-lg-10">
			<div id="body-wrapper">
				<div class="row mt-3" id="body-content">
					<table class="table table-hover">
						<tr>
							<td>아이디</td>
							<td>닉네임</td>
							<td>이메일</td>
							<td>전화번호</td>
							<td>메뉴</td>
						</tr>
						<tr>
							<td>${dto.userID }</td>
							<td>${dto.userName }</td>
							<td>${dto.email }</td>
							<td>${dto.phone }</td>
							<td id="upDe">
								<a id="up" href="./update?userid=${dto.userID}">정보 수정</a> | <a id="up" href="./delete?userid=${dto.userID}">회원 탈퇴</a>
							</td>
						</tr>
					</table>
					<input type="hidden" value="${dto.userID}" id="dtoID">
					<input type="hidden" value="${reList[0].userID}" id="revID">
					<!-- onclick="buttonClick();" -->
					<button type="button" class="btn btn-outline-dark" id="reviewButton">내가 작성한 리뷰 보기</button>
					<div id="myReview" style="display: none;">
						<div style="padding-top: 5%;">
							<b>${dto.userName}님이 작성한 리뷰</b>
						</div>
						<%-- 내가 작성한 리뷰, 댓글 출력후 클릭시 작성한 곳으로 이동 --%>
						<%-- title; writer; contents; reviewDate; hits; --%>
						<!-- <form method="post" action="/kdy/shop/datailHTML"> -->
						<c:forEach items="${reList}" var="reList">
							<c:choose>
								<c:when test="${dto.userID ne 'reList.userID'}">
									<ul class="list_newsissue">
										<li class="libi">
											<div class="item_issue" data-tiara-layer="headline1">
												<div class="cont_thumb divtitle" id="ddiv" style="cursor: pointer;"
													onclick="location.href='/shop/detailHTML?shopNum=${pageScope.reList.shopNum }';"
												>
													<section class="container-fluid col-lg-6">
														<table class="table table-hover">
															<tr>
																<th>제목</th>
																<th>내용</th>
															</tr>
															<tr>
																<td>${reList.title }</td>
																<td id="cont">${reList.contents }</td>
															</tr>
														</table>
													</section>
												</div>
											</div>
										</li>
									</ul>
								</c:when>
								<c:otherwise>

								</c:otherwise>
							</c:choose>
						</c:forEach>
						<!-- </form> -->
					</div>
				</div>
			</div>
		</section>
	</form>
	<!-- title; writer; contents; reviewDate; hits; -->
	<c:import url="../../template/footerHTML.jsp"></c:import>
	<script src="/resources/kjk/js/mypageReview.js"></script>
</body>

</html>