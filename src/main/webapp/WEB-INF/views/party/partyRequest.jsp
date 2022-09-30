<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<table class="table table-dark table-hover">
	<c:forEach items="${partyRequest }" var="dto">
		<tr>
			<td>${dto.userName}</td>
			<td>${dto.partyAge }</td>
			<td>${dto.partyGender }</td>
			<td>${dto.partyComment }</td>
			<td>${dto.partyRequest }</td>
		</tr>
	</c:forEach>
</table>