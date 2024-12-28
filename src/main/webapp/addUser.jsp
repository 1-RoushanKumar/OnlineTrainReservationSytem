<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Registration</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-image:
		url('https://img.freepik.com/premium-vector/subway-train-station-with-floor-stop-sign-chairs-recycle-trash-broom-big-clock-tv-time_82689-95.jpg?w=1060');
	/* Replace with your image URL */
	background-size: cover;
	background-position: center;
	height: 100vh;
	margin: 0;
	font-family: Arial, sans-serif;
}

.card {
	background-color: rgba(255, 255, 255, 0.8);
	/* Semi-transparent background */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.card-body {
	padding: 30px;
}

.btn-primary {
	width: 100%;
}

.text-center p {
	margin-top: 10px;
}
</style>
</head>
<body>

	<div class="container py-5">
		<div class="row justify-content-center">
			<div class="col-md-6 col-lg-5">
				<div class="card border-0 rounded-3">
					<div class="card-body">
						<h2 class="card-title text-center mb-4">User Registration</h2>

						<!-- Success Message -->
						<c:if test="${not empty succMsg}">
							<div class="alert alert-success alert-dismissible fade show"
								role="alert">
								${succMsg}
								<button type="button" class="btn-close" data-bs-dismiss="alert"
									aria-label="Close"></button>
							</div>
						</c:if>

						<!-- Error Message -->
						<c:if test="${not empty errorMsg}">
							<div class="alert alert-danger alert-dismissible fade show"
								role="alert">
								${errorMsg}
								<button type="button" class="btn-close" data-bs-dismiss="alert"
									aria-label="Close"></button>
							</div>
						</c:if>

						<form action="register" method="post" novalidate>
							<div class="mb-3">
								<label for="nameInput" class="form-label">Full Name</label> <input
									type="text" class="form-control" id="nameInput" name="name"
									placeholder="Enter your full name" required>
							</div>

							<div class="mb-3">
								<label for="passwordInput" class="form-label">Password</label> <input
									type="password" class="form-control" id="passwordInput"
									name="password" placeholder="Create a strong password" required>
							</div>

							<button type="submit" class="btn btn-primary">Register</button>
						</form>

						<div class="text-center">
							<p class="small text-muted">
								Already have an account? <a href="login.jsp">Sign In</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
