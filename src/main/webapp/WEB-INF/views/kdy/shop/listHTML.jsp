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
        
  <div class="container">
 
            <div class="c1">
                맛집 리뷰
            </div>
                <div class="d-flex flex-row mb-3" id="cccc">
                    <div class="p-2 a" data-miniCategory="">전체</div>
                    <div class="p-2 a" data-miniCategory="한식">한식</div>
                    <div class="p-2 a" data-miniCategory="중식">중식</div>
                    <div class="p-2 a" data-miniCategory="일식">일식</div>
                    <div class="p-2 a" data-miniCategory="분식">분식</div>
                    <div class="p-2 a" data-miniCategory="양식">양식</div>
                    <div class="p-2 a" data-miniCategory="아시안">아시안</div>
                </div>
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
                                  <img src="../../../../resources/upload/shop/${shopFileDTO.fileName}" style="width: 300px;">
                              </div>
                          </div>
                        </div>
                    </div>
                </div>
            </div>
            <div>
              <input name="shopNum" type="hidden" id="shopNum" value="${list.shopNum}">
            </div> 
      </c:forEach>
    
		<div class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap" role="add">가게등록</div>
		<!-- <div id="map" style="width:500px;height:400px;"></div> -->
		
		<!--  -->

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">++가게 등록++</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="/shop/add" method="post" enctype="multipart/form-data">

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
            <input type="text" class="form-control" placeholder="식당의 전화번호를 입력해주세요" name="shopPhone" id="shopPhone">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label"> </label>
           <input type="text" class="form-control" placeholder="식당의 상호명을 입력해주세요" name="shopName" id="shopName">
          </div>
          <div class="mb-3" id="map" style="width:500px;height:400px;">
            <label for="message-text" class="col-form-label"> </label>
            <input type="text" class="form-control" name="shopAddress" value="shopAddress" id="shopAddress" >
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label"> </label>
            <input type="text" class="form-control" placeholder="식당의 가격대를 입력해주세요" name="priceAvg" id="priceAvg">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label"></label>
            <input type="text" class="form-control" placeholder="식당의 배달비를 입력해주세요" name="delivery" id="delivery">
          </div>
          <div class="mt-1">
            <div ><label  for="exampleFormControlInput1">글내용</label></div>
            <textarea name = "contents" class="form-control mt-1" id="contents" rows="3"></textarea>
        </div>
        <div class="mb-3">
          <label for="recipient-name" class="col-form-label"></label>
          <input type="text" class="form-control" placeholder="제목을 입력해주세요" name="title" id="title">
        </div>
        <!-- <div class="mb-3">
          <label for="recipient-name" class="col-form-label"></label>
          <input type="text" class="form-control" placeholder="hit" name="hit" id="hit">
        </div> -->
        

          <div id="addFiles" class="mb-3">
            <i class="fa-regular fa-image"></i>
            <label for="message-text" class="col-form-label"></label>
              <input type="file" name="files" id="fileAdd">파일
          </div>

        </div>
        <div class="modal-footer file_box" id="modal-footer">
          <button type="button" class="btn btn-secondary upload-name" data-bs-dismiss="modal" id="close">취소</button>
          <button type="submit" class="btn btn-primary" id="btn">등록</button>
          
        </div>
        </form>
      </div>
    </div>
  </div>
 </div>
		<!--  -->
   

</main>
<div style="display: flex; margin: 5 5px;  justify-content: center;">
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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=abf31ecaa88152d20b1faa70bc69a3d1&libraries=services,clusterer,drawing"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.480324403851085, 126.88364153429607), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
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
 
    

</body>
</html>