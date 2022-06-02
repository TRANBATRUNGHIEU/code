

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flower shop</title>
    </head>
    <body>
        <div class="col-sm-1">

        </div>
        <div class="col-sm-2">
            <div class="card bg-light mb-3">
                <div class="card-header bg-info text-white text-uppercase"><i class="fas fa-bars"></i> Phân loại</div>
                <ul class="list-group category_block">
                    <c:forEach items="${allCategory}" var="o">
                        <!--Category nao dang dc chon thi se noi bat-->                       
                        <li class="list-group-item text-white ${CateID == o.id ? "category" : ""}">
                            <i class="fas fa-chevron-right"></i>
                            <a href="home?CategoryID=${o.id}">${o.name}</a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
       
        </div>
    </body>
</html>
