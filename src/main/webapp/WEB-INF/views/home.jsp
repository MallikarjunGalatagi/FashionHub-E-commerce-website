<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fashionhub.model.Product"%>
<%@ page import="com.fashionhub.model.Category"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Fashion Hub</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/home.css">
</head>

<body>

    <!-- ✅ NAVBAR -->
    <%@ include file="partials/navbar.jsp" %>

    <!-- HERO -->
    <section class="hero">
        <div class="hero-text">
            <h1>Upgrade Your Style</h1>
            <p>Discover trendy outfits and elevate your fashion game.</p>

            <a href="${pageContext.request.contextPath}/products" class="btn">
                Shop Now
            </a>
        </div>

        <div class="hero-image">
            <img src="${pageContext.request.contextPath}/assets/images/hero.png"
                 alt="Fashion Banner">
        </div>
    </section>

    <!-- 🔥 CATEGORIES -->
    <section class="categories">
        <h2>Categories</h2>

        <div class="category-container">

            <%
                List<Category> categories = (List<Category>) request.getAttribute("categories");

                if (categories != null) {
                    for (Category c : categories) {
            %>

                <div class="category-card">
                    <h3><%= c.getCategoryName() %></h3>
                </div>

            <%
                    }
                }
            %>

        </div>
    </section>

    <!-- 🔥 LATEST PRODUCTS -->
    <section class="products">
        <h2>Latest Products</h2>

        <div class="product-container">

            <%
                List<Product> products = (List<Product>) request.getAttribute("latestProducts");

                if (products != null) {
                    for (Product p : products) {
            %>

                <div class="product-card">
                    <img src="${pageContext.request.contextPath}/assets/images/<%= p.getImageUrl() %>" alt="product">

                    <h3><%= p.getProductName() %></h3>
                    <p><%= p.getDescription() %></p>

                    <a href="${pageContext.request.contextPath}/product?id=<%= p.getProductId() %>" class="btn">
                        View
                    </a>
                </div>

            <%
                    }
                }
            %>

        </div>
    </section>

    <!-- ✅ FOOTER -->
    <%@ include file="partials/footer.jsp" %>

</body>
</html>