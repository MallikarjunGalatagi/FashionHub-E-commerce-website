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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/products.css">
</head>

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
                <li>
                    <a href="${pageContext.request.contextPath}/products">
                        All
                    </a>
                </li>

                <%
                    List<Category> categories =
                        (List<Category>) request.getAttribute("categories");

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
                List<Product> products =
                    (List<Product>) request.getAttribute("products");

                if (products != null && !products.isEmpty()) {
                    for (Product p : products) {
            %>

            <div class="product-card">

                <!-- PRODUCT IMAGE -->
          <!-- PRODUCT IMAGE -->
<div style="
    width:100%;
    height:220px;
    overflow:hidden;
    border-radius:20px;
    background:#222;
    display:flex;
    justify-content:center;
    align-items:center;
    margin-bottom:10px;
">
    <img
        src="<%= request.getContextPath() %>/assets/images/<%= p.getImageUrl().replace("images/", "") %>"
        alt="product"
        style="
            max-width:100%;
            max-height:100%;
            width:auto;
            height:auto;
            object-fit:contain;
            border-radius:16px;
            transition:transform 0.3s ease; ">
</div>

                <!-- PRODUCT INFO -->
                <div class="product-info">

                    <!-- PRODUCT NAME -->
                    <h3><%= p.getProductName() %></h3>

                    <!-- DESCRIPTION -->
                    <p>
                        <%= (p.getDescription() != null &&
                             p.getDescription().length() > 40)
                            ? p.getDescription().substring(0, 40) + "..."
                            : p.getDescription() %>
                    </p>

                    <!-- PRODUCT PRICE -->
                    <p style="
                        color:#ffd700;
                        font-weight:bold;
                        font-size:20px;
                        margin:15px 0;
                    ">
                        Price: &#8377;<%= String.format("%.2f", p.getPrice()) %>
                    </p>

                    <!-- BUTTONS -->
                    <div class="btn-group">

                        <a href="${pageContext.request.contextPath}/product?id=<%= p.getProductId() %>"
                           class="btn">
                            View Details
                        </a>

                        <form action="${pageContext.request.contextPath}/cart"
                              method="post"
                              style="display:inline;">

                            <input type="hidden"
                                   name="action"
                                   value="add">

                            <input type="hidden"
                                   name="productId"
                                   value="<%= p.getProductId() %>">

                            <button type="submit" class="btn">
                                Add to Cart
                            </button>

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