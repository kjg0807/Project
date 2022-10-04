<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
		 crossorigin="anonymous">
<!-- <link rel="stylesheet" href="../../../resources/css/reviewsComment.css">  -->
<link rel="stylesheet" href="../../../resources/hjs/css/imageModal.css">
<link rel="stylesheet" href="../../../resources/hjs/css/reviewsButton.css">
</head>
<body>

<section class="container-fluid col-lg-6 mt-5">
	<div class="row mt-5 bg-light">
		<h1>리뷰 detail 페이지</h1>
	</div>
	
<%-- 	<div class="row border border-danger mt-5 bg-light" style="height: 75px">
			<div class="col-lg-2 border border-danger">
				글번호 : ${dto.reviewNum}
			</div>
			<div class="col-lg-4 border border-danger">
				닉네임 : ${dto.userId}
			</div>
			<div class="col-lg-6 border border-danger">
				제목 : ${dto.title}
			</div>
			<div class="col-lg-4 border border-danger">
				작성날짜 : ${dto.reviewDate}
			</div>
			<div class="col-lg-2 border border-danger">
				조회수 : ${dto.hits}
			</div>
				<div class="row border border-top-0 border-danger bg-light"  style="min-height: 60vh" >
					<div class="col">
						내용 : ${dto.contents}
					</div>
				</div>
		</div> --%>
<%-- 		<div class="row g-3">
			  <div class="col-sm">
			    <input type="text" class="form-control" placeholder="글 번호 : ${dto.reviewNum}">
			  </div>
			  <div class="col-sm">
			    <input type="text" class="form-control" placeholder="닉네임 : ${dto.userId}">
			  </div>
			  <div class="col-sm">
			    <input type="text" class="form-control" placeholder="제목 : ${dto.title}">
			  </div>
			  <div class="col-sm">
			    <input type="text" class="form-control" placeholder="내용 : ${dto.contents}">
			  </div>
			  <div class="col-sm">
			    <input type="text" class="form-control" placeholder="작성 날짜 : ${dto.reviewDate}">
			  </div>
		</div> --%>
		
		<table border="1" class="table table-striped col-lg-16">
			<thead class="table-info">
				<tr>
					<th>글번호</th>
					<th>닉네임</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성날짜</th>
					<th>이미지</th>
				</tr>
			</thead>
			
			<tbody>
					<tr>
						<td>${dto.reviewNum}</td>
						<td>${dto.userId}</td>
						<td>${dto.title}</td>
						<td>${dto.contents}</td>
						<td>${dto.reviewDate}</td>
				
						
						<td>
							<div class="modal_1" id="modal_1">
								<c:forEach items="${dto.reviewsFilesDTOs}" var="reviewsFileDTO">
									<!-- <a href="../resources/upload/reviews/${reviewsFileDTO.fileName}">${fileDTO.oriName}</a> -->
									<!-- <div class="modal-dialog modal-lg">22</div> -->
										 <!-- <a href="../resources/upload/reviews/${reviewsFileDTO.fileName}" id="cat">${reviewsFileDTO.oriName}</a>  -->
									
										<img src="../resources/upload/reviews/${reviewsFileDTO.fileName}" width="100px" height="100px" id="cat2" class="img">
										
								
								
								
									</c:forEach> 
										<!--부트스트랩 모달-->
										<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
				
												<div class="modal-content" id="modal_size">
													<div class="modal-header">
														<!-- <h5 class="modal-title" id="exampleModalLabel">Modal title</h5> -->
														<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
																
													<div class="modal-body">
														<img src="" class="img" id="c1">		
														<!-- <img class="img" src="../resources/upload/reviews/">													 -->
													</div>
															
												</div>
											</div>
										</div>
								<!-- Modal -->
										<!--모달에 뜨는 닫기창-->
										<span class="close">&times;</span>	
										<img class="modeal_contents" id="rvimg">
									
								</td>
								<!-- 부트스트랩 모달 버튼-->
								<button type="button" id="modalExecute" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
									Launch demo modal
								</button>

							</div>
						
					</tr>
					
			</tbody>
		</table>
		
	<%-- 	<div class="row border border-top-0 border-danger bg-light"  style="min-height: 60vh" >
		
				<c:forEach items="${reviewsDTO.reviewsFilesDTOs}" var="fileDTO">
					<a href="../resources/upload/${reviews}/${filesDTO.fileName}">${filesDTO.oriName}</a>
				</c:forEach>
			
		</div> --%>
		
		
		
		
<%-- 	<table border="1" class="table table-striped table-hover">
		<thead>
			<tr>
				<th>리뷰글 번호</th>
				<th>닉네임</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		
		<tbody>
				<tr>
					<td>${requestScope.dto.getReviewNum()}</td>
					<td>${requestScope.dto.userId}</td>
					<td>${requestScope.dto.title}</td>
					<td>${requestScope.dto.contents}</td>
					<td>${requestScope.dto.reviewDate}</td>
					<td>${requestScope.dto.hits}</td>
					
				
				</tr>

		</tbody>
	</table> --%>
	
	<!-- 댓글 코드 시작 -->
	<div class="row">
		<div class="mb-3">
			<label for="writer" class="form-label">작성자</label>
			<input type="text" class="form-label" id="writer" placeholder="작성자 :">
		</div>
		
		<div class="mb-3">
			<label for="contents" class="form-label">내 용</label>
			<textarea id="contents" class="form-label" rows="3" cols="50" placeholder="내 용 :"></textarea>
			<!-- <input type="text" class="form-label" id="contents" placeholder="내용 :"> -->
		</div>
		
		<div class="mb-3">
			<button type="button" id="btn" data-reviewNum="${dto.reviewNum}">댓글 작성</button>
		</div>
	</div>
	
	
	<!-- 댓글 리스트 출력 -->
	<div>
		<table id="reviewsCommentList" class="table table-striped col-lg-26">
			<thead class="table-info">
				<tr>
					<th>작성자</th>
					<th>내용</th>
					<th>작성날짜</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
		</table>

			<button id="plus" class="btn btn-secondary disabled">더보기</button>

			<button id="minus" class="btn btn-success disabled">닫기</button>

	</div>
	<!-- 댓글 끝 -->
	<!----- 모달 ------>
   <div>
		<button type="button" style="display: none;" id="up" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2" data-bs-whatever="@getbootstrap">바튼</button>

		<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">수정하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<input type="hidden" id="num">
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">작성자</label>
							<input type="text" class="form-control" id="updateWriter" value="${dto.writer}">
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">내용</label>
							<textarea class="form-control" id="updateContents">value="${dto.contents}"</textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
					<button type="button" id="update" data-bs-dismiss="modal" class="btn btn-primary">수정하기</button>
				</div>
				</div>
			</div>
		</div>
   </div>

<!-- <a href="./list">목록</a>
<a href="./update?reviewNum=${dto.reviewNum}">수정</a> -->
<a href="./delete?reviewNum=${dto.reviewNum}">삭제</a>
<br>
<br>
<br>
<br>
<br>
<p>
	<button onclick="location='./list'" class="btn btn-primary">목록으로</button>
	<button onclick="location='./update?reviewNum=${dto.reviewNum}'" class="btn btn-primary">수정하기</button>
	<button onclick="location='./delete?reviewNum=${dto.reviewNum}'" class="btn btn-primary">삭제</button>	 
</p>
<div  style="display: inline-block; margin: 0 5px;  float: right;">
	<button onclick="location='/'" class="btn btn-primary">홈으로</button>
</div>
		</section>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
    			 integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" 
    			 crossorigin="anonymous"></script>
				 
	
<script src="../../../resources/hjs/js/ReviewsComment.js"></script>
</body>
</html>