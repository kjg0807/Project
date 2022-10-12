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
    <link rel="stylesheet" href="../../../../resources/kdy/css/list.css">
    <%-- Bootstrap CSS --%>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <!-- jquery -->
      <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
      <!-- include summernote css/js-->
       <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
       <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
       <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c971ac6c7712b0e728a1ba2df98cf0fd"></script>
       <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c971ac6c7712b0e728a1ba2df98cf0fd&libraries=services"></script> -->

       
  </head>
<body>
<c:import url="../../template/headerHTML.jsp"></c:import>
<main class="realMain" id="realMain">
        
  <div class="container" style="padding-top: 80px; box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
 
            <div class="c1">
                맛집 리뷰
            </div>
                <div class="d-flex flex-row mb-3" id="cccc"   style="cursor: pointer; box-shadow: rgba(0, 0, 0, 0.45) 0px 25px 20px -20px;">
                    <div class="p-2 a" data-miniCategory="">전체</div>
                    <div class="p-2 a" data-miniCategory="한식">한식</div>
                    <div class="p-2 a" data-miniCategory="중식">중식</div>
                    <div class="p-2 a" data-miniCategory="일식">일식</div>
                    <div class="p-2 a" data-miniCategory="분식">분식</div>
                    <div class="p-2 a" data-miniCategory="양식">양식</div>
                    <div class="p-2 a" data-miniCategory="아시안">아시안</div>
                </div>

                <div d-flex>
                <c:choose>
                  <c:when  test="${sessionScope.member.classDTOs.get(0).className eq 'admin'}">
                    <div class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap" role="add" onclick="listAddCheck();">가게등록</div>
                  </c:when>
                <c:otherwise>
                  <!-- <div class="btn btn-secondary" data-bs-toggle="modal" data-bs-whatever="@getbootstrap" id="add"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                    <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"/>
                  </svg> &ensp;&ensp;가게등록</div> -->
                 
                </c:otherwise>
                </c:choose>

                <div class="row" >
                  <form action="./listHTML"  class="row row-cols-lg-auto g-3 align-items-center justify-content-center" >
                    <div class="col-12">
                      <label class="visually-hidden" for="kind" id="select">Kind</label>
                      <select  name="kind" class="form-select" id="kind">
                        <option class="kinds" value="shopName">식당</option>
                        <option class="kinds" value="menuName">음식</option>
                        <option class="kinds" value="shopAddress">주소</option>
                      </select>
                    </div>

                    <div class="col-12">
                      <label class="visually-hidden" for="search">검색어</label>
                      <div class="input-group">
                        <input type="text" name="search" value="${param.search}" var="" class="form-control" id="search" placeholder="검색어를 입력해 주세요">
                        <button type="submit" class="btn btn-secondary" id="searchNull">검색</button>
                      </div>
                    </form>
                </div>
                </div>
        
                <c:forEach items="${requestScope.list}" var="list">    
                  <c:choose>
                    <c:when test="${member == null}">
                        <div class="shop_list detailHTMLList">
                          <div class="list" style="box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px" >
                              <div style="border-bottom: solid 1px gainsboro; height: 200px;" >
                                  <div class="d-flex">
                                      <div class="p-2 w-100" >
                                          <div class="container2" style="padding: 12px;">
                                              <div class="name">${list.shopName}</div>
                                              <div class="shopContents">${list.shopTitle}</div>
                                              <div class="shopContents2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                                                <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
                                              </svg>&ensp;&ensp;${list.shopAddress}</div>
                                              <c:forEach items="${list.categoryDTOs}" var="category">
                                                <div class="p-2 b" style="color: black;"># ${category.categoryName}</div>
                                              </c:forEach>   
                                              
                                          </div>
                                          <div class="d-flex flex-row mb-3 mt-2" style="cursor: pointer;">
                                              <div class="p-2 b">SHOP NAME : ${list.shopName}</div>
                                              <div class="p-2 b"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                                                <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
                                              </svg>&ensp;&ensp;${list.shopAddress}</div>
                                              <div class="p-2 b"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-wechat" viewBox="0 0 16 16">
                                                <path d="M11.176 14.429c-2.665 0-4.826-1.8-4.826-4.018 0-2.22 2.159-4.02 4.824-4.02S16 8.191 16 10.411c0 1.21-.65 2.301-1.666 3.036a.324.324 0 0 0-.12.366l.218.81a.616.616 0 0 1 .029.117.166.166 0 0 1-.162.162.177.177 0 0 1-.092-.03l-1.057-.61a.519.519 0 0 0-.256-.074.509.509 0 0 0-.142.021 5.668 5.668 0 0 1-1.576.22ZM9.064 9.542a.647.647 0 1 0 .557-1 .645.645 0 0 0-.646.647.615.615 0 0 0 .09.353Zm3.232.001a.646.646 0 1 0 .546-1 .645.645 0 0 0-.644.644.627.627 0 0 0 .098.356Z"/>
                                                <path d="M0 6.826c0 1.455.781 2.765 2.001 3.656a.385.385 0 0 1 .143.439l-.161.6-.1.373a.499.499 0 0 0-.032.14.192.192 0 0 0 .193.193c.039 0 .077-.01.111-.029l1.268-.733a.622.622 0 0 1 .308-.088c.058 0 .116.009.171.025a6.83 6.83 0 0 0 1.625.26 4.45 4.45 0 0 1-.177-1.251c0-2.936 2.785-5.02 5.824-5.02.05 0 .1 0 .15.002C10.587 3.429 8.392 2 5.796 2 2.596 2 0 4.16 0 6.826Zm4.632-1.555a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Zm3.875 0a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Z"/>
                                              </svg>&ensp;&ensp;${list.hit}</div>
                                            </div>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                    </c:when>

                <c:otherwise>
                    <div class="shop_list"  onclick="location.href='/shop/detailHTML?shopNum=${list.getShopNum()}';">
                    <div class="list" style="box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px" >
                        <div style="border-bottom: solid 1px gainsboro; height: 200px;" >
                            <div class="d-flex">
                                <div class="p-2 w-100" >
                                    <div class="container2" style="padding: 12px;">
                                        <div class="name">${list.shopName}</div>
                                        <div class="shopContents">${list.shopTitle}</div>
                                        <div class="shopContents2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                                          <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
                                        </svg>&ensp;&ensp;${list.shopAddress}</div>
                                        <c:forEach items="${list.categoryDTOs}" var="category">
                                          <div class="p-2 b" style="color: black;"># ${category.categoryName}</div>
                                        </c:forEach>   
                                    </div>
                                    <div class="d-flex flex-row mb-3 mt-2" style="cursor: pointer;">
                                        <div class="p-2 b">SHOP NAME : ${list.shopName}</div>
                                        <div class="p-2 b"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                                          <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
                                        </svg>&ensp;&ensp;${list.shopAddress}</div>
                                        <div class="p-2 b"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-wechat" viewBox="0 0 16 16">
                                          <path d="M11.176 14.429c-2.665 0-4.826-1.8-4.826-4.018 0-2.22 2.159-4.02 4.824-4.02S16 8.191 16 10.411c0 1.21-.65 2.301-1.666 3.036a.324.324 0 0 0-.12.366l.218.81a.616.616 0 0 1 .029.117.166.166 0 0 1-.162.162.177.177 0 0 1-.092-.03l-1.057-.61a.519.519 0 0 0-.256-.074.509.509 0 0 0-.142.021 5.668 5.668 0 0 1-1.576.22ZM9.064 9.542a.647.647 0 1 0 .557-1 .645.645 0 0 0-.646.647.615.615 0 0 0 .09.353Zm3.232.001a.646.646 0 1 0 .546-1 .645.645 0 0 0-.644.644.627.627 0 0 0 .098.356Z"/>
                                          <path d="M0 6.826c0 1.455.781 2.765 2.001 3.656a.385.385 0 0 1 .143.439l-.161.6-.1.373a.499.499 0 0 0-.032.14.192.192 0 0 0 .193.193c.039 0 .077-.01.111-.029l1.268-.733a.622.622 0 0 1 .308-.088c.058 0 .116.009.171.025a6.83 6.83 0 0 0 1.625.26 4.45 4.45 0 0 1-.177-1.251c0-2.936 2.785-5.02 5.824-5.02.05 0 .1 0 .15.002C10.587 3.429 8.392 2 5.796 2 2.596 2 0 4.16 0 6.826Zm4.632-1.555a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Zm3.875 0a.77.77 0 1 1-1.54 0 .77.77 0 0 1 1.54 0Z"/>
                                        </svg>&ensp;&ensp;${list.hit}</div>
                                      </div>
                                </div>
                                 <div class="p-2 flex-shrink-1">
                                  <div class="mt-2" id="img" style="height: 200px; width: 310px">
                                    <c:forEach items="${list.shopFileDTOs}" var="shopFileDTO">               
                                      <img src="../../../../resources/upload/shop/${shopFileDTO.fileName[0]}" style="width: 300px;">
                                    </c:forEach>
                                  </div>
                              </div>
                            </div>
                        </div>
                    </div>
                </div>
            
            </c:otherwise>
          </c:choose>

            <div>
              <input name="shopNum" type="hidden" id="shopNum" value="${list.shopNum}">
              <input name="userID" type="hidden" id="userID" value="${list.userID}">
            </div> 
      </c:forEach>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" id="modal_size">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">++가게 등록++</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="/shop/add" method="post" enctype="multipart/form-data" id="listAddForm">

          <div class="mb-3" id="caNum">
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
            <label for="message-text" class="col-form-label"></label>
            <div id="inputShopPhoneResult" style="color: red;"></div>
            <input type="text" class="form-control" placeholder="식당의 전화번호를 입력해주세요" name="shopPhone" id="shopPhone">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label"> </label>
            <div id="inputShopNameResult" style="color: red;"></div>
            <input type="text" class="form-control" placeholder="식당의 상호명을 입력해주세요" name="shopName" id="shopName">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label"> </label>
            <div id="inputShopAddressResult" style="color: red;"></div>
           <input type="text" class="form-control" placeholder="식당의 주소를 직접 입력해주세요" name="shopAddress" id="shopAddress">
          </div>
          <!-- <div class="mb-3" id="map" style="width:550px;height: 300px; ">
            <label for="message-text" class="col-form-label"> </label>
            <input type="text" class="form-control" name="shopAddress" id="shopAddress" >
          </div> -->
          <div class="mb-3">
            <label for="message-text" class="col-form-label"> </label>
            <div id="inputPriceAvgResult"  style="color: red;"></div>
            <input type="text" class="form-control" placeholder="식당의 가격대를 입력해주세요" name="priceAvg" id="priceAvg">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label"></label>
            <input type="text" class="form-control" placeholder="식당의 배달비를 입력해주세요" name="delivery" id="delivery">
          </div>
          <div class="mt-1">
            <div ><label  for="exampleFormControlInput1">글내용</label></div>
            <div id="inputShopContentsResult"  style="color: red;"></div>
            <textarea name = "shopContents" class="form-control mt-1" id="shopContents" rows="3"></textarea>
        </div>
        <div class="mb-3">
          <label for="recipient-name" class="col-form-label"></label>
          <div id="inputShopTitleResult"  style="color: red;"></div>
          <input type="text" class="form-control" placeholder="제목을 입력해주세요" name="shopTitle" id="shopTitle">
        </div>
        <!-- <div class="mb-3">
          <label for="recipient-name" class="col-form-label"></label>
          <input type="text" class="form-control" placeholder="hit" name="hit" id="hit">
        </div> -->
        

        <div id="addFiles">
          <button style="color: blue;" type="button"name="files" id="fileAdd">파일추가</button>
        </div>

        </div>
        <div class="modal-footer file_box" id="modal-footer">
          <button type="button" class="btn btn-secondary upload-name" data-bs-dismiss="modal" id="close">취소</button>
          <button type="button" class="btn btn-primary" id="listAddButton">등록</button>
          
        </div>
        </form>
      </div>
    </div>
  </div>

 </div>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="mb-3" id="map" style="width:550px;height: 300px;"></div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
          </div>
        </div>
      </div>
    </div>
   

</main>
<div style="display: flex; margin: 100px; height: 40px;  justify-content: center;">
  <nav aria-label="Page navigation example">
    <ul class="pagination">
       <c:if test="${shopPager.pre}">
         <li class="page-item">
           <a class="page-link" href="./listHTML?shopPage=${shopPager.startNum-1}&kind=${shopPager.kind}&search=${shopPager.search}" aria-label="Previous">
             <span aria-hidden="true">&laquo;</span>
           </a>
         </li>
      </c:if>
      
      <c:forEach begin="${shopPager.startNum}" end="${shopPager.lastNum}" var="i">
             <li class="page-item"><a class="page-link" href="./listHTML?shopPage=${i}&kind=${shopPager.kind}&search=${shopPager.search}">${i}</a></li>
      </c:forEach>
     <li class="page-item ${shopPager.next?'':'disabled'}">
        <a class="page-link" href="./listHTML?shopPage=${shopPager.lastNum+1}&kind=${shopPager.kind}&search=${shopPager.search}" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
        </a>
      </li>
    </ul>
  </nav>
</div>
  <c:import url="../../template/footerHTML.jsp"></c:import>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
  <script src="../../../../resources/kdy/js/shop_files.js"></script>
  <script src="../../../../resources/kdy/js/list.js"></script>

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

<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=abf31ecaa88152d20b1faa70bc69a3d1&libraries=services,clusterer,drawing"></script>
<script>


var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.480324403851085, 126.88364153429607), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };  


// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//setTimeout(function(){ map.relayout(); }, 1);

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
    
    
  }    
}

const add = document.getElementById("add");
add.addEventListener("click", function(){

  map = new kakao.maps.Map(mapContainer, mapOption); 
});


</script>  -->




</body>
</html>