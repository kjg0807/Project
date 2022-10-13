<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../../../resources/kdy/css/list.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../template/headerHTML.jsp"></c:import>

	<main>
		<main2>
			<div class="container" style="background-color: rgb(233, 233, 233); border-radius: 20px; margin-top: 50px; box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset; ">
				<div style="font-size: 30px; padding-top: 20px;">안녕하세요 관리자입니다.</div>
				<div style="padding-top: 15px; padding-bottom: 20px;">
					파티원 모집은 누구나 생성할 수 있고 누구나 참여가 가능합니다<br>
					<br>
					*파티생성*<br>
					1. 글쓰기 버튼 클릭<br>
					2. 제목, 날짜, 시간, 분을 입력<br>
					3. 내용까지 입력을 해주시면 끝
					<br><br>
					*파티 참여*<br>
					1. 마음에드는 모임을 클릭<br>
					2. 파티가입 버튼을 클릭<br>
					3. Comment창에 간단하게 회원님의 소개글을 작성해보세요<br>
					4. 가입신청이 등록되면 모임장의 승인을 대기<br><br>
					*파티 참여 모임장*<br>
					1. 파티생성 후 파티목록버튼 클릭<br>
					2. 가입신청이 들왔다면 승인or거절<br>
					<br>
					*채팅*<br>
					승인이 되면 채팅방에 입장하여 자유롭게 대화하시면 되겠습니다.<br>
					<br>
					<div style="color: red;">
						<div style="font-size: 20px;">
						*주의*<br>
						</div>
						1. 사기에 조심해주세요<br>
						2. 개인정보에 주의해 주세요<br>
						3. 성적인 발언은 조심해주세요<br>
						4. 욕설 금지<br>
					</div>


				</div>	
			</div>
		</main2>

		<div class="container" style="border-radius: 20px; margin-top: 50px; box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
			<div class="row mb-3">
				<form action="./list" class="row row-cols-lg-auto g-3 align-items-center">
				<div class="col-12">	
					<label class="visually-hidden" for="kind">Kind</label>
					<select name="kind" class="form-select" id="kind">
						<option class="kinds" value="title">제목</option>
					<option class="kinds" value="partycontents">내용</option>
					<option class="kinds" value="writer">작성자</option>
					</select>
				</div>
						<input type="hidden" class="shopNum" value="${pager.shopNum}" name="shopNum">
				<div class="col-12">
					<label class="visually-hidden" for="search">검색어</label>
					<div class="input-group">
					<input type="text" name="search" value="${pager.search}" class="form-control" id="search" >
					</div>
				</div>
				<div class="col-12">
					<button type="submit" class="btn btn-primary">검색</button>
				</div>
				</form>
			</div>

			<c:forEach items="${list}" var="dto" >
					<div class="party_list"  onclick="location.href='./detail?partyNum=${dto.partyNum}'; ">
						<div class="list">
							<div>
								<div class="d-flex">
									<div class="p-2 w-100" >
										<div class="container2" style="padding: 12px;">
											<div class="name" style="display: none;">파티 번호&nbsp;:&nbsp;${dto.partyNum}</div>
											<div class="shopContents">파티이름&nbsp;:&nbsp;${dto.partyTitle}</div>
											<div class="shopContents">반장&nbsp;:&nbsp;${dto.userName}</div>
											<div class="shopContents">등록날짜&nbsp;:&nbsp;${dto.partyRegdate}</div>
											<td>마감&nbsp;:&nbsp;<fmt:formatDate value="${dto.partyTimeout}" pattern="yy-MM-dd / HH:mm:ss"/></td>	
										</div>
									</div>
									<div class="p-2 flex-shrink-1">
								</div>
								</div>
							</div>
						</div>
					</div>
			</c:forEach>
			
			<c:if test="${pager.shopNum != null}">
				<div class="mb-3" style="padding-top: 15px;">
					<a href="./add?shopNum=${pager.shopNum}" class="btn btn-primary">글쓰기</a>
				</div>
			</c:if>
			
			<nav aria-label="Page navigation example">
				<ul class="pagination" style="padding-bottom: 15px;">
					
					<c:if test="${pager.pre}">
						<li class="page-item">
							<a class="page-link" href="./list?page=${pager.startNum-1}&search=${pager.search}&shopNum=${pager.shopNum}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
					</c:if>
					
					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<li class="page-item"><a class="page-link" href="./list?page=${i}&search=${pager.search}&shopNum=${pager.shopNum}">${i}</a></li>
					</c:forEach>
					
					<li class="page-item ${pager.next?'':'disabled'}">
						<a class="page-link" href="./list?page=${pager.lastNum+1}&search=${pager.search}&shopNum=${pager.shopNum}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
						</a>
					</li>
				</ul>
			</nav>
		</div>
		</main>
			
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
	<c:import url="../template/footerHTML.jsp"></c:import>
</body>
</html>
