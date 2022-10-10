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
</head>
<c:import url="../template/headerHTML.jsp"></c:import>
<style>
#conText {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	max-width: 200px;
}
</style>

<body>

	<section class="container-fluid col-lg-10 mt-5">

		<h1>공지사항 리스트</h1>
		<form action="../qna/list" class="row row-cols-lg-auto g-3 align-items-center">

			<div class="col-12">
				<label class="visually-hidden" for="kind">Kind</label>
				<select name="kind" class="form-select" id="kind">
					<option selected>선택하세요</option>
					<option class="kinds" value="contents">내용</option>
					<option class="kinds" value="title">제목</option>
					<option class="kinds" value="writer">글쓴이</option>
				</select>
			</div>

			<div class="col-12">
				<label class="visually-hidden" for="search">검색어</label>
				<div class="input-group">
					<input type="text" name="search" value="${param.search}" class="form-control" id="search">
				</div>
			</div>


			<div class="col-12">

				<button type="submit" class="btn btn-primary">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
						<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
					  </svg>
					검색
				</button>

			</div>

		</form>
		<div class="col-12">
			<table border="1" class="table table-hover">
				<thead class="table-dark">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>내용</th>
						<th>작성 날짜</th>
						<th>조회 수</th>
						<th>자세히 보기</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.list}" var="dto">

						<tr>
							<td>${pageScope.dto.num}</td>
							<td>
								${pageScope.dto.title}</a>
							</td>
							<td>${pageScope.dto.writer}</td>
							<td id="conText">${pageScope.dto.contents}</td>
							<td>${pageScope.dto.regDate}</td>
							<td>${pageScope.dto.hit}</td>
							<c:choose>
								<c:when test="${member == null}">
									<td>
										<button style="width: auto;" class="btn" id="detailList">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
												<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
												<path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
											</svg>
											자세히
										</button>
									</td>
								</c:when>
								<c:otherwise>
									<td>
										<button class="btn btn-outline-dark" onclick="location.href='./detail?num=${pageScope.dto.num}';" type="submit" style="width: auto;">
											<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
												<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
												<path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
											  </svg>
											자세히
										</button>
									</td>
								</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<button onclick="location='/'" class="btn btn-primary">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
				<path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
			</svg>
			홈으로
		</button>

		<c:choose>
			<c:when test="${member == null}">
				<div style="display: inline-block; margin: 0 5px; float: right;">
					<button id="addList" class="btn btn-primary">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
							<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
						</svg>
						글쓰기
					</button>
				</div>
			</c:when>
			<c:otherwise>
				<div style="display: inline-block; margin: 0 5px; float: right;">
					<button onclick="location='add'" class="btn btn-primary">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
							<path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
						</svg>
						글쓰기
					</button>
				</div>
			</c:otherwise>
		</c:choose>

		<div style="display: flex; margin: 5 5px; justify-content: center;">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<c:if test="${reviewsPager.pre}">
						<li class="page-item"><a class="page-link"
							href="./list?page=${reviewsPager.startNum-1}&kind=${reviewsPager.kind}&search=${reviewsPager.search}" aria-label="Previous"
						> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>

					<c:forEach begin="${reviewsPager.startNum}" end="${reviewsPager.lastNum}" var="i">
						<li class="page-item"><a class="page-link" href="./list?page=${i}&kind=${reviewsPager.kind}&search=${reviewsPager.search}">${i}</a></li>
					</c:forEach>
					<li class="page-item ${reviewsPager.next?'':'disabled'}"><a class="page-link"
						href="./list?page=${reviewsPager.lastNum+1}&kind=${reviewsPager.kind}&search=${reviewsPager.search}" aria-label="Next"
					> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>

	</section>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"
	></script>
	<c:import url="../template/footerHTML.jsp"></c:import>
	<script src="/resources/kjk/js/noticeList.js"></script>
	<script src="/resources/kjk/js/detailList.js"></script>
</body>

</html>