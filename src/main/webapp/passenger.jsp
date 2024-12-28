<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="entity.Passenger"%>
<%@page import="com.connections.DBConnect"%>
<%@page import="com.dao.PassengerDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Passenger Details</title>
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
}

h1 {
	text-align: center;
	color: #333;
}

form {
	text-align: center;
	margin: 20px 0;
}

form input[type="text"] {
	padding: 10px;
	width: 300px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

form button {
	padding: 10px 20px;
	background-color: #007BFF;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-left: 10px;
}

form button:hover {
	background-color: #0056b3;
}

.details {
	margin-top: 20px;
}

.details p {
	font-size: 1.2rem;
	color: #555;
}

.action-buttons a {
	text-decoration: none;
	padding: 10px 20px;
	border-radius: 5px;
	color: white;
	margin: 5px;
	display: inline-block;
}

.edit-button {
	background-color: #28a745;
}

.edit-button:hover {
	background-color: #218838;
}

.cancel-button {
	background-color: #dc3545;
}

.cancel-button:hover {
	background-color: #c82333;
}

.home-button {
	display: block;
	width: fit-content;
	margin: 20px auto;
	text-decoration: none;
	padding: 10px 20px;
	background-color: #17a2b8;
	color: white;
	border-radius: 5px;
	text-align: center;
}

.home-button:hover {
	background-color: #138496;
}

.error {
	color: red;
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Passenger Details</h1>
		<form method="post">
			<input type="text" name="pnrNumber" placeholder="Enter PNR Number"
				required />
			<button type="submit">Get Details</button>
		</form>

		<%
		String pnrNumber = request.getParameter("pnrNumber");
		if (pnrNumber != null && !pnrNumber.isEmpty()) {
			try {
				int pnr = Integer.parseInt(pnrNumber);
				PassengerDao dao = new PassengerDao(DBConnect.getConn());
				Passenger passenger = dao.getPassengerByPnrNumber(pnr);

				if (passenger != null) {
		%>
		<div class="details">
			<p>
				<strong>PNR Number:</strong>
				<%=passenger.getPnrNumber()%></p>
			<p>
				<strong>Name:</strong>
				<%=passenger.getPassengerName()%></p>
			<p>
				<strong>Journey Date:</strong>
				<%=passenger.getJourneyDate()%></p>
			<p>
				<strong>Class Type:</strong>
				<%=passenger.getClassType()%></p>
			<p>
				<strong>Source:</strong>
				<%=passenger.getSource()%></p>
			<p>
				<strong>Destination:</strong>
				<%=passenger.getDestination()%></p>
			<p>
				<strong>Train Name:</strong>
				<%=passenger.getTrainName()%></p>
			<p>
				<strong>Train Number:</strong>
				<%=passenger.getTrainNumber()%></p>
		</div>
		<%
		} else {
		%>
		<p class="error">
			No passenger found with PNR number
			<%=pnrNumber%>.
		</p>
		<%
		}
		} catch (NumberFormatException e) {
		%>
		<p class="error">Invalid PNR number. Please enter a valid numeric
			PNR.</p>
		<%
		}
		}
		%>

		<a href="home.jsp" class="home-button">Back to Home</a>
	</div>
</body>
</html>
