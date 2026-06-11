<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - Fashion Hub</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/auth.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/register.css">
</head>

<body>

<!-- ✅ NAVBAR -->
<%@ include file="partials/navbar.jsp" %>

<!-- 🔥 AUTH CONTAINER -->
<div class="register-container">

    <div class="register-box">
        <h2>Create Account</h2>

        <p class="error">${error}</p>

        <form method="post" action="${pageContext.request.contextPath}/register">

            <input type="text" name="fullName" placeholder="Full Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="text" name="phone" placeholder="Phone">
            <input type="password" name="password" placeholder="Password" required>

            <select name="gender">
                <option value="">Select Gender</option>
                <option>Male</option>
                <option>Female</option>
            </select>

            <textarea name="address" placeholder="Address"></textarea>

            <button type="submit">Register</button>

        </form>

        <div class="register-footer">
            Already have an account?
            <a href="${pageContext.request.contextPath}/login">Login</a>
        </div>
    </div>

</div>