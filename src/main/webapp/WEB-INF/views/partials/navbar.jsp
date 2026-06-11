<%@ page session="true" %>

<div class="navbar">

    <!-- LOGO -->
    <div class="logo">
        <a href="${pageContext.request.contextPath}/index.jsp">
            FASHION<span>HUB</span>
        </a>
    </div>

    <!-- NAV LINKS -->
    <div class="nav-links">

        <a href="${pageContext.request.contextPath}/index.jsp"
           class="nav-btn">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/products"
           class="nav-btn">
            Shop
        </a>

        <a href="${pageContext.request.contextPath}/cart"
           class="nav-btn">
            Cart
        </a>

    </div>

    <!-- RIGHT SIDE -->
    <div class="nav-right">

        <%
            Object user = session.getAttribute("user");
        %>

        <% if (user == null) { %>

            <a href="${pageContext.request.contextPath}/login"
               class="nav-btn">
                Login
            </a>

            <a href="${pageContext.request.contextPath}/register"
               class="nav-btn">
                Register
            </a>

        <% } else { %>

            <a href="${pageContext.request.contextPath}/logout"
               class="nav-btn">
                Logout
            </a>

        <% } %>

    </div>

</div>