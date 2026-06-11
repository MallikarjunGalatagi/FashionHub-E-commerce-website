<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fashionhub.model.CartItem"%>
<%@ page import="com.fashionhub.dao.ProductDAO"%>
<%@ page import="com.fashionhub.dao.impl.ProductDAOImpl"%>
<%@ page import="com.fashionhub.model.Product"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Cart - Fashion Hub</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/cart.css">
</head>

<body>

    <!-- NAVBAR -->
    <jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

    <div class="container">

        <h2>Your Shopping Cart</h2>

        <%
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            ProductDAO productDAO = new ProductDAOImpl();

            double grandTotal = 0;
        %>

        <% if (cart != null && !cart.isEmpty()) {

            for (CartItem item : cart) {

                Product p = productDAO.getProductById(item.getProductId());

                double unitPrice = item.getUnitPrice();
                int qty = item.getQuantity();

                double total = unitPrice * qty;
                grandTotal += total;
        %>

        <!-- CART ITEM -->
        <div class="cart-item">

            <!-- IMAGE -->
<img 
src="<%= request.getContextPath() %>/assets/images/<%= p.getImageUrl().replace("images/", "") %>" 
alt="product">

            <!-- DETAILS -->
            <div class="cart-details">

                <h3><%= p.getProductName() %></h3>

                <p>Price: &#8377;<%= String.format("%.2f", unitPrice) %></p>

                <p>
                    Quantity:
                    <a href="${pageContext.request.contextPath}/cart?action=decrease&productId=<%= item.getProductId() %>">-</a>
                    <span><%= qty %></span>
                    <a href="${pageContext.request.contextPath}/cart?action=increase&productId=<%= item.getProductId() %>">+</a>
                </p>

                <p>Total: &#8377;<%= String.format("%.2f", total) %></p>

            </div>

            <!-- REMOVE -->
            <a class="remove-btn"
               href="${pageContext.request.contextPath}/cart?action=remove&productId=<%= item.getProductId() %>">
                Remove
            </a>

        </div>

        <%
            }
        %>

        <!-- SUMMARY -->
        <div class="cart-summary">

            <h2>Grand Total: &#8377;<%= String.format("%.2f", grandTotal) %></h2>

            <div style="margin-top: 15px;">

                <!-- CONTINUE SHOPPING -->
                <a href="${pageContext.request.contextPath}/products" class="btn">
                    Continue Shopping
                </a>

                <!-- CHECKOUT BUTTON -->
                <a href="${pageContext.request.contextPath}/checkout" class="btn" style="margin-left:10px;">
                    Checkout
                </a>

            </div>

        </div>

        <%
            } else {
        %>

        <!-- EMPTY CART -->
        <p class="empty-cart">Your cart is empty</p>

        <a href="${pageContext.request.contextPath}/products" class="btn">
            Continue Shopping
        </a>

        <%
            }
        %>

    </div>

    <!-- FOOTER -->
    <jsp:include page="/WEB-INF/views/partials/footer.jsp" />

</body>
</html>