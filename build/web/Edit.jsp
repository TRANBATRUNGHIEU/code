

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!--Favicon-->
        <link rel="icon" type="image/png" href="img/logo.PNG" />
       <title>Flower shop</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
           	
        </style>
        <script>

        </script>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <!-- Edit Product -->
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="edit" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Product</h4>
                                <a type="button" class="close" href="manager" aria-hidden="true">&times;</a>
                            </div>
                            <div class="modal-body">	
                                <div class="form-group">
                                    <label>ID</label>
                                    <input type="text"  class="form-control" name="id" value="${id}" readonly>
                            </div>
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" required name="name" value="${name}">
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <input type="text" class="form-control" required name="description" value="${description}">
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input type="text" class="form-control" required name="price" value="${price}">
                            </div>
                            <div class="form-group">
                                <label>Image Link</label>
                                <input type="text" class="form-control" required name="imageLink" value="${imageLink}">
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="CategoryID" class="form-control" required>
                                    <c:forEach var="o" items="${listC}">
                                        <option ${TagCategoryID == o.id ? "selected" : ""} value="${o.id}">${o.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Seller</label>
                                <select name="SellerID" class="form-control" required>
                                    <c:forEach var="o" items="${listS}">
                                        <option ${TagSellerID == o.id ? "selected" : ""} value="${o.id}">${o.user}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Amount</label>
                                <input type="text" class="form-control" required name="amount" value="${amount}">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a type="button" class="btn btn-default" href="manager">Cancel</a>
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>