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
            <img src="${pageContext.request.contextPath}/assets/images/fashion_design.png"
                 alt="Fashion Banner">
        </div>
    </section>

  

    <!-- ✅ FOOTER -->
    <%@ include file="partials/footer.jsp" %>

</body>
</html>