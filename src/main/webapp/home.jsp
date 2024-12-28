<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Online Train Reservation System</title>
<style>
/* Body Styling */
body {
	background-image:
		url("https://img.freepik.com/premium-vector/subway-train-station-with-floor-stop-sign-chairs-recycle-trash-broom-big-clock-tv-time_82689-95.jpg?w=1060");
	background-size: cover;
	background-position: center;
	margin: 0;
	font-family: Arial, sans-serif;
	color: white;
}

/* Header Styling */
h1 {
	text-align: center;
	font-size: 3rem;
	margin: 20px 0;
	color: #ffffff;
	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8);
}

/* Box Container */
.box {
	background-color: rgba(45, 49, 37, 0.9);
	height: auto;
	width: 90%;
	max-width: 500px;
	margin: 30px auto;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
	text-align: center;
}

/* Button Styling */
.box button {
	font-size: 1.2rem;
	background-color: #20b2aa; /* Aqua shade */
	color: #ffffff;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	margin: 10px 0;
	cursor: pointer;
	transition: background-color 0.3s ease, transform 0.2s ease;
	width: 80%;
}

/* Button Hover Effect */
.box button:hover {
	background-color: #1e90ff; /* Lighter shade */
	transform: scale(1.05); /* Slight zoom effect */
}

/* Message Styling */
.message {
	font-weight: bold;
	margin-bottom: 20px;
}

.message.success {
	color: #28a745; /* Green */
}

.message.error {
	color: #dc3545; /* Red */
}

/* Responsive Design */
@media ( max-width : 768px) {
	h1 {
		font-size: 2rem;
	}
	.box {
		padding: 15px;
	}
	.box button {
		font-size: 1rem;
		width: 100%;
	}
}
</style>
</head>
<body>
	<h1>Online Train Reservation System</h1>

	<div class="box">
		<!-- Display success message -->
		<c:if test="${not empty succMsg}">
			<div class="message success">${succMsg}</div>
			<c:set var="succMsg" value="" scope="session" />
		</c:if>

		<!-- Display error message -->
		<c:if test="${not empty errorMsg}">
			<div class="message error">${errorMsg}</div>
			<c:remove var="errorMsg" scope="session" />
		</c:if>

		<!-- Action Forms -->
		<form action="addPass" method="post">
			<button>Book Ticket</button>
		</form>
		<form action="edit.jsp" method="post">
			<button>Edit Passenger Details</button>
		</form>
		<form action="delete.jsp" method="post">
			<button>Cancel Ticket</button>
		</form>
		<form action="passDetail" method="post">
			<button>Passenger Details</button>
		</form>
		<form action="listPass" method="post">
			<button>All Passenger Details</button>
		</form>
		<form action="<c:url value='/logout'/>" method="post">
			<button style="background-color: red;">Exit</button>
		</form>

	</div>
</body>
</html>

