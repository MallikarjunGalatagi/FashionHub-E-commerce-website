<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Fashion Hub</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">
</head>

<body>

    <!-- ✅ CORRECT INCLUDE (ABSOLUTE PATH) -->
    <jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

    <div class="auth-container">

        <form action="${pageContext.request.contextPath}/login" method="post" class="auth-form">

            <h2>Login</h2>

            <!-- ERROR MESSAGE -->
            <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
                <p class="error-msg"><%= error %></p>
            <%
                }
            %>

            <input type="email" name="email" placeholder="Enter Email" required>

            <input type="password" name="password" placeholder="Enter Password" required>

            <button type="submit">Login</button>

            <p class="switch-text">
                Don't have an account? <a href="${pageContext.request.contextPath}/register">Register</a>
                 </p>
            
        </form>

    </div>

    <!-- ✅ CORRECT INCLUDE -->
    

</body>
</html>