<!DOCTYPE html>
<%@page import="entity.Passenger"%>
<%@page import="com.connections.DBConnect"%>
<%@page import="com.dao.PassengerDao"%>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Passenger Details</title>
<style>
/* Body Styling */
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
	display: flex;
	flex-direction: column;
	align-items: center;
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

.home-button {
	text-align: center;
	margin-top: 20px;
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
		<h1>Edit Passenger Details</h1>
		<%
		// Step 1: Check if PNR number is submitted
		String pnrNumber = request.getParameter("pnrNumber");

		if (pnrNumber == null || pnrNumber.isEmpty()) {
		%>
		<!-- Step 2: Display PNR input form if no PNR number is provided -->
		<form action="" method="get">
			<input type="text" name="pnrNumber" placeholder="Enter PNR Number"
				required />
			<button type="submit">Search</button>
		</form>
		<%
		} else {
		// Step 3: Fetch passenger details using PNR number if provided
		PassengerDao dao = new PassengerDao(DBConnect.getConn());
		int pnr = Integer.parseInt(pnrNumber);
		Passenger passenger = dao.getPassengerByPnrNumber(pnr);

		if (passenger != null) {
		%>
		<!-- Step 4: Display form to update passenger details -->
		<form action="updatePassenger" method="post">
			<input type="hidden" name="pnrNumber" value="<%=pnr%>" /> <input
				type="text" name="name" placeholder="Name"
				value="<%=passenger.getPassengerName()%>" required /> <input
				type="text" name="journeyDate"
				placeholder="Journey Date (YYYY-MM-DD)"
				value="<%=passenger.getJourneyDate()%>" required /> <input
				type="text" name="classType" placeholder="Class Type"
				value="<%=passenger.getClassType()%>" required /> <input
				type="text" name="source" placeholder="Source"
				value="<%=passenger.getSource()%>" required /> <input type="text"
				name="destination" placeholder="Destination"
				value="<%=passenger.getDestination()%>" required /> <input
				type="text" name="trainName" placeholder="Train Name"
				value="<%=passenger.getTrainName()%>" required /> <input
				type="text" name="trainNumber" placeholder="Train Number"
				value="<%=passenger.getTrainNumber()%>" required />
			<button type="submit">Update Details</button>
		</form>
		<%
		} else {
		%>
		<p>
			No passenger found with PNR number
			<%=pnrNumber%>.
		</p>
		<%
		}
		}
		%>
		<div class="home-button">
			<a href="home.jsp">Back to Home</a>
		</div>
	</div>
</body>
</html>
