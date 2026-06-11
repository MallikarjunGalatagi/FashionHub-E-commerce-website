<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List"%>
<%@ page import="com.fashionhub.model.CartItem"%>

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
            double grandTotal = 0;

            if (cart != null) {
                for (CartItem item : cart) 
                {
                    grandTotal += item.getUnitPrice() * item.getQuantity();
                }
            }
        %>

        <!-- ORDER SUMMARY -->
        <div class="checkout-form">

            <h3>Order Summary</h3>

            <% if (cart != null && !cart.isEmpty()) {
                for (CartItem item : cart) {
            %>

            <p>
              
                Qty: <%= item.getQuantity() %> |
                Total: &#8377;<%= String.format("%.2f", item.getUnitPrice() * item.getQuantity()) %>
            </p>

            <% } %>

            <h3>Grand Total: &#8377;<%= String.format("%.2f", grandTotal) %></h3>

            <% } else { %>

            <p>Your cart is empty</p>

            <% } %>

            <hr>

            <!-- CHECKOUT FORM -->
            <form action="${pageContext.request.contextPath}/checkout" method="post">

                <label>Delivery Address:</label>
                <textarea name="address" required></textarea>

                <label>Payment Method:</label>
                <select name="payment">
                    <option>Cash on Delivery</option>
                    <option>UPI</option>
                    <option>Card</option>
                </select>

                <button type="submit">Place Order</button>

            </form>

        </div>

    </div>

    <!-- FOOTER -->
    <jsp:include page="/WEB-INF/views/partials/footer.jsp" />

</body>
</html>