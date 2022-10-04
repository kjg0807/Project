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


                        <div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">                     
                                <div class="modal-dialog">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">게시글 수정</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                        <form action="/shop/update" method="post" enctype="multipart/form-data">
                                        
                                    <div class="modal-body">
                                            <input type="hidden" id="shopNum" name="shopNum" value="${detail.shopNum}">  
                                            <div class="mb-3">
                                              <label for="recipient-name" class="col-form-label"></label>
                                              식당 이름 수정  <input type="text" class="form-control" name="shopName" value="${detail.shopName}">
                                            </div>
                                            
                                            <!-- <div class="mb-3">
                                              <label for="recipient-name" class="col-form-label"></label>
                                              식당의 카테고리 수정  <input type="text" class="form-control" name="categoryNum" value="${detail.categoryNum}">
                                            </div> -->
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
                                              <label for="recipient-name" class="col-form-label"></label>
                                              가게 전화번호 수정  <input type="text" class="form-control" name="shopPhone" value="${detail.shopPhone}">
                                            </div>
                                          <!-- <div class="mb-3">
                                            <label for="recipient-name" class="col-form-label"></label>
                                            가게 주소 수정  <input type="text" class="form-control" name="shopAddress" value="${detail.shopAddress}">
                                          </div> -->
                                          <div class="mb-3">
                                            <label for="message-text" class="col-form-label"> </label>
                                            가게 주소 수정<input type="text" class="form-control" value="${detail.shopAddress}" name="shopAddress">
                                          </div>
                                          <div class="mb-3" id="map" style="width:500px;height:400px;">
                                            <label for="message-text" class="col-form-label"> </label>
                                            <input type="text" class="form-control" name="shopAddress" id="shopAddress" >
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
											<c:forEach items="${detail.shopFileDTOs}" var="fileDTO">
												<div class="mb-3">
                          <img class="flex image" style="width: 380px; height: 380px;" src="../../../../resources/upload/shop/${fileDTO.fileName}">
													<button type="button" class="fileDelete" data-file-num="${fileDTO.fileNum}" style="color: red;"> Delete </button>
												</div>
											</c:forEach>
<!-- 			
											<div id="addFiles" class="mb-3">
                        <i class="fa-regular fa-image"></i>
                        <label for="message-text" class="col-for m-label"></label>
                        <input type="file" name="files" id="fileAdd">파일
                      </div> -->

                      <div id="addFiles">
                        <button style="color: red;" type="button"name="files" id="fileAdd">파일추가</button>
                      </div>
							</div>
                                    
                                    <div class="modal-footer">
                                        <div class="dy flex" id="shopDelete" style="color: red;" onclick="location.href='/shop/delete?shopNum=${detail.getShopNum()}';">&ensp;가게 삭제</div>
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
        <c:forEach items="${detail.categoryDTOs}" var="category">
          <div style="color: gray;">&ensp;&ensp;${category.categoryName}</div>
        </c:forEach>
			</div>
      <div>
        <span class="cnt hit" style="font-size: 5px;">
          <ion-icon name="eye-outline"></ion-icon>
        </span>
      </div>
    


			<div class="Information">

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
          <div class="dy flex" id="deleteMenu"  onclick="location.href='/shop/deleteMenu?menuNum=${menuDTO.menuNum}&shopNum=${detail.shopNum}';">&ensp;대표메뉴삭제</div>
				</c:forEach>

      </div>
      <div class="side-wrap" id="map2" style="width:350px;height:350px;"></div>
        <!-- <c:forEach items="${detail.menuDTOs}" var="menuDTO">
          <div class="d-flex q" id="menu" onclick="">대표메뉴 &ensp;&ensp;&nbsp;:
            <div class="flex q" id="realmenu">&ensp;&ensp;&ensp;${menuDTO.menuName}</div>
						<div class="flex q" id="realmenu">&ensp;&ensp;&ensp;${menuDTO.menuPrice}원</div>
					</div>
				</c:forEach> -->
        <!-- 대표메뉴 추가 -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1" data-bs-whatever="@mdo">게시글 수정</button>
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
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
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
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
  </script> 

<c:import url="../../template/footerHTML.jsp"></c:import>
</body>
</html>