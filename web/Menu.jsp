<%@page import="DAL.CartDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Flower shop</title>
   
        <jsp:useBean id="c" class="DAL.CartDAO"></jsp:useBean>
        <style>
            .btn-home,
            .btn-login{
                border: 2px solid #666;
                border-radius: 30px;
                padding: 5px 40px;
                margin-right: 20px;
            }
            .hello{
                margin-left: 300px;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="home"><img src="img/logo.PNG" width="50px" height="50px"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link btn-home" href="home">Home <span class="sr-only">(current)</span></a>
                    </li>
                 
                    <c:if test="${sessionScope.acc == null}">
                        <li class="nav-item">
                            <a class="nav-link btn-login" href="login">Login</a>
                        </li>
                    </c:if>

                   
                    <c:if test = "${sessionScope.acc != null}">
                        <li class="nav-item">
                    
                            <a class="nav-link text-info" href="login">Hello ${sessionScope.acc.user}</a>
                        </li>
                  
                        <c:if test="${sessionScope.acc.isSell == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="manager">Quản lý sản phẩm</a>
                            </li>                     
                        </c:if>
                   
                        <c:if test="${sessionScope.acc.isAdmin == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="accountManager">Quản lý tài khoản</a>
                            </li> 
                        </c:if>
                                            
                          <li class="nav-item">
                           
                            <a class="nav-link" href="logout">LogOut</a>
                            
                       
                    </c:if>                    
                </ul>
                
            </div>
        </nav>
    </body>
</html>