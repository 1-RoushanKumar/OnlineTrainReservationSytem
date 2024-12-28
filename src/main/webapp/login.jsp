<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Train Reservation - Login</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
    rel="stylesheet">
<style>
body {
    background-image:
        url('https://img.freepik.com/premium-vector/subway-train-station-with-floor-stop-sign-chairs-recycle-trash-broom-big-clock-tv-time_82689-95.jpg?w=1060');
    background-size: cover;
    background-position: center;
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0;
    font-family: Arial, sans-serif;
}

.login-container {
    background-color: rgba(255, 255, 255, 0.8);
    padding: 30px;
    border-radius: 8px;
    width: 100%;
    max-width: 400px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.login-header {
    text-align: center;
    margin-bottom: 20px;
}

.login-header h2 {
    color: #333;
}

.form-control {
    border-radius: 5px;
    padding: 12px;
}

.btn-login {
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 12px;
    width: 100%;
}

.btn-login:hover {
    background-color: #0056b3;
}

.register-section {
    text-align: center;
    margin-top: 20px;
}

.register-section a {
    text-decoration: none;
    color: #007bff;
}

.register-section a:hover {
    text-decoration: underline;
}
</style>
</head>
<body>

    <div class="login-container">
        <div class="login-header">
            <h2>Train Reservation System</h2>
            <p class="text-muted">Sign in to your account</p>
        </div>

        <!-- Error Message -->
        <c:if test="${not empty errorMsg}">
            <div class="alert alert-danger text-center" role="alert">
                ${errorMsg}
            </div>
        </c:if>

        <!-- Login Form -->
        <form action="login" method="post">
            <div class="mb-3">
                <input type="text" class="form-control" name="username"
                    placeholder="Username" required autofocus>
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" name="password"
                    placeholder="Password" required>
            </div>
            <div class="mb-3">
                <button type="submit" class="btn btn-login">Sign In</button>
            </div>
        </form>

        <!-- Register Section -->
        <div class="register-section">
            <p class="text-muted">Don't have an account?</p>
            <a href="addUser.jsp">Create Account</a>
        </div>
    </div>

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
