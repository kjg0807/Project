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
	<c:import url="../template/headerHTML.jsp"></c:import>

	<div class="row mb-3">
		<form action="./list" class="row row-cols-lg-auto g-3 align-items-center">
		
		  <div class="col-12">	
		    <label class="visually-hidden" for="kind">Kind</label>
		    <select name="kind" class="form-select" id="kind">
				<option class="kinds" value="title">Title</option>
		      <option class="kinds" value="partycontents">Contents</option>
		      <option class="kinds" value="writer">Writer</option>
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
		    <button type="submit" class="btn btn-primary">Submit</button>
		  </div>
		</form>
	
	</div>

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
				<td><fmt:formatDate value="${dto.partyTimeout}" pattern="yy-mm-dd / HH:mm:ss"/></td>	
			</tr>
		</c:forEach>
	  </tbody>
	</table>
</div>
	<c:if test="${pager.shopNum != null	 }">
		<div class="mb-3">
			<a href="./add?shopNum=${pager.shopNum}" class="btn btn-primary">글쓰기</a>
		</div>
	</c:if>
	
	<nav aria-label="Page navigation example">
	  <ul class="pagination">
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<c:import url="../template/footerHTML.jsp"></c:import>
</body>
</html>
