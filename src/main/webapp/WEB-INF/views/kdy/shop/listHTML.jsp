<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/kdy/list.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>
<c:import url="../../template/headerHTML.jsp"></c:import>
    <main class="realMain">
        
        <div class="container">
            <div class="c1">
                맛집 리뷰
            </div>
                <div class="d-flex flex-row mb-3">
                    <div class="p-2 a">전체</div>
                    <div class="p-2 a">한식</div>
                    <div class="p-2 a">중식</div>
                    <div class="p-2 a">일식</div>
                    <div class="p-2 a">분식</div>
                    <div class="p-2 a">양식</div>
                    <div class="p-2 a">아시안</div>
                </div>

                <!-- <div class="d-flex flex-row mb-3">
                    <div class="p-2 a">전체</div>
                    <div class="p-2 a">밥</div>
                    <div class="p-2 a">국</div>
                    <div class="p-2 a">죽</div>
                    <div class="p-2 a">튀김</div>
                    <div class="p-2 a">면</div>
                    <div class="p-2 a">고기</div>
                    <div class="p-2 a">생선</div>
                    <div class="p-2 a">패스트푸드</div>
                </div> -->
         <c:forEach items="${requestScope.list}" var="list">
                
            <div class="shop_list"  onclick="location.href='/shop/detailHTML?shopNum=${list.getShopNum()}';">
                <div class="list" style="box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px" >
                    <div style="border-bottom: solid 1px gainsboro; height: 200px;" >
                        <div class="d-flex">
                            <div class="p-2 w-100" >
                                <div class="container2" style="padding: 12px;">
                                    <div class="name">${list.shopName}</div>
                                    <div class="contents">${list.title}</div>
                                    <div class="contents2">${list.shopAddress}</div>
                                </div>
                                <div class="d-flex flex-row mb-3 mt-2">
                                    <div class="p-2 b">#test</div>
                                    <div class="p-2 b">#test</div>
                                    <div class="p-2 b">#test</div>
                                    <div class="p-2 b">#test</div>
                                    <div class="p-2 b">#test</div>
                                </div>
                            </div>
                            <div class="p-2 flex-shrink-1">
                                <div class="mt-2" id="img" style="height: 200px; width: 310px">
                                    <img src="../../../resources/images/kdy/hma.jpg" style="width: 300px;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
      </c:forEach>
		<a class="btn btn-secondary" href="./add" role="add">가게등록</a>
            </div>
    </main>
    <div style="display: flex; margin: 5 5px;  justify-content: center;">
    <nav aria-label="Page navigation example">
			<ul class="pagination">
			<c:if test="${shopPager.pre}">
				<li class="page-item">
					<a class="page-link" href="./listHTML?shopPage=${shopPager.startNum-1}">&laquo;</a>
				</li>
			</c:if>
			
			<c:forEach begin="${shopPager.startNum}" end="${shopPager.lastNum}" var="i">
				<li class="page-item">
					<a class="page-link" href="./listHTML?shopPage=${i}">${i}</a>
				</li>
			</c:forEach>
			<li class="page-item ${shopPager.next?'':'disabled'}">
			<a class="page-link" href="./listHTML?shopPage=${shopPager.lastNum+1}">&raquo;</a>
			</ul>
		</nav>
		</div>
        <script>
			let k = '${param.kind}'; 
			const kinds = document.getElementsByClassName("kinds");

			for(let i=0; i<kinds.length; i++){
				if(kinds[i].value == k){
					kinds[i].selected=true;
					break;
				}
			}
		</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="../../../resources/js/list.js"></script>
<c:import url="../../template/footerHTML.jsp"></c:import>
</body>
</html>