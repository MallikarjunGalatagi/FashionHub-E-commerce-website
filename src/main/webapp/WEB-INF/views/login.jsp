<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Fashion Hub</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/auth.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/navbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">

    <!-- Font Awesome (Eye Icon) -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <style>
        /* FORM ALIGNMENT */
        .auth-form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* INPUT FIELDS */
        .auth-form input,
        .password-container {
            width: 100%;
            box-sizing: border-box;
        }

        .auth-form input {
            margin-bottom: 12px;
        }

        /* PASSWORD FIELD */
        .password-container {
            position: relative;
            margin-bottom: 12px;
        }

        .password-container input {
            width: 100%;
            margin: 0;
            padding: 12px 45px 12px 15px;
            border: none;
            outline: none;
            border-radius: 8px;
            background: #d9d9d9;
            color: #000;
            font-size: 15px;
            font-family: 'Segoe UI', sans-serif;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        /* EYE ICON */
        .toggle-password {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            color: #666;
            font-size: 16px;
            transition: 0.3s ease;
            user-select: none;
        }

        .toggle-password:hover {
            color: #ffd700;
        }

        /* HOVER & FOCUS EFFECT */
        /* INPUT HOVER & FOCUS EFFECT */
.auth-form input:hover,
.password-container input:hover {
    background: #ffffff;
    box-shadow:
        0 0 8px rgba(255, 215, 0, 0.4),
        0 0 15px rgba(255, 215, 0, 0.2);
    transition: all 0.3s ease;
}

.auth-form input:focus,
.password-container input:focus {
    background: #ffffff;
    box-shadow:
        0 0 10px rgba(255, 215, 0, 0.6),
        0 0 20px rgba(255, 215, 0, 0.3);
    border: 1px solid #ffd700;
    transition: all 0.3s ease;
}

/* INPUT HOVER & FOCUS EFFECT */
.auth-form input,
.password-container input {
    transition: all 0.3s ease;
}

.auth-form input:hover,
.password-container input:hover {
    background: #ffffff;
    box-shadow:
        0 0 8px rgba(255, 215, 0, 0.4),
        0 0 15px rgba(255, 215, 0, 0.2);
}

.auth-form input:focus,
.password-container input:focus {
    background: #ffffff;
    border: 1px solid #ffd700;
    box-shadow:
        0 0 10px rgba(255, 215, 0, 0.6),
        0 0 20px rgba(255, 215, 0, 0.3);
}
    </style>
</head>

<body>

    <!-- NAVBAR -->
    <jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

    <div class="auth-container">

        <form action="${pageContext.request.contextPath}/login"
              method="post"
              class="auth-form">

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

            <!-- EMAIL -->
            <input
                type="email"
                name="email"
                placeholder="Enter Email"
                required>

            <!-- PASSWORD -->
            <div class="password-container">
                <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Enter Password"
                    required>

                <span class="toggle-password"
                      onclick="togglePassword()">
                    <i id="eyeIcon" class="fa-solid fa-eye"></i>
                </span>
            </div>

            <!-- LOGIN BUTTON -->
            <button type="submit">
                Login
            </button>

            <p class="switch-text">
                Don't have an account?
                <a href="${pageContext.request.contextPath}/register">
                    Register
                </a>
            </p>

        </form>

    </div>

    <!-- FOOTER -->
    <jsp:include page="/WEB-INF/views/partials/footer.jsp" />

    <!-- SHOW / HIDE PASSWORD -->
    <script>
        function togglePassword() {
            const passwordField = document.getElementById("password");
            const eyeIcon = document.getElementById("eyeIcon");

            if (passwordField.type === "password") {
                passwordField.type = "text";
                eyeIcon.classList.remove("fa-eye");
                eyeIcon.classList.add("fa-eye-slash");
            } else {
                passwordField.type = "password";
                eyeIcon.classList.remove("fa-eye-slash");
                eyeIcon.classList.add("fa-eye");
            }
        }
    </script>

</body>
</html>