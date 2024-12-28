<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.connections.DBConnect"%>
<%@page import="com.dao.PassengerDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cancel Ticket</title>
<style>
body {
	background-image:
		url('https://img.freepik.com/premium-vector/subway-train-station-with-floor-stop-sign-chairs-recycle-trash-broom-big-clock-tv-time_82689-95.jpg?w=1060');
	/* Replace with your image URL */
	background-size: cover;
	background-position: center;
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.container {
	width: 60%;
	margin: 50px auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	border-radius: 8px;
	text-align: center;
}

h1 {
	color: #333;
}

form input, form button {
	padding: 10px;
	margin: 10px 0;
	width: 80%;
	border-radius: 5px;
	border: 1px solid #ddd;
}

form button {
	background-color: #007BFF;
	color: white;
	border: none;
	cursor: pointer;
}

form button:hover {
	background-color: #0056b3;
}

.message {
	font-size: 1.2rem;
	margin: 20px 0;
}

.home-button a {
	text-decoration: none;
	padding: 10px 20px;
	background-color: #17a2b8;
	color: white;
	border-radius: 5px;
}

.home-button a:hover {
	background-color: #138496;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Cancel Ticket</h1>
		<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
		%>
		<p class="message"><%=message%></p>
		<%
		}
		%>
		<form action="cancel" method="post">
			<input type="text" name="pnrNumber" placeholder="Enter PNR Number"
				required />
			<button type="submit">Cancel Ticket</button>
		</form>
		<div class="home-button">
			<a href="home.jsp">Back To Home</a>
		</div>
	</div>
</body>
</html>
