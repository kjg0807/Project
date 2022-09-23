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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/detail.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>
<c:import url="../../template/headerHTML.jsp"></c:import>
    <div class="d-flex" id="img1">
    <c:forEach items="${detail.shopFileDTOs}" var="shopFileDTO">               
        <img class="flex image" style="width: 380px; height: 380px;" src="../../../resources/upload/shop/${shopFileDTO.fileName}">
    </c:forEach>
</div>

    <main> 
 
        <div class="container" style="margin-top: 200px;">
            <div style="border-bottom: solid 1px gainsboro;">
                <div class="p-2 pt-3" style="font-size: 50px;">${detail.shopName}
                </div>
            </div>
            
			

			<div class="Information">
                <div class="d-flex q" id="address">주소 &ensp;&ensp;&ensp;&ensp;&nbsp;&nbsp;&ensp;&ensp;:
                    <div class="flex q" id="realAddress">&ensp;&ensp;&ensp;${detail.shopAddress}</div>
                </div>
                <div class="d-flex q" id="phone">전화번호 &ensp;&ensp;&ensp;&nbsp;:
                    <div class="flex q" id="realPhone">&ensp;&ensp;&ensp;${detail.shopPhone}</div>
                </div>
                <div class="d-flex q" id="priceAvg">가격대 &ensp;&ensp;&ensp;&ensp;&ensp;&nbsp;:
                    <div class="flex q" id="realpriceAvg">&ensp;&ensp;&ensp;${detail.priceAvg}원</div>
                </div>
                <div class="d-flex q" id="delivery">배달비 &ensp;&ensp;&ensp;&ensp;&ensp;&nbsp;:
                    <div class="flex q" id="realdelivery">&ensp;&ensp;&ensp;${detail.delivery}원</div>
                </div>
    
					<c:forEach items="${detail.menuDTOs}" var="menuDTO">
                	<div class="d-flex q" id="delivery">대표메뉴 &ensp;&ensp;&nbsp;:
                   		<div class="flex q" id="realdelivery">&ensp;&ensp;&ensp;${menuDTO.menuName}</div>
                   		<div class="flex q" id="realdelivery">&ensp;&ensp;&ensp;${menuDTO.menuPrice}원</div>
					</div>
					</c:forEach>
							
                	<div class="dy flex" onclick="location.href='/shop/addMenu?shopNum=${detail.getShopNum()}';">대표메뉴설정</div>
                	
                	<div class="dy flex" onclick="location.href='/shop/updateMenu?shopNum=${detail.getShopNum()}';">&ensp;대표메뉴수정</div>
                </div>
            </div>
      

    </main>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<c:import url="../../template/footerHTML.jsp"></c:import>
</body>
</html>