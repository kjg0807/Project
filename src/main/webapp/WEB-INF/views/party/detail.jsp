<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>
	<section class="container-fluid col-lg-6">
		<div class="row mt-5 bg-light">
			<h1>Party Detail Page</h1>
		</div>	
		<div class="row border border-danger mt-5 bg-light" style="height: 75px">
			<div class="col-lg-6 border border-danger">
				${partyListDTO.partyTitle}
			</div>
			<div class="col-lg-2 border border-danger">
				${partyListDTO.userName}
			</div>
			<div class="col-lg-2 border border-danger">
				${partyListDTO.partyRegdate}
			</div>
			<div class="col-lg-2 border border-danger">
					${partyListDTO.partyTimeout}
			</div>
		</div>
		<div class="row border border-top-0 border-danger bg-light"  style="min-height: 60vh" >
			<div class="col">
				${partyListDTO.partyContents}
			</div>
		</div>
		<div class="col-lg-2 border border-danger">
			<div class="col">
				<c:forEach items="${partyListDTO.partyFileDTOs}" var="fileDTO">
					<p>
					<a href="../resources/upload/Party/${fileDTO.fileName}">${fileDTO.oriName}</a>
					</p>
				</c:forEach>
			</div>
		</div>
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#joinModal">
			파티가입
		</button>

		<div class="modal fade" id="joinModal" tabindex="-1" aria-labelledby="joinModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<input type="hidden" id="joinNum">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">파티 신청</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="mb-3">
							<label for="recipient-name" class="col-form-label">닉네임</label>
							<input class="form-control" type="text" id="joinUserName" placeholder="닉네임" >
						</div>
						<div class="form-check">
							<div class="form-check" >
								<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
								<label class="form-check-label" for="flexRadioDefault1">
									남자
								</label>
							</div>
							<div class="form-check" >
								<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
								<label class="form-check-label" for="flexRadioDefault2">
									여자
								</label>
							</div>
						</div>
						<select id="joinAge">

						</select>
						<div class="mb-3">
							<label for="message-text" class="col-form-label">Commenet</label>
							<textarea class="form-control" id="joinComment"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" id="joinbtn">신청</button>
					</div>
				</div>
			</div>
		</div>

		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#partyModal">
			파티목록
		</button>

		<div class="modal fade" id="partyModal" tabindex="-1" aria-labelledby="joinModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					...
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">수락</button>
				</div>
				</div>
			</div>
		</div>

		
	</section>
	<script src="/resources/js/party.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>