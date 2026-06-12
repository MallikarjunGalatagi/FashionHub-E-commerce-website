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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/register.css">

    <!-- Font Awesome (Eye Icon) -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <style>
        /* Center form content */
        .register-box form{
            display:flex;
            flex-direction:column;
            align-items:center;
            width:100%;
        }

        /* All input fields */
        .register-box form input,
        .register-box form textarea{
            width:100%;
            box-sizing:border-box;
        }

        /* Password field wrapper */
        .password-container{
            position:relative;
            width:100%;
            margin-bottom:12px;
        }

        /* Password input */
        .password-container input{
            width:100%;
            padding:12px 45px 12px 15px;
            margin:0;
            border:none;
            outline:none;
            border-radius:8px;
            background:#d9d9d9;
            color:#000;
            font-size:15px;
            font-family:'Segoe UI', sans-serif;
            box-sizing:border-box;
        }

        /* Eye icon */
        .toggle-password{
            position:absolute;
            right:15px;
            top:50%;
            transform:translateY(-50%);
            width:20px;
            height:20px;
            display:flex;
            align-items:center;
            justify-content:center;
            cursor:pointer;
            color:#666;
            font-size:16px;
            transition:0.3s ease;
        }

        .toggle-password:hover{
            color:#ffd700;
        }
        
        
        /* MODERN INPUT HOVER & FOCUS EFFECT */
/* INPUT HOVER & FOCUS EFFECT */
.register-box form input:hover,
.register-box form textarea:hover,
.password-container input:hover {
    background: #ffffff;
    box-shadow:
        0 0 8px rgba(255, 215, 0, 0.4),
        0 0 15px rgba(255, 215, 0, 0.2);
    transition: all 0.3s ease;
}

.register-box form input:focus,
.register-box form textarea:focus,
.password-container input:focus {
    background: #ffffff;
    box-shadow:
        0 0 10px rgba(255, 215, 0, 0.6),
        0 0 20px rgba(255, 215, 0, 0.3);
    border: 1px solid #ffd700;
    transition: all 0.3s ease;
}
    </style>
</head>

<body>

    <!-- NAVBAR -->
    <%@ include file="partials/navbar.jsp" %>

    <!-- REGISTER CONTAINER -->
    <div class="register-container">

        <div class="register-box">

            <h2>Create Account</h2>

            <p class="error">${error}</p>

            <form method="post"
                  action="${pageContext.request.contextPath}/register">

                <!-- FULL NAME -->
                <input
                    type="text"
                    name="fullName"
                    placeholder="Full Name"
                    required>

                <!-- EMAIL -->
                <input
                    type="email"
                    name="email"
                    placeholder="Email"
                    required>

                <!-- PHONE -->
                <input
                    type="text"
                    name="phone"
                    placeholder="Phone">

                <!-- PASSWORD -->
                <div class="password-container">
                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Password"
                        required>

                    <span class="toggle-password"
                          onclick="togglePassword()">
                        <i id="eyeIcon" class="fa-solid fa-eye"></i>
                    </span>
                </div>

                <!-- GENDER -->
                <input
                    type="text"
                    name="gender"
                    list="genderList"
                    placeholder="Select Gender"
                    required>

                <datalist id="genderList">
                    <option value="Male">
                    <option value="Female">
                </datalist>

                <!-- ADDRESS -->
                <textarea
                    name="address"
                    placeholder="Address"></textarea>

                <!-- REGISTER BUTTON -->
                <button type="submit">
                    Register
                </button>

            </form>

            <div class="register-footer">
                Already have an account?
                <a href="${pageContext.request.contextPath}/login">
                    Login
                </a>
            </div>

        </div>

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