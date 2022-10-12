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
     <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

     <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c971ac6c7712b0e728a1ba2df98cf0fd"></script> -->

<style>
  #th{
    cursor: default;
  }

  #tb1{
    cursor:default;
  }

 

  #dcontents{
    white-space: nowrap;
	  overflow: hidden;
	  text-overflow: ellipsis !important;
	  max-width: 200px;
  }

  #dtitle{
    white-space: nowrap;
	  overflow: hidden;
	  text-overflow: ellipsis !important;
	  max-width: 200px;
  }
</style>
</head>
<body>
<c:import url="../../template/headerHTML.jsp"></c:import>

            <div class="d-flex" id="img1">
              <c:forEach items="${detail.shopFileDTOs}" var="shopFileDTO">               
                  <img class="flex image" style="width: 380px; height: 380px; box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;" src="../../../../resources/upload/shop/${shopFileDTO.fileName}" >
              </c:forEach>
            </div>
            
            <main> 
              <div class="container" style="margin-top: 200px; box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
              
                <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">                     
                  <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">게시글 수정</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                        <form action="/shop/update" method="post" enctype="multipart/form-data" id="updateFrm">
                                        
                                            <div class="modal-body">
                                              <input type="hidden" id="shopNum" name="shopNum" value="${detail.shopNum}">  
                                              <div class="mb-3">
                                                <label for="recipient-name" class="col-form-label"></label>
                                                식당 이름 수정  <input type="text" class="form-control" name="shopName" value="${detail.shopName}">
                                              </div>
                                            <div class="mb-3" id="caNumBer">
                                              <label for="message-text" class="col-form-label">category</label>
                                              <select  name="categoryNum" class="form-select" id="categoryNum">
                                                <option class="categoryNums" value="1">한식</option>
                                                <option class="categoryNums" value="2">중식</option>
                                                <option class="categoryNums" value="3">일식</option>
                                                <option class="categoryNums" value="4">분식</option>
                                                <option class="categoryNums" value="5">양식</option>
                                                <option class="categoryNums" value="6">아시안</option>
                                              </select>
                                            </div> 
                                            <div class="mb-3">
                                              <label for="recipient-name" class="col-form-label"></label>
                                              가게 전화번호 수정  <input type="text" class="form-control" name="shopPhone" value="${detail.shopPhone}">
                                            </div>
                                          <div class="mb-3">
                                            <label for="message-text" class="col-form-label"> </label>
                                            가게 주소 수정<input type="text" class="form-control"   value="${detail.shopAddress}" name="shopAddress">
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
                                            <textarea name = "shopContents" class="form-control mt-1" id="shopContents" rows="3">${detail.shopContents}</textarea>
                                          </div>
                                          <div class="mb-3">
                                            <label for="recipient-name" class="col-form-label"></label>
                                            가게 제목 수정 <br><textarea name="shopTitle" rows="10" cols="57">${detail.shopTitle}</textarea>
                                          </div>
                                            <c:forEach items="${detail.shopFileDTOs}" var="fileDTO">
                                              <div class="mb-3">
                                                <img class="flex image" style="width: 380px; height: 380px;" src="../../../../resources/upload/shop/${fileDTO.fileName}">
                                                <button type="button" class="fileDelete" data-file-num="${fileDTO.fileNum}" style="color: red; box-shadow: rgb(204, 219, 232) 3px 3px 6px 0px inset, rgba(255, 255, 255, 0.5) -3px -3px 6px 1px inset;"> Delete </button>
                                              </div>
                                            </c:forEach>
                                            <div id="addFiles">
                                              <button style="color: blue;" type="button"name="files" id="fileAdd">파일추가</button>
                                            </div>
                                              <!-- <button style="border-top: solid 1px gainsboro;"  type="button" id="shopDelete" class="btn btn-danger" onclick="location.href='/shop/delete?shopNum=${detail.getShopNum()}';">가게 삭제</button>  -->
                                          </div>
                                          <div class="modal-footer">
                                             <button type="button" style="border-top: solid 1px gainsboro;" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModalDelete">가게 삭제</button> 
                                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소하기</button>
                                            <button type="submit" class="btn btn-primary">등록하기</button>
                                          </div>
                                        </form>
                                      </div>
                                    </div>
                                  </div>
                                  <!-- Modal -->
                                  <div class="modal fade" id="exampleModalDelete" tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                      <div class="modal-content">
                                        <div class="modal-header">
                                          <h1 class="modal-title fs-5" id="exampleModalLabel">가게 삭제</h1>
                                          <button type="button" class="btn-close"
                                            data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                          
                                          <c:forEach items="${detail.memberDTOs}" var="memberDTO">
                                            <div>&ensp;&ensp;${memberDTO.userID}님
                                            </div>
                                            
                                            <div class="mb-3">
                                              정말로 삭제하시겠습니까 
                                              삭제 후에는 되돌릴 수 없습니다.
                                            </div>
                                            
                                          </c:forEach> 
                                        </div>
                                        <div class="modal-footer">
                                          <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">돌아가기</button>
                                          <button type="button" class="btn btn-primary" id="shopDelete" onclick="location.href='/shop/delete?shopNum=${detail.getShopNum()}';" >삭제..</button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1" data-bs-whatever="@mdo" id="modalOpenBtn" style="display: none;">게시글 수정</button>
                            <button type="button" class="btn btn-primary" id="updateShop" data-writer="${detail.memberDTOs[0].userID}" data-user="${sessionScope.member.userID}">게시글 수정</button>
                            <button type="button" class="btn btn-primary" id="menuAdd" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">메뉴 등록</button> 
                            <div style="display: inline-block; margin:0 5px; float: right;">
                              <button onclick="location='../../party/list?shopNum=${detail.shopNum}'" class="btn btn-primary">파티모집</button>
                            </div>

                            <div style="display: inline-block; margin:0 5px; float: right;">
                              <button onclick="location='../../reviews/add?shopNum=${detail.shopNum}'" class="btn btn-primary">리뷰남기기</button>
                            </div>
                                  <div style="border-bottom: solid 1px gainsboro; padding-bottom: 50px; padding-top: 50px; box-shadow: rgba(0, 0, 0, 0.45) 0px 25px 20px -20px;">
                                      <div class="p-2 pt-3" style="font-size: 50px;">${detail.shopName}</div>
                                        <div class="d-flex">
                                          <div >&ensp;&ensp;<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-wechat" viewBox="0 0 16 16">
                                              <path d="M11.176 14.429c-2.665 0-4.826-1.8-4.826-4.018 0-2.22 2.159-4.02 4.824-4.02S16 8.191 16 10.411c0 1.21-.65 2.301-1.666 3.036a.324.324 0 0 0-.12.366l.218.81a.616.616 0 0 1 .029.117.166.166 0 0 1-.162.162.177.177 0 0 1-.092-.03l-1.057-.61a.519.519 0 0 0-.256-.074.509.509 0 0 0-.142.021 5.668 5.668 0 0 1-1.576.22ZM9.064 9.542a.647.647 0 1 0 .557-1 .645.645 0 0 0-.646.647.615.615 0 0 0 .09.353Zm3.232.001a.646.646 0 1 0 .546-1 .645.645 0 0 0-.644.644.627.627 0 0 0 .098.356Z"/>
                                              <path d="M0 6.826c0 1.455.781 2.765 2.001 3.656a.385.385 0 0 1 .143.439l-.161.6-.1.373a.499.499 0 0 0-.032.14.192.192 0 0 0 .193.193c.039 0 .077-.01.111-.029l1.268-.733a.622.622 0 0 1 .308-.088c.058 0 .116.009.171.025a6.83 6.83 0 0 0 1.625.26 4.45 4.45 0 0 1-.177-1.251c0-2.936 2.785-5.02 5.824-5.02.05 0 .1 0 .15.002C10.587 3.429 8.392 2 5.796 2 2.596 2 0 4.16 0 6.826Zm4.632-1.555a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Zm3.875 0a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Z"/>
                                              </svg> &ensp;${detail.hit}
                                            </div>
                                              <div>&ensp;&ensp;<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                                <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                                                </svg> &ensp;${detail.memberDTOs[0].userID}님
                                              </div>
                                         
                                      </div>   
                                      <div>
                                        <button onclick="goBack()" style="color: black; box-shadow: rgb(204, 219, 232) 3px 3px 6px 0px inset, rgba(255, 255, 255, 0.5) -3px -3px 6px 1px inset;">《《《《《《</button>
                                      </div>
                                  </div>
    
         <div class="Information d-flex justify-content-between" style="border-bottom: solid 1px gainsboro; padding-top: 50px; padding-bottom: 50px;">
        <div>
        <!-- <div id="map" style="width:1000px; height:1000px;"></div> -->
        <div class="flex-row">
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
          <div class="d-flex q" id="menuDelete" >대표메뉴 &ensp;&ensp;&nbsp;
            <input type="hidden" id="shopNum" name="shopNum" value="${detail.shopNum}">
            <input type="hidden" id="menuNum" name="menuNum" value="${menuDTO.menuNum}">
                  <div class="flex q" id="realmenu">&ensp;&ensp;&ensp;${menuDTO.menuName}</div>
                  <div class="flex q" id="realmenu">&ensp;&ensp;&ensp;${menuDTO.menuPrice}원</div>
               </div>
          <div class="dy flex btn btn-danger" id="deleteMenu" style="box-shadow: rgb(204, 219, 232) 3px 3px 6px 0px inset, rgba(255, 255, 255, 0.5) -3px -3px 6px 1px inset;" onclick="location.href='/shop/deleteMenu?menuNum=${menuDTO.menuNum}&shopNum=${detail.shopNum}';">&ensp;대표메뉴삭제</div>
            </c:forEach>
      </div>
      </div>
      <div class="side-wrap" id="map2" style="width:350px;height:350px; box-shadow: rgba(0, 0, 0, 0.4) 0px 2px 4px, rgba(0, 0, 0, 0.3) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset;" ></div>
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">                     
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header" >
                                        <h5 class="modal-title" id="exampleModalLabel" type="hidden">대표메뉴 등록</h5>
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
                                        <button type="button" class="btn btn-danger" style="box-shadow: rgb(204, 219, 232) 3px 3px 6px 0px inset, rgba(255, 255, 255, 0.5) -3px -3px 6px 1px inset;" data-bs-dismiss="modal">취소하기</button>
                                        <button type="submit" class="btn btn-primary" style="box-shadow: rgb(204, 219, 232) 3px 3px 6px 0px inset, rgba(255, 255, 255, 0.5) -3px -3px 6px 1px inset;" id="menuAddNum">등록하기</button>
                                    </div>
                          </form>
                          </div>
                      </div>
                   </div>
  
                  </div>
                  <div style="border-bottom: solid 1px gainsboro; box-shadow: rgba(0, 0, 0, 0.45) -20px -20px -20px -20px; ">
                    <div style="font-size: 25px; text-align: center; font-weight: bold;">
                      식당 소개
                    </div>
                    <br>
                    <br>
                    <br>
                    <div style="font-weight: bold;">
                      ${detail.shopContents}
                    </div>
                   <br>
                    <br>
                    <br>
                 </div>
              
         </div>
        

     </div>
     <br>
     <br>
     <br>
     <!-- <form action="../../reviews/list" class="row row-cols-lg-auto g-3 align-items-center"> -->
      <section class="container-fluid col-lg-12 mt-5">
        <form action="../shop/detailHTML" class="row row-cols-lg-auto g-3 align-items-center">
        <!-- <form action="../../reviews/list" class="row row-cols-lg-auto g-3 align-items-center"> -->
          <div class="col-12">
            <input type="hidden" name="shopNum" value="${param.shopNum}">
            <label class="visually-hidden" for="kind">Kind</label>
            <select name="kind" class="form-select" id="kind">
              <option selected>선택하세요</option>
              <option class="kinds" value="userID">닉네임</option>
              <option class="kinds" value="title">제목</option>
              <option class="kinds" value="contents">내용</option>
            </select>
          </div>
            <div class="col-12">
                <label class="visually-hidden" for="search">검색어를 입력하세요</label>
              <div class="input-group">
                  <input type="text" name="search" value="${param.search}" class="form-control" id="search">
            </div>
          </div> 
          
        
        <div class="col-12">
          <button type="submit" class="btn btn-primary">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
            </svg>
              검색
        </button>
        </div>
      
      </form>


        <table border="1" class="table table-striped table-hover col-lg-8">
          <thead class="table-white" id="th">
            <tr>
              <th>리뷰글번호</th>
              <th>닉네임</th>
              <th>제목</th>
              <!-- <th>내용</th> -->
              <th>작성날짜</th>
              <th>조회수</th>
              <th>자세히 보기</th>
            </tr>
          </thead>
          
          <tbody id="tb1">
            <c:forEach items="${requestScope.list}" var="dto">
              <tr id="tdiv">
                <td>${pageScope.dto.reviewNum}</td>
                <td>${pageScope.dto.userID}</td>
                <td id="dtitle">${pageScope.dto.title}</td>
                <!-- <td id="dcontents">${pageScope.dto.contents}</td> -->
                <td>${pageScope.dto.reviewDate}</td>
                <td>${pageScope.dto.hits}</td>
                <c:choose>

                        <c:when test="${member == null}">
                            <td>
                              <button style="width: auto;" class="btn" id="detailList">
                                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                    <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                  </svg>
                                  자세히
                              </button>
                            </td>
                        </c:when>

                        <c:otherwise>
                            <td>
                              <button class="btn btn-outline-dark" onclick="location.href='../../reviews/detail?reviewNum=${pageScope.dto.reviewNum}';" type="submit" style="width: auto;">
                                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                    <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                  </svg>
                                  자세히
                              </button>
                            </td>
                        </c:otherwise>
                      </c:choose>
              </tr>
            </c:forEach>
          </tbody>
        </table>
        <div style="display: flex; margin: 5 5px;  justify-content: center;">
          <input name="shopNum" type="hidden" value="${detail.shopNum}">
          <nav aria-label="Page navigation example">
            <ul class="pagination">
              <!--이전 버튼-->
              <c:if test="${reviewsPager.pre}">
                <li class="page-item">

                  <a class="page-link" name="shopNum" href="../../shop/detailHTML?shopNum=${detail.shopNum}&page=${reviewsPager.startNum-1}&kind=${reviewsPager.kind}&search=${reviewsPager.search}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
              </c:if>
              
              <c:forEach begin="${reviewsPager.startNum}" end="${reviewsPager.lastNum}" var="i">

                    <li class="page-item"><a class="page-link" name="shopNum" href="../../shop/detailHTML?shopNum=${detail.shopNum}&page=${i}&kind=${reviewsPager.kind}&search=${reviewsPager.search}">${i}</a></li>
              </c:forEach>

              <!--다음 버튼-->
            <li class="page-item ${reviewsPager.next?'':'disabled'}">
                <a class="page-link" name="shopNum" href="../../shop/detailHTML?shopNum=${detail.shopNum}&page=${reviewsPager.lastNum+1}&kind=${reviewsPager.kind}&search=${reviewsPager.search}" aria-label="Next">

                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
        </div>
    </section>


     <button onclick="window.location.href='#top'" style="color: black; box-shadow: rgb(204, 219, 232) 3px 3px 6px 0px inset, rgba(255, 255, 255, 0.5) -3px -3px 6px 1px inset;">위로가기</button>


</main>
    
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="../../../../resources/kdy/js/detailHTML.js"></script>
<script type="text/javascript">

    $("#shopContents").summernote(
            {
                    height: 260,                
                    minHeight: null,           
                    maxHeight: null,          
                    focus: true 

                });
                $('#shopContents').summernote({
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
<script>
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.480324403851085, 126.88364153429607), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();



var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
searchAddrFromCoords(map.getCenter());

// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            let detailAddr = !!result[0].road_address ? '<div>' + result[0].road_address.address_name + '</div>' : '';
            // console.log(result[0].road_address.address_name);
            let sa = result[0].road_address.address_name;
            // console.log('SA : '+sa);



            let content = '<div class="bAddr"> ' + detailAddr + '</div>';

            const shopAddress = document.querySelector("#shopAddress");
            
            shopAddress.value=sa;
            // ${'#shopAddress'}.val(sa);
            console.log(shopAddress);

            // 마커를 클릭한 위치에 표시합니다 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
            infowindow.setContent(content);
            infowindow.open(map, marker);
        }   
    });
});

// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter());
});

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        // for(var i = 0; i < result.length; i++) {
        //     // 행정동의 region_type 값은 'H' 이므로
        //     if (result[i].region_type === 'H') {
        //         infoDiv.innerHTML = result[i].address_name;
        //         break;
        //     }
        // }
    }    
}
   </script>
  <!-- ===================================================================================================================================================== -->
  <script>
    // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
    mapOption = {
      center: new kakao.maps.LatLng(37.480324403851085, 126.88364153429607), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다
ps.keywordSearch(value="${detail.shopAddress}", placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[0]);    
            bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        // infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        // infowindow.open(map, marker);
    });
}
  </script>
<script>
  function goBack() {
      window.history.back();
  }
  </script>
<c:import url="../../template/footerHTML.jsp"></c:import>
</body>
</html>