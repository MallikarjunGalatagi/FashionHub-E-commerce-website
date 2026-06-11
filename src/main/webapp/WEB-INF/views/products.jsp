<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fashionhub.model.Product"%>
<%@ page import="com.fashionhub.model.Category"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Products - Fashion Hub</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/products.css"></head>

<body>

<!-- NAVBAR -->
<jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

<div class="container">

    <!-- SEARCH -->
    <form action="${pageContext.request.contextPath}/products" method="get" class="search-bar">
        <input type="text" name="search" placeholder="Search products...">
        <button type="submit">Search</button>
    </form>

    <div class="content">

        <!-- SIDEBAR -->
        <div class="sidebar">
            <h3>Categories</h3>

            <ul>
                <li><a href="${pageContext.request.contextPath}/products">All</a></li>

                <%
                    List<Category> categories = (List<Category>) request.getAttribute("categories");
                    if (categories != null) {
                        for (Category c : categories) {
                %>

                <li>
                    <a href="${pageContext.request.contextPath}/products?categoryId=<%= c.getCategoryId() %>">
                        <%= c.getCategoryName() %>
                    </a>
                </li>

                <%
                        }
                    }
                %>
            </ul>
        </div>

        <!-- PRODUCTS -->
        <div class="products">

            <%
                List<Product> products = (List<Product>) request.getAttribute("products");

                if (products != null && !products.isEmpty()) {
                    for (Product p : products) {
            %>

            <div class="product-card">

                <!-- IMAGE BOX -->
                <div class="image-box">
                    <img 
                        src="<%= request.getContextPath() %>/assets/images/<%= p.getImageUrl().replace("images/", "") %>" 
                        alt="product">
                </div>

                <!-- PRODUCT INFO -->
                <div class="product-info">

                    <h3><%= p.getProductName() %></h3>

                    <p>
                        <%= (p.getDescription() != null && p.getDescription().length() > 40) 
                            ? p.getDescription().substring(0, 40) + "..." 
                            : p.getDescription() %>
                    </p>

                    <!-- BUTTONS -->
                    <div class="btn-group">

                        <a href="${pageContext.request.contextPath}/product?id=<%= p.getProductId() %>" class="btn">
                            View Details
                        </a>

                        <form action="${pageContext.request.contextPath}/cart" method="post">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="productId" value="<%= p.getProductId() %>">
                            <button type="submit" class="btn">Add to Cart</button>
                        </form>

                    </div>

                </div>

            </div>

            <%
                    }
                } else {
            %>

            <h2 style="color:white;">No products found</h2>

            <%
                }
            %>

        </div>

    </div>

</div>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/partials/footer.jsp" />

</body>
</html>