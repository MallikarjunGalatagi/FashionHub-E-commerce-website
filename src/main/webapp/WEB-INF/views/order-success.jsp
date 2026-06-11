<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Success - Fashion Hub</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/order-success.css">
</head>

<body>

<!-- ✅ NAVBAR -->
<%@ include file="partials/navbar.jsp" %>

<!-- 🔥 SUCCESS CONTENT -->
<div class="success-container">

    <div class="success-card">
        <h1>🎉 Order Placed Successfully!</h1>
        <p>Your order has been confirmed.</p>

        <a href="${pageContext.request.contextPath}/products" class="btn">
            Continue Shopping
        </a>
    </div>

</div>

<!-- ✅ FOOTER -->
<%@ include file="partials/footer.jsp" %>

</body>
</html>