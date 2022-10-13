<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="stylesheet" href="../../resources/kdy/css/styles.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/kdy/css/styles.css">
        <link rel="stylesheet" href="../../resources/kdy/css/index.css">
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../../resources/kdy/css/styles.css" rel="stylesheet" />
    </head>
    <body style="background-color: rgb(206, 232, 255);" >
        <c:import url="./template/headerHTML.jsp"></c:import>
        <header style="box-shadow: rgba(0, 0, 0, 0.45) 0px 25px 20px -20px;">

            <div style="position: relative;">
                <img src="../../resources/kdy/images/GettyImages-505408442.webp" style="width: 100%; height: 40%; ">
            
                <div class="container px-4 px-lg-5 my-5" style="position: absolute; bottom: 150px; left: 15%;">
                   <div class="text-center text-white" >
                      <h1 class="display-4 fw-bolder" style="color: rgb(255, 255, 255); font-size: 80px;" readonly="readonly">구디의 맛집 리스트</h1>
    
                      <div class="row" style="padding-bottom: 25px; font-size: 45px;">
                        <form action="./shop/listHTML"  class="row row-cols-lg-auto g-3 align-items-center justify-content-center">
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
                           </div>
                          </form>
                      </div>
                    </div>
                </div>
                </div>
         </header>
        <!-- Section-->
        <section class="" style="margin-top: 40px;">
            <div class="container px-4 px-lg-5 mt-2" style="border-radius: 30px; background-color: aliceblue; box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;">
                <div class="d-flex justify-content-between pt-4 pb-3">
                    <div style="color: rgb(109, 148, 255); "><b>믿고 보는 맛집 리스트</b></div>
                </div>
                <div  class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center" id="tttt" style="box-shadow: rgba(0, 0, 0, 0.45) 0px 25px 20px -20px;">

                    <div class="col mb-5" data-category="" >
                        <div class="card h-100 cs" id="al">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/350x250/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">전 체</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col mb-5" data-category="한식">
                        <div class="card h-100 categorykor" id="categoryName" name="categoryName" style=" border-radius: 10px;">
                            <button type="submit" style="display: none;"></button>
                            <!-- Product image-->
                            <img class="card-img-top" src="../../resources/kdy/images/korea.jpg" alt="..." value="한식" />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">한 식</h5>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5" data-category="중식">
                        <div class="card h-100 cs" style="border-radius: 10px;">
                            <!-- Product image-->
                            <img class="card-img-top" src="../../resources/kdy/images/china.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">중 식</h5>                             
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5" data-category="일식">
                        <div class="card h-100 cs"style="border-radius: 10px;">
                            <!-- Product image-->
                            <img class="card-img-top" src="../../resources/kdy/images/jap.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">일 식</h5>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5" data-category="분식">
                        <div class="card h-100 cs"style="border-radius: 10px;">
                            <!-- Product image-->
                            <img class="card-img-top" src="../../resources/kdy/images/bun.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">분 식</h5>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5" data-category="양식">
                        <div class="card h-100 cs" style="border-radius: 10px;">
                            <!-- Product image-->
                            <img class="card-img-top" src="../../resources/kdy/images/yang.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">양 식</h5>
                                </div>
                            </div>     
                        </div>
                    </div> 
                    
                    <div class="col mb-5" data-category="아시안">
                        <div class="card h-100 cs" style="border-radius: 10px;">
                            <!-- Product image-->
                            <img class="card-img-top" src="../../resources/kdy/images/ssal.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">아 시 안</h5> 
                                </div>
                            </div>
                            <!-- Product actions-->
                        </div>
                    </div> 
                </div>
                <!-- <div style="border-bottom: solid 1px gainsboro; height: 200px;"><span>조회수 높은 식당 TOP10</span></div> -->
                <div  style="border-bottom: solid 1px black; height: 100px;" id="hitList" class="mainList">조회수 높은 식당 TOP5</div>
                <div>
                        <c:forEach items="${list}" var="list">

                            <div class="shop_list"  onclick="location.href='/shop/detailHTML?shopNum=${list.getShopNum()}';">

                                <div class="list" style="box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px" >

                                    <div style="border-bottom: solid 1px gainsboro; height: 200px;" >

                                        <div class="d-flex">

                                            <div class="p-2 w-100" style="height: 150px;">

                                                <div class="container2" style="padding: 12px;">
                                                    <div class="name">${list.shopName}</div>
                                                    <div class="shopContents">${list.shopTitle}</div>
                                                    <div class="shopContents2">${list.shopAddress}</div>
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
                            <div>
                            <input name="shopNum" type="hidden" id="shopNum" value="${list.shopNum}">
                            </div> 
                    </c:forEach>
                    <!-- 위로보내주는 버튼 -->
                    <br>
                    <div style="padding-bottom: 25px;">
                    <button onclick="window.location.href='#top'" style="padding-bottom: 35px; color: black; box-shadow: rgb(204, 219, 232) 3px 3px 6px 0px inset, rgba(255, 255, 255, 0.5) -3px -3px 6px 1px inset;">위로가기</button>
                    </div>
                </div>
                
            </div>
        </section>

       
        <!-- Bootstrap core JS-->
        <script src="../../resources/kdy/js/index.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <!-- <script src="js/scripts.js"></script> -->
        <c:import url="./template/footerHTML.jsp"></c:import>
    </body>
</html>
