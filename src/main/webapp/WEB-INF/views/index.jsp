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
        <link rel="stylesheet" href="./styles.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/kdy/css/styles.css">
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <c:import url="./template/headerHTML.jsp"></c:import>
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
               <div class="text-center text-white">
                  <h1 class="display-4 fw-bolder">Shop in style</h1>
                  <p class="lead fw-normal text-white-50 mb-0">With this shop hompeage template</p>
                  
                  <!-- <fieldset class="main-search" style= "margin-top: 35px;">
                    <label for="main-search" class="search-word">
                        <input type="text" id="main-search" class="HomeSearchInput" name="main-search" maxlength="50" placeholder="지역, 식당 또는 음식" autocomplete="off">
                    </label>
                    <input type="submit" class="btn-search" value="검색">
                  </fieldset> -->
                  <div class="row">
                    <form action="./shop/listHTML"  class="row row-cols-lg-auto g-3 align-items-center justify-content-center">
                      <div class="col-12">
                        <label class="visually-hidden" for="kind" id="select">Kind</label>
                        <select  name="kind" class="form-select" id="kind">
                          <option class="kinds" value="shopName">식당</option>
                          <option class="kinds" value="menuName">음식</option>
                          <option class="kinds" value="shopAddress">주소</option>
                        </select>
                        <!-- kind란 이름으로 넘어감 -->
                      </div>
                      
                      <div class="col-12">
                        <label class="visually-hidden" for="search">검색어</label>
                        <div class="input-group">
                          <input type="text" name="search" value="${param.search}" var="" class="form-control" placeholder="검색어를 입력해 주세요">
                        </div>
                      </div>
                    
                      <div class="col-12">
                        <button type="submit" class="btn btn-secondary">검색</button>
                      </div>
                    </form>
                </div>
               
                </div>
            </div>
         </header>
        <!-- Section-->
        <section class="py-5 nn">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">전 체</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">한 식</h5>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">중 식</h5>                             
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">일 식</h5>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5">
                        <div class="card h-100">

                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">분 식</h5>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">양 식</h5>
                                </div>
                            </div>     
                        </div>
                    </div> 
                    
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
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
            </div>
		<a href="./chat/chat">chat</a>
		<a href="./party/list">list</a>
        </section>

       
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <c:import url="./template/footerHTML.jsp"></c:import>
    </body>
</html>
