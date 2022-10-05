<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
				crossorigin="anonymous">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
				crossorigin="anonymous"></script>
			<link rel="stylesheet" href="/resources/kjk/css/footerHold.css">
			<link rel="stylesheet" href="/resources/kjk/css/mypageReview.css">
		</head>
		<style>
			a {
				text-decoration: none;
				color: black;
			}

			a:hover {
				color: red;
			}

			.ppa {
				font-size: 15px;
				color: gray;
			}

			.imgali {
				margin-bottom: 5%;
			}
			.divtitle{
				margin-bottom: 1%;
			}
		</style>

		<body>
			<c:import url="../../template/headerHTML.jsp"></c:import>
			<form action="../member/mypage" method="post">
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
									<td>
										<a href="./update?userid=${dto.userID}">수정</a> <a
											href="./delete?userid=${dto.userID}">삭제</a>
									</td>
								</tr>
							</table>
							<div style="padding-top: 5%;">
								<b>내가 쓴 리뷰</b>
							</div>
							<hr>
							<ul class="list_newsissue">
								<li class="libi">
									<div class="item_issue" data-tiara-layer="headline1">
										<div class="imgali">
											<a href="#" class="wrap_thumb" data-tiara-layer="article_main"
												data-tiara-id="20221004153603915" data-tiara-type="harmony"
												data-tiara-ordnum="1"
												data-tiara-custom="contentUniqueKey=hamny-20221004153603915&amp;clusterId=5150091,5590543,5599922,1691287,191589&amp;clusterTitle=사회,[언론사픽] 주요뉴스,[품질검수] 뉴스 필터링,경기도 양평군,윤석열&amp;keywordType=NONE,NONE,NONE,NONE,NONE">
												<img src="" class="thumb_g" alt="" 경찰="" '양평="" 공흥지구'="" 수사="" 1년..尹=""
													장모="" 조사는="" 아직"="">
											</a>
										</div>
										<div class="cont_thumb divtitle">
											<strong class="tit_g">
												<a href="#" class="link_txt" data-tiara-layer="article_main"
													data-tiara-id="20221004153603915" data-tiara-type="harmony"
													data-tiara-ordnum="1"
													data-tiara-custom="contentUniqueKey=hamny-20221004153603915&amp;clusterId=5150091,5590543,5599922,1691287,191589&amp;clusterTitle=사회,[언론사픽] 주요뉴스,[품질검수] 뉴스 필터링,경기도 양평군,윤석열&amp;keywordType=NONE,NONE,NONE,NONE,NONE">
													으에에에에ㅔ에에에에에에ㅔㅔ 내용은 아직
												</a>
												<p class="ppa">으에에에에ㅔ에에에에에에ㅔㅔ</p>
											</strong>
										</div>
									</div>
								</li>
							</ul>
							<hr>
						</div>
					</div>
				</section>
			</form>
			<c:import url="../../template/footerHTML.jsp"></c:import>
		</body>

		</html>