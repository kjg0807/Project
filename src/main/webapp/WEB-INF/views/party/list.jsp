<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>
<body>

<div class="row">
	<table class="table">
	  <thead class="table-dark">
	    <tr>
	      <th scope="col">번호</th>
	      <th scope="col">제목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">올린날짜</th>
	      <th scope="col">마감시간</th>
	    </tr>
	  </thead>
	  <tbody>
	    <c:forEach items="${list}" var="dto" >
			<tr>
				<td>${dto.partyNum}</td>
				<td>
				<a href="./detail?partyNum=${dto.partyNum}">${dto.partyTitle}</a>
				</td>
				<td>${dto.userName}</td>
				<td>${dto.partyRegdate}</td>
				<td><fmt:formatDate value="${dto.partyTimeout}" pattern="HH:mm:ss"/></td>	
			</tr>
		</c:forEach>
	  </tbody>
	</table>
</div>

<div class="mb-3">
		<a href="./add" class="btn btn-primary">글쓰기</a>
	</div>
	
	<nav aria-label="Page navigation example">
	  <ul class="pagination">
	  <c:if test="${pager.pre}">
	    <li class="page-item">
	      <a class="page-link" href="./list.iu?page=${pager.startNum-1}&search=${pager.search}" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    </c:if>
		
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<li class="page-item"><a class="page-link" href="./list.iu?page=${i}&search=${pager.search}">${i}</a></li>
		</c:forEach>
			<li class="page-item ${pager.next?'':'disabled'}">
	        <a class="page-link" href="./list.iu?page=${pager.lastNum+1}&search=${pager.search}" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>