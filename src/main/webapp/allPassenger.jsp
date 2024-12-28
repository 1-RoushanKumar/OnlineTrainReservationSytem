<%@page import="entity.Passenger"%>
<%@page import="java.util.List"%>
<%@page import="com.connections.DBConnect"%>
<%@page import="com.dao.PassengerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Passenger List</title>
<style>
body {
	background-image:
		url('https://img.freepik.com/premium-vector/subway-train-station-with-floor-stop-sign-chairs-recycle-trash-broom-big-clock-tv-time_82689-95.jpg?w=1060');
	/* Replace with your image URL */
	background-size: cover;
	background-position: center;
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
	margin: 0;
	padding: 0;
}

.container {
	width: 80%;
	margin: 20px auto;
	background: #fff;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	border-radius: 8px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	padding: 10px;
}

th {
	background-color: #4CAF50;
	color: white;
	text-align: left;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ddd;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.home-button {
	padding: 10px 20px;
	background-color: #007BFF;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	text-decoration: none;
	font-size: 16px;
}

.home-button:hover {
	background-color: #0056b3;
}

h1 {
	margin: 0;
	color: #333;
}
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>Passenger List</h1>
			<a href="http://localhost:8080/OnlineReservationSystem/home.jsp"
				class="home-button">Go to Home</a>
		</div>
		<table>
			<thead>
				<tr>
					<th>PNR Number</th>
					<th>Name</th>
					<th>Journey Date</th>
					<th>Class Type</th>
					<th>Source</th>
					<th>Destination</th>
					<th>Train Name</th>
					<th>Train Number</th>
				</tr>
			</thead>
			<tbody>
				<%
				PassengerDao dao = new PassengerDao(DBConnect.getConn());
				List<Passenger> list = dao.getAllPassengers();
				if (list.isEmpty()) {
				%>
				<tr>
					<td colspan="8" style="text-align: center;">No passengers
						found</td>
				</tr>
				<%
				} else {
				for (Passenger p : list) {
				%>
				<tr>
					<td><%=p.getPnrNumber()%></td>
					<td><%=p.getPassengerName()%></td>
					<td><%=p.getJourneyDate()%></td>
					<td><%=p.getClassType()%></td>
					<td><%=p.getSource()%></td>
					<td><%=p.getDestination()%></td>
					<td><%=p.getTrainName()%></td>
					<td><%=p.getTrainNumber()%></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>
