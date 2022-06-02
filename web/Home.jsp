
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CLOTHING SHOP</title>
        <!--Favicon-->
        <link rel="icon" type="image/x-icon" href="img/logo.PNG" />
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!--Using Bootstrap-->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/6c7ad27b5d.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="./css/grid.css">
        <link rel="stylesheet" href="./css/base.css">
        <link rel="stylesheet" href="./css/main.css">
        <link rel="stylesheet" href="./css/responsive.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"
            integrity="sha512-NhSC1YmyruXifcj/KFRWoC561YpHpc5Jtzgvbuzx5VozKpWvQ+4nXhPdFgmx8xqexRcpAglTj9sIBWINXa8x5w=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./assets/font/fontawesome-free-5.15.4-web/css/all.min.css">
        <style>
            .search-tab{
                margin-top: 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .page-number{
                margin-right: 10px;
                border-radius: 5px;
            }
            .input-search{
                width: 600px !important;
                height: 42px !important;
            }
            
            .search-home{
                color: #fff;
                background-color: #17A2B8; 
                padding: 10px;
                margin-left: 10px;
                border-radius: 5px;    
            }
            .search-cart:hover,
            .search-button:hover,
            .search-home:hover{
                opacity: 0.8;
                color: #fff;
                text-decoration: none;
                background-color: #17A2B8; 
            }
            .icon-cart{
                margin-right: 10px;
            }
            .search-cart,
            .search-button{
                background-color: #17A2B8;
                color: #fff;
            }
            .cart-item{
                margin-bottom: 40px !important;
                border-radius: 20px;
                overflow: hidden;
            }
            .cart-name{
                color: #000 !important;
            }
            .btn-price{
                background-color: #17A2B8;
                color: #fff;
            }
            .card-body{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <!--Split Home page to many JSP pages for easier managing-->
        <jsp:include page="Menu.jsp"></jsp:include>
            <section class="text-center" style="background-color: white;">
                <div class="container-fluid" style="background-image: url('https://tracuuthansohoc.com/wp-content/uploads/2021/07/ten-shop-quan-ao-hay-3_compressed-800x321.jpg'); height: 400px;background-size: cover">
                </div>
            </section>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb search-tab">
                                <li style="margin-right: 20px"><a class="search-home" href="home">Home</a></li>
                            
                            <li style="margin-right: 20px">
                                <form class="form-inline my-2 my-lg-0" action="search" method="post">
                                        <input class="form-control mr-sm-2 input-search" type="search" placeholder="Search" aria-label="Search..." oninput="searchByName(this)" value="${txtS}" name="txt">
                                        <button class="btn btn-dark my-2 my-sm-0 search-button" type="submit">Search</button>
                                    </form>
                            </li>
                                <li style="margin-right: 20px">
                                    <a class="btn btn-dark btn-sm ml-3 search-cart" href="show" style="height: 30px; padding-top: 2px">
                                        <i class="fas fa-shopping-cart icon-cart"></i> BUY
                                        <span class="badge badge-light">${c.countNumCart(sessionScope.acc.id)}</span>
                                    
                                </a>

                            </li>
                            <!--<li class="breadcrumb-item active" aria-current="page">${CateName}</li>-->
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <jsp:include page="Left.jsp"></jsp:include>

                    <div class="col-sm-6">
                        <div class="row" id="content">
                            <!--List Product-->
                        <c:forEach items="${listP}" var="o">
                            <div class="col-12 col-md-6 col-lg-4">
                                <div class="card cart-item">
                                    <!--Product's image-->
                                    <a href="detail?ProductID=${o.id}" title="View Product"><img class="card-img-top" src="${o.imageLink}" alt="Card image cap"></a>
                                    <div class="card-body">
                                        <!--Product's name. Onlick: Product's Detail-->
                                        <h4 class="card-title show_txt"><a class="cart-name" href="detail?ProductID=${o.id}" title="View Product">${o.name}</a></h4>
                                        <div class="row">
                                            <div class="col">
                                                <!--Product's Price-->
                                                <p class="btn btn-price">${o.priceWithDot} VND</p>
                                            </div>
<!--                                            <div class="col">
                                                <a onclick="addCart(${o.id})" class="btn btn-dark" style="color: white">Add to buy</a>
                                            </div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="clearfix">
                        <!--<div class="hint-text">Showing <b>6</b> out of <b>${count}</b> entries</div>-->
                        <ul class="pagination">
                            <li class="page-item paging active"><a onclick="load(this, 1, ${CategoryID})"  class="page-link page-number">1</a></li>
                                <c:forEach begin="2" end="${end}" var="i">
                                <li class="page-item paging"><a onclick="load(this, ${i}, ${CategoryID})"  class="page-link page-number">${i}</a></li>
<!--<li class="page-item"><a style="cursor:pointer" onclick="load(${i}, ${CategoryID})" >${i}</a></li>-->   
<!--<li class="page-item ${tag == i?"active":""}"><a href="home?index=${i}&CategoryID=${CategoryID}" class="page-link">${i}</a></li>-->
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <jsp:include page="Right.jsp"/>
            </div>
        </div>

        <jsp:include page="Footer.jsp"></jsp:include>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script>
                                    function load(a_link, index, CateID) {
                                        var arr = document.getElementsByClassName('paging');
                                        for (var i = 0; i < arr.length; i++) {
                                            arr[i].classList.remove("active");
                                        }

                                        a_link.parentElement.classList.add("active");
                                        //Sử dụng Ajax
                                        $.ajax({
                                            url: "/Assignment_ElectronicShop_Pro/paging",
                                            type: "get", //send it through get method
                                            data: {
                                                index: index,
                                                CategoryID: CateID
                                            },
                                            success: function (responseData) {
                                                //Trg hợp này: Có dữ liệu trả về -> responseData là dữ liệu trả về
                                                //Dữ liệu trả về ko phải 1 List mà là từng khối <div>
                                                //Bao quanh tất cả các khối <div> sản phẩm là 1 khối div "content" => sửa ở đây
                                                document.getElementById("content").innerHTML = responseData;
                                            }
                                        });
                                    }


                                    function addCart(ProductID) {
            <c:if test="${sessionScope.acc != null}">
                                        //Sử dụng Ajax
                                        $.ajax({
                                            url: "/Assignment_ElectronicShop_Pro/addToCart",
                                            type: "get", //send it through get method
                                            data: {
                                                ProductID: ProductID
                                            },
                                            success: function (message) {
                                                alert(message);
                                            },
                                            error: function () {
                                            }
                                        });
            </c:if>
            <c:if test="${sessionScope.acc == null}">
                                        location.href = "login";
            </c:if>
                                    }
                                
        </script>  
    </body>
</html>
