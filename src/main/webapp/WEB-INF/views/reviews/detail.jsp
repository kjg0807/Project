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
<c:import url="../template/headerHTML.jsp"></c:import>
<style>
	.img{
		cursor: pointer;
	}
</style>
<style>
	.update{
		cursor: pointer;
		width: 60px;
	}
</style>
<style>
	.delete{
		cursor: pointer;
		width: 60px;
	}
</style>
</head>
<body>

<section class="container-fluid col-lg-10 mt-5">
	<div class="row mt-5 bg-light">
		<h1>리뷰 detail 페이지</h1>
	</div>
	
<%-- 	<div class="row border border-danger mt-5 bg-light" style="height: 75px">
			<div class="col-lg-2 border border-danger">
				글번호 : ${dto.reviewNum}
			</div>
			<div class="col-lg-4 border border-danger">
				닉네임 : ${dto.userID}
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
						<td>${dto.userID}</td>
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
																      
													<div class="modal-body" id="mb">
														<img src="" class="img" id="c1">		
														<!-- <img class="img" src="../resources/upload/reviews/">													 -->
													</div>
															
												</div>
											</div>
										</div>
									</div>
								<!-- Modal -->
										<!--모달에 뜨는 닫기창-->
										<span class="close"></span>	
										<img class="modeal_contents" id="rvimg">
									
								</td>
								<!-- 부트스트랩 모달 버튼-->
								<button type="button" id="modalExecute" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
									Launch demo modal
								</button>

							
						
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
					<td>${requestScope.dto.userID}</td>
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
			<label for="userID" class="form-label">작성자</label>
			<input type="text" class="form-label" id="userID" placeholder="${dto.userID}" value="${dto.userID}" readonly disabled>
		</div>
		
		<div class="mb-3 col-lg-4">
			<label for="contents" class="form-label">내 용</label>
			<textarea id="contents" class="form-label" rows="3" cols="50" placeholder="내용을 입력하세요"></textarea>
			<!-- <input type="text" class="form-label" id="contents" placeholder="내용 :"> -->
		</div>
		
		<div class="mb-3">
			<button class="btn btn-secondary" type="button" id="btn" data-reviewNum="${dto.reviewNum}">댓글 작성</button>
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

			<div class="d-grid gap-2 col-6 mx-auto">
				<button id="plus" class="btn btn-primary">더보기</button>
		  	</div>
			<!-- <button id="plus" class="btn btn-primary">더보기</button> -->
			<br>
			<br>

			<div>
				<button id="minus" class="btn btn-success disabled" onclick="location.href='./detail?reviewNum=${dto.reviewNum}'">닫기</button>
			</div>

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
							<input type="text" class="form-control" id="updateWriter" value="${dto.userID}" readonly disabled>
						</div>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">내용</label>
							<textarea class="form-control" id="updateContents">value="${dto.contents}"</textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="update" data-bs-dismiss="modal" class="btn btn-primary">수정하기</button>
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
				</div>
			</div>
		</div>
   </div>

<!-- <a href="./list">목록</a>
<a href="./update?reviewNum=${dto.reviewNum}">수정</a> -->
<!-- <a href="./delete?reviewNum=${dto.reviewNum}">삭제</a> -->
<br>
<br>
<br>
<br>
<br>
<p>
	<div  style="display: inline-block; margin: 0 5px;">
		<button onclick="location='../shop/detailHTML?shopNum=${dto.shopNum}'" class="btn btn-primary">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-double-left" viewBox="0 0 16 16">
				<path fill-rule="evenodd" d="M8.354 1.646a.5.5 0 0 1 0 .708L2.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
				<path fill-rule="evenodd" d="M12.354 1.646a.5.5 0 0 1 0 .708L6.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
			</svg>
			뒤로가기
		</button>
	</div>

	<div  style="display: inline-block; margin: 0 5px;">
		<button onclick="location='./update?reviewNum=${dto.reviewNum}'" class="btn btn-primary">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-all" viewBox="0 0 16 16">
				<path d="M8.97 4.97a.75.75 0 0 1 1.07 1.05l-3.99 4.99a.75.75 0 0 1-1.08.02L2.324 8.384a.75.75 0 1 1 1.06-1.06l2.094 2.093L8.95 4.992a.252.252 0 0 1 .02-.022zm-.92 5.14.92.92a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 1 0-1.091-1.028L9.477 9.417l-.485-.486-.943 1.179z"/>
			  </svg>
			수정하기
		</button>
	</div>


	<div  style="display: inline-block; margin: 0 5px;">
		<button onclick="location='./delete?reviewNum=${dto.reviewNum}'" class="btn btn-primary">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
				<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
				<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
			</svg>
			삭제
		</button>	 
	</div>


	<div style="display: inline-block; margin: 0 5px;  float: right;">
		<button onclick="location='/'" class="btn btn-primary">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-door" viewBox="0 0 16 16">
				<path d="M8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4.5a.5.5 0 0 0 .5-.5v-4h2v4a.5.5 0 0 0 .5.5H14a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146zM2.5 14V7.707l5.5-5.5 5.5 5.5V14H10v-4a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v4H2.5z"/>
			</svg>
			홈으로
		</button>
	</div>

</p>
		</section>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
    			 integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" 
    			 crossorigin="anonymous"></script>
				 
	
<script src="../../../resources/hjs/js/ReviewsComment.js"></script>

<script>
	function clean(){
		var clean = document.getElementsByClassName('clean');

		//글을 쓸때마다 ''빈칸으로 만든다
		for(var i=0; i<clean.length;i++){
			clean[i].value='';
		}
	}
</script>
<c:import url="../template/footerHTML.jsp"></c:import>
</body>
</html>