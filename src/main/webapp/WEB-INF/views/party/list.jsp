<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="row">
	<table class="table">
	  <thead class="table-dark">
	    <tr>
	      <th scope="col"></th>
	      <th scope="col">PartyNum</th>
	      <th scope="col"></th>
	      <th scope="col">DATE</th>
	      <th scope="col">HIT</th>
	    </tr>
	  </thead>
	  <tbody>
	    <c:forEach items="${list}" var="dto" >
			<tr>
				<td>${dto.num}</td>
				<td>
				<%-- for(int i=begin; i<= end;i++ --%>
				<c:catch>
				<c:forEach begin="1" end="${dto.depth}">&ensp;</c:forEach>
				</c:catch>
				<a href="./detail.iu?num=${dto.num}">${dto.title}</a>
				</td>
				<td>${dto.writer}</td>
				<td>${dto.regDate}</td>
				<td>${dto.hit}</td>	
			</tr>
		</c:forEach>
	  </tbody>
	</table>
</div>

<div class="mb-3">
		<a href="./add.iu" class="btn btn-primary">글쓰기</a>
	</div>
	
	<nav aria-label="Page navigation example">
	  <ul class="pagination">
	  <c:if test="${pager.pre}">
	    <li class="page-item">
	      <a class="page-link" href="./list.iu?page=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    </c:if>
		
		<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			<li class="page-item"><a class="page-link" href="./list.iu?page=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
		</c:forEach>
			<li class="page-item ${pager.next?'':'disabled'}">
	        <a class="page-link" href="./list.iu?page=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
</body>
</html>