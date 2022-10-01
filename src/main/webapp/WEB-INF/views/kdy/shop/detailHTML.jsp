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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/kdy/css/detail.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- include summernote css/js-->
     <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
     <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c971ac6c7712b0e728a1ba2df98cf0fd"></script> -->
</head>
<body>
<c:import url="../../template/headerHTML.jsp"></c:import>


            <div class="d-flex" id="img1">
    <c:forEach items="${detail.shopFileDTOs}" var="shopFileDTO">               
        <img class="flex image" style="width: 380px; height: 380px;" src="../../../../resources/upload/shop/${shopFileDTO.fileName}">
        <!-- <img src="../../../../resources/upload/shop"> -->
    </c:forEach>
   
     </div>

    <main> 
 
        <div class="container" style="margin-top: 200px;">
			<!-- 확인 -->
		
			<!-- 수정 -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1" data-bs-whatever="@mdo">게시글 수정</button>

                        <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">                     
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">게시글 수정</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                        <form action="/shop/update" method="post">
                                        
                                    <div class="modal-body">
                                            <input type="hidden" id="shopNum" name="shopNum" value="${detail.shopNum}">
                                            
                                        <div class="mb-3">
                                          <label for="recipient-name" class="col-form-label"></label>
                                          식당 이름 수정  <input type="text" class="form-control" name="shopName" value="${detail.shopName}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="recipient-name" class="col-form-label"></label>
                                            카테고리 수정  <input type="text" class="form-control" name="categoryNum" value="${detail.categoryNum}">
                                          </div>
                                          <div class="mb-3">
                                            <label for="recipient-name" class="col-form-label"></label>
                                            가게 전화번호 수정  <input type="text" class="form-control" name="shopPhone" value="${detail.shopPhone}">
                                          </div>
                                          <div class="mb-3">
                                            <label for="recipient-name" class="col-form-label"></label>
                                            가게 주소 수정  <input type="text" class="form-control" name="shopAddress" value="${detail.shopAddress}">
                                          </div>
                                          <div class="mb-3">
                                            <label   for="recipient-name" class="col-form-label"></label>
                                            가게 평균가격 수정  <input type="text" class="form-control" name="priceAvg" value="${detail.priceAvg}">
                                          </div>
                                          <div class="mb-3">
                                            <label for="recipient-name" class="col-form-label"></label>
                                            가게 배달비 수정  <input type="text" class="form-control" name="delivery" value="${detail.delivery}">
                                          </div>
                                          <div class="mt-3">
                                          <label for="recipient-name" class="col-form-label"></label>
                                            <textarea name = "contents" class="form-control mt-1" id="contents" rows="3">${detail.contents}</textarea>
                                        </div>
                                          <div class="mb-3">
                                            <label for="recipient-name" class="col-form-label"></label>
                                            가게 제목 수정 <br><textarea name="title" rows="10" cols="57">${detail.title}</textarea>
                                          </div>
                                     

                                         
                                       
                                    </div>
                                    
                                    <div class="modal-footer">
                                        <div class="dy flex" id="delete" onclick="location.href='/shop/delete?shopNum=${detail.getShopNum()}';">&ensp;가게 삭제</div>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
                                        <button type="submit" class="btn btn-primary">등록하기</button>
                                    </div>
					           </form>
                          </div>
                      </div>
                   </div>

                   <!-- 이미지  -->
                   <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2" data-bs-whatever="@mdo">이미지 수정</button>

                   <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">                     
                           <div class="modal-dialog">
                             <div class="modal-content">
                               <div class="modal-header">
                                   <h5 class="modal-title" id="exampleModalLabel">이미지 추가</h5>
                                   <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                               </div>
                            <form action="/shop/add" method="post">
                                   
                               <div class="modal-body">
                                       <input type="hidden" id="shopNum" name="shopNum" value="${detail.shopNum}">

                                            <div id="addFiles" class="mb-3">
                                                    <i class="fa-regular fa-image"></i>
                                                    <label for="message-text" class="col-form-label"></label>
                                                    <input type="file" name="files" id="fileAdd">파일
                                            </div>
                               </div>
                               
                               <div class="modal-footer">
                                   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
                                   <button type="submit" class="btn btn-primary">등록하기</button>
                               </div>
                          </form>
                     </div>
                 </div>
              </div> 


			<div style="border-bottom: solid 1px gainsboro;">
				<div class="p-2 pt-3" style="font-size: 50px;">${detail.shopName}
				</div>
  
			</div>

			<div class="Information">

        <!-- <div id="map" style="width:1000px; height:1000px;"></div> -->

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
          <div class="d-flex q" id="menu" >대표메뉴 &ensp;&ensp;&nbsp;
            <input type="hidden" id="shopNum" name="shopNum" value="${detail.shopNum}">
            <input type="hidden" id="menuNum" name="menuNum" value="${menuDTO.menuNum}">
						<div class="flex q" id="realmenu">&ensp;&ensp;&ensp;${menuDTO.menuName}</div>
						<div class="flex q" id="realmenu">&ensp;&ensp;&ensp;${menuDTO.menuPrice}원</div>
					</div>
          <div class="dy flex" id="deleteMenu"  onclick="location.href='/shop/deleteMenu?menuNum=${menuDTO.menuNum}&shopNum=${detail.shopNum}';">&ensp;대표메뉴삭제</div>
				</c:forEach>
        
        <!-- <c:forEach items="${detail.menuDTOs}" var="menuDTO">
          <div class="d-flex q" id="menu" onclick="">대표메뉴 &ensp;&ensp;&nbsp;:
            <div class="flex q" id="realmenu">&ensp;&ensp;&ensp;${menuDTO.menuName}</div>
						<div class="flex q" id="realmenu">&ensp;&ensp;&ensp;${menuDTO.menuPrice}원</div>
					</div>
				</c:forEach> -->
        <!-- 대표메뉴 추가 -->
				 <button type="hidden" class="btn btn-primary" id="menuAdd" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">대표메뉴 등록</button> 
                    
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">                     
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header" >
                                        <h5 class="modal-title" id="exampleModalLabel" type="hidden" id="menuAdd">대표메뉴 등록</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                        <form action="./addMenuHTML" method="post">
                                        
                                    <div class="modal-body">
                                            <input type="hidden" id="shopNum" name="shopNum" value="${detail.shopNum}">
                                            <input type="hidden" id="menuNum" name="menuNum" value="${detail.menuNum}">
                                            
                                        <div class="mb-3">
                                          <label for="recipient-name" class="col-form-label"></label>
                                          <input type="text" class="form-control" id="recipient-name" placeholder="메뉴의 이름을 작성해주세요" name="menuName">
                                        </div>
                                        
                                        <div class="mb-3">
                                          <label for="message-text" class="col-form-label"></label>
                                          <input type="text" class="form-control" id="recipient-name" placeholder="메뉴의 가격을 작성해주세요" name="menuPrice">
                                        </div>
                                    </div>
                                    
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
                                        <button type="submit" class="btn btn-primary" id="num">등록하기</button>
                                    </div>
					           </form>
                          </div>
                      </div>
                   </div>
            
      
                
         </div>
     </div>
</main>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="../../../../resources/kdy/js/detailHTML.js"></script>
<script type="text/javascript">
    $("#contents").summernote(
            {
                    height: 260,                
                    minHeight: null,           
                    maxHeight: null,          
                    focus: true 

                });
                $('#contents').summernote({
    height : 350,
    toolbar: [
        ['style', ['style']],
        ['font', ['bold', 'italic', 'underline', 'clear']],
        ['fontname', ['fontname']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']],
        ['table', ['table']],
        ['insert', ['link', 'picture', 'hr']],
        ['view', ['fullscreen', 'codeview']],
        ['help', ['help']]
      ]
 }); </script>
   <script src="../../../../resources/kdy/js/shop_files.js"></script>

   
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=abf31ecaa88152d20b1faa70bc69a3d1&libraries=services,clusterer,drawing"></script>

<c:import url="../../template/footerHTML.jsp"></c:import>
</body>
</html>