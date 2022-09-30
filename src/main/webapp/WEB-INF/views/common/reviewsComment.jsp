<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<table  class="table table-striped col-lg-16">
	<c:forEach items="${reviewsCommentList}" var="dto">
		<tr>
			<td>${dto.writer}</td>
			<td>${dto.contents}</td>
			<td>${dto.regDate}</td>
		</tr>
	</c:forEach>
</table>