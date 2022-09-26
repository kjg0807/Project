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

       
  </head>
<body>
<c:import url="../../template/headerHTML.jsp"></c:import>
<main class="realMain" id="realMain">
        
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
                                    <img src="../../../../resources/kdy/images/hma.jpg" style="width: 300px;">
<!-- 
                                    <div class="mt-2" id="img" style="height: 200px; width: 310px">
                                      <c:forEach items="${list.shopFileDTOs}" var="shopFileDTO">  
                                        <img src="../../../../resources/upload/shop/${shopFileDTO.fileName}" style="width: 300px;">
                                      </c:forEach> 
                                      </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div>
              <input name="shopNum"  id="shopNum" value="${list.shopNum}">
            </div> 
      </c:forEach>
		<div class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap" role="add" >가게등록</div>
		
		<!--  -->

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">++가게 등록++</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <!-- <form> -->

          <div class="mb-3">
            <label for="message-text" class="col-form-label"> </label>
           <input type="text" class="form-control" placeholder="카테고리" name="categoryNum" id="categoryNum">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label"></label>
            <input type="text" class="form-control" placeholder="식당의 전화번호를 입력해주세요" name="shopPhone" id="shopPhone">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label"> </label>
           <input type="text" class="form-control" placeholder="식당의 상호명을 입력해주세요" name="shopName" id="shopName">
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label"> </label>
           <input type="text" class="form-control" placeholder="식당의 주소를 입력해주세요" name="shopAddress" id="shopAddress">
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
          <!-- <div class="mb-3" id="addFiles">
            <i class="fa-regular fa-image"></i>
            <label for="message-text" class="col-form-label"></label>
            <button type="submit" id="fileAdd">이미지</button>
          </div> -->

          <div id="addFiles" class="mb-3">
            <i class="fa-regular fa-image"></i>
            <label for="message-text" class="col-form-label"></label>
              <input type="file" name="files" id="fileAdd">파일
          </div>

        </div>
        <!-- </form> -->
        <div class="modal-footer file_box" id="modal-footer">
          <button type="button" class="btn btn-secondary upload-name" data-bs-dismiss="modal" id="close">취소</button>
          <button type="button" class="btn btn-primary" id="btn">등록</button>
          
        </div>
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
  <c:import url="../../template/footerHTML.jsp"></c:import>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
  <script src="../../../../resources/kdy/js/shopAdd.js"></script>
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
   });
       
  
  </script>

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

</body>
</html>