<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"
>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"
></script>
</head>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "hr";
String password = "hr";
Connection conn = DriverManager.getConnection(url, user, password); //db에 접근해서 sql실행하고 
Statement stmt = conn.createStatement();
String sql = "select userid from promembers"; // 
stmt.executeQuery(sql);
ResultSet rs = stmt.executeQuery(sql);
%>
[
<%
int i = 0;
while (rs.next())
{
	String userid = rs.getString("userID");
	if (i > 0)
	{
		out.print(",");
	}
%>
<%=userid%>
<%
i++;
} //while end
%>
]
<body>
		<!-- id -->
	<!-- <input type="text" name="userID" value="${member.userID}" id="DTOID"> -->
	<!-- onclick="window.close();" -->
	<!-- <form action="../member/checkId" method="post" id="frm" name="myform">
		<br>
		<h1 style="text-align: center;">회원 가입</h1>
		<section class="col-lg-6 container-fluid mt-4">
			<div class="row">
				<div class="mb-3">
					<label class="form-label">아이디</label>
					<input type="text" class="form-control" name="userID" id="id"
					>
					<button type="submit" id="idchecked" class="btn btn-outline-dark">ID 중복 체크</button>
					<span id="idChk"></span>
				</div>
			</div>
		</section>
	</form> -->
	<form action="../member/join" method="post" id="frm" name="myform">
		<br>
		<h1 style="text-align: center;">회원 가입</h1>
		<section class="col-lg-6 container-fluid mt-4">
			<div class="row">
				<!-- id -->
				<div class="mb-3">
					<label class="form-label">아이디</label>
					<input type="text" class="form-control" name="userID" aria-describedby="emailHelp" id="id" placeholder="아이디 입력" onfocus="this.placeholder=''"
						onblur="this.placeholder='아이디 입력'"
					>
					<button type="button" id="idchecked" class="btn btn-outline-dark" onclick="window.close();">ID 중복 체크</button>
					<div id="idChk"></div>
				</div>
			</div>
		</section>
	</form>
</body>
<script src="/resources/kjk/js/checkId.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</html>