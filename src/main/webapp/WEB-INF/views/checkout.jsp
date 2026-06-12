<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List"%>
<%@ page import="com.fashionhub.model.CartItem"%>
<%@ page import="com.fashionhub.dao.ProductDAO"%>
<%@ page import="com.fashionhub.dao.impl.ProductDAOImpl"%>
<%@ page import="com.fashionhub.model.Product"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout - Fashion Hub</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/checkout.css">
</head>

<body>

    <!-- NAVBAR -->
    <jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

    <div class="container">

        <h2>Checkout</h2>

        <%
            List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
            ProductDAO productDAO = new ProductDAOImpl();

            double grandTotal = 0;
        %>

        <!-- ORDER SUMMARY -->
        <div class="checkout-form">

            <h3>Order Summary</h3>

            <% if (cart != null && !cart.isEmpty()) {

                for (CartItem item : cart) {

                    Product p = productDAO.getProductById(item.getProductId());

                    double total = item.getUnitPrice() * item.getQuantity();
                    grandTotal += total;
            %>

            <!-- ORDER ITEM -->
            <div style="display:flex; align-items:center; gap:10px; padding:15px 0;">

                <!-- PRODUCT IMAGE -->
                <img
                    src="<%= request.getContextPath() %>/assets/images/<%= p.getImageUrl().replace("images/", "") %>"
                    alt="product"
                    style="
                        width:100px;
                        max-width:100px;
                        min-width:100px;
                        height:auto;
                        border-radius:5px;
                        display:block;
                        flex-shrink:0;
                    ">

                <!-- PRODUCT DETAILS -->
                <div style="margin-left:5px;">

                    <h4 style="margin:0 0 10px 0; color:#fff;">
                        <%= p.getProductName() %>
                    </h4>

                    <p style="margin:5px 0; color:#ddd;">
                        <strong style="color:white;">Price:</strong>
                        ₹<%= String.format("%.2f", item.getUnitPrice()) %>
                    </p>

                    <p style="margin:5px 0; color:#ddd;">
                        <strong style="color:white;">Quantity:</strong>
                        <%= item.getQuantity() %>
                    </p>

                    <p style="margin:5px 0; color:#ddd;">
                        <strong style="color:white;">Total:</strong>
                        ₹<%= String.format("%.2f", total) %>
                    </p>

                </div>

            </div>

            <hr style="border:none; border-top:1px solid #444; margin:15px 0;">

            <%
                }
            %>

            <h3>
                Grand Total:
                ₹<%= String.format("%.2f", grandTotal) %>
            </h3>

            <% } else { %>

                <p>Your cart is empty.</p>

            <% } %>

            <br>

            <!-- CHECKOUT FORM -->
            <form action="${pageContext.request.contextPath}/checkout" method="post">

                <label>Delivery Address</label>
                <textarea name="address" required></textarea>

                <label>Payment Method</label>
                <select name="payment">
                    <option>Cash on Delivery</option>
                    <option>UPI</option>
                    <option>Card</option>
                </select>

                <!-- PLACE ORDER BUTTON -->
                <!-- PLACE ORDER BUTTON -->
<!-- PLACE ORDER BUTTON -->
<div style="margin-top:20px; display:flex; justify-content:center;">

    <button
    type="submit"
    id="placeOrderBtn"
    class="nav-btn"
    style="
        border: none;
        cursor: pointer;
        font-family: 'Segoe UI', sans-serif;
        background: linear-gradient(135deg, #ffd700, #ffcc00);
        padding: 10px 20px !important;
        border-radius: 25px;
        font-size: 15px;
        font-weight: bold;
    ">
    Place Order
</button>

</div>

            </form>

        </div>

    </div>

    <!-- FOOTER -->
    <jsp:include page="/WEB-INF/views/partials/footer.jsp" />

</body>
</html>