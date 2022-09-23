<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" 
		rel="stylesheet" 
		integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
		 crossorigin="anonymous">
</head>
<c:import url="../template/headerHTML.jsp"></c:import>
<body>
<section class="container-fluid col-lg-6 mt-5">
	<h1>리뷰 reply List Page</h1>
	
	<form action="./list" class="row row-cols-lg-auto g-3 align-items-center">
	
	  <div class="col-12">
	    <label class="visually-hidden" for="kind">Kind</label>
	    <select name="kind" class="form-select" id="kind">
	      <option selected>선택하세요</option>
	      <option class="kinds" value="contents">내용</option>
	      <option class="kinds" value="title">제목</option>
	      <option class="kinds" value="writer">글쓴이</option>
	    </select>
	  </div>
	  <div class="col-12">
	    <label class="visually-hidden" for="search">검색어</label>
		    <div class="input-group">
		      <input type="text" name="search" value="${param.search}" class="form-control" id="search">
		  	</div>
	  </div>
	  
	  
	<div class="col-12">
   		 <button type="submit" class="btn btn-primary">검색</button>
 	 </div>
</form>
	
	<table border="1" class="table table-striped table-hover">
		<thead class="table-dark">
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			
			</tr>
		
		</thead>
	</table>


	</section>	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
    			 integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" 
    			 crossorigin="anonymous"></script>
    			 <c:import url="../template/footerHTML.jsp"></c:import>
</body>
</html>