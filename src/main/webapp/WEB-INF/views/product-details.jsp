<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.fashionhub.model.Product"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/auth.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/product-details.css">
</head>

<body>

    <!-- NAVBAR -->
    <%@ include file="partials/navbar.jsp" %>

    <%
        Product p = (Product) request.getAttribute("product");
    %>

    <div class="product-details-container">

        <% if (p != null) { %>

        <!-- IMAGE -->
        <div class="product-image">
<img 
src="<%= request.getContextPath() %>/assets/images/<%= p.getImageUrl().replace("images/", "") %>" 
alt="product">        </div>

        <!-- DETAILS -->
        <div class="product-info">

            <h1><%= p.getProductName() %></h1>

            <p class="description">
                <%= p.getDescription() %>
            </p>

            <!-- TEMP PRICE -->
            <!-- PRODUCT PRICE -->
<h2 class="price">
    ₹<%= String.format("%.2f", p.getPrice()) %>
</h2>
            <!-- ACTION -->
<form action="${pageContext.request.contextPath}/cart" method="post">
    <input type="hidden" name="productId" value="<%= p.getProductId() %>">
    <button type="submit" class="btn">Add to Cart</button>
</form>
        </div>

        <% } else { %>

        <h2 style="text-align:center;">Product not found</h2>

        <% } %>

    </div>

    <!-- FOOTER -->
    <%@ include file="partials/footer.jsp" %>

</body>
</html>