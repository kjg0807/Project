<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="../../../resources/js/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="../../resources/js/jquery-ui.css">
</head>
<body>
	<c:import url="../template/headerHTML.jsp"></c:import>
	<section class="container-fluid col-lg-4">
	
	<div class="row">
		<form action="./update" method="post" enctype="multipart/form-data">
			  <input type="hidden" name="userName" value = "${member.userName}" class="form-control" >
			  <input type="hidden" name="userID" value = "${member.userID}" class="form-control">
			  <input type="hidden" name="shopNum" value = "${partyListDTO.shopNum}" class="form-control">
			  	
			<div class="mb-3">
			  <label for="title" class="form-label">Title</label>
			  <input type="text" value="${partyListDTO.partyTitle}" name="partyTitle" class="form-control" id="title" placeholder="제목 입력">
			</div>
			<div>
				<input class="datepicker" name="partyTimeout" value="">
				<select id="TT" name="partyHH">
					<option value="시간" checked> 시간</option>
				</select>
				<select id="MM1" name="partymm">
					<option value="분" checked> 분</option>
				</select>
			</div>
			
			<div class="mb-3">
			  <label for="contents" class="form-label">Contents</label>
			  <textarea class="form-control" name="partyContents"  id="contents" rows="3">${partyListDTO.partyContents}</textarea>
			</div>

			
			<div class="mb-3">
				<button class="btn btn-success">수정</button>
			</div>
			
		</form>	
	</div>
</section>
<script>
	$.datepicker.setDefaults({
	dateFormat: 'yy-mm-dd',
	prevText: '이전 달',
	nextText: '다음 달',
	monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	showMonthAfterYear: true,
	yearSuffix: '년'
	});

$(function () {
  $('.datepicker').datepicker();
  let Dvar =  $('.datepicker').val();
  $('datepicker').value = Dvar;
});
  </script>
	<script src="/resources/js/partyList.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
	<c:import url="../template/footerHTML.jsp"></c:import>
</body>
</html>