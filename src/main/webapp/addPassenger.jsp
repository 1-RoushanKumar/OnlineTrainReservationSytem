<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Passenger</title>
<style>
body {
	background-image:
		url('https://img.freepik.com/premium-vector/subway-train-station-with-floor-stop-sign-chairs-recycle-trash-broom-big-clock-tv-time_82689-95.jpg?w=1060');
	/* Replace with your image URL */
	background-size: cover;
	background-position: center;
	font-family: Arial, sans-serif;
	background-color: #7e99a3;
	margin: 0;
	padding: 0;
}

.container {
	width: 100%;
	max-width: 600px;
	margin: 50px auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.container h2 {
	text-align: center;
	color: #333;
}

.form-label {
	font-size: 1rem;
	margin-bottom: 5px;
	display: block;
	color: #333;
}

.form-control {
	width: 90%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 1rem;
}

.form-control:focus {
	border-color: #007bff;
	outline: none;
}

.radio-group {
	display: flex;
	gap: 10px;
	margin-bottom: 15px;
}

.radio-group input {
	margin-right: 5px;
}

.btn-primary {
	width: 100%;
	padding: 10px;
	background-color: #007bff;
	border: none;
	border-radius: 5px;
	color: white;
	font-size: 1rem;
	cursor: pointer;
}

.btn-primary:hover {
	background-color: #0056b3;
}

.message {
	text-align: center;
	font-size: 1.1rem;
}

.message.success {
	color: green;
}

.message.error {
	color: red;
}
</style>
<script>
        function updateTrainOptions() {
            const source = document.getElementById("source").value.toLowerCase();
            const destination = document.getElementById("destination").value.toLowerCase();
            const trainSelect = document.getElementById("trainName");
            const trainNumberInput = document.getElementById("trainNumber");

            // Clear existing options
            trainSelect.innerHTML = `<option value="">Select Train</option>`;
            trainNumberInput.value = ""; // Clear train number

            // Add relevant options based on source and destination
            if (source === "patna" && destination === "delhi") {
                trainSelect.innerHTML += `
                    <option value="Delhi-Patna-Express-12345">Delhi-Patna-Express (12345)</option>
                    <option value="Rajdhani-Express-54321">Rajdhani-Express (54321)</option>`;
            } else if (source === "patna" && destination === "raipur") {
                trainSelect.innerHTML += `
                    <option value="South-Bihar-Express-67890">South-Bihar-Express (67890)</option>
                    <option value="Chapra-Express-98765">Chapra-Express (98765)</option>`;
            } else {
                trainSelect.innerHTML += `<option value="">No Trains Available</option>`;
            }
        }

        function updateTrainNumber() {
            const trainSelect = document.getElementById("trainName");
            const trainNumberInput = document.getElementById("trainNumber");
            const selectedOption = trainSelect.options[trainSelect.selectedIndex].text;

            if (selectedOption.includes("(")) {
                trainNumberInput.value = selectedOption.match(/\((\d+)\)/)[1];
            } else {
                trainNumberInput.value = "";
            }
        }
    </script>
</head>
<body>

	<div class="container">
		<h2>Add Passenger</h2>

		<!-- Display error message -->
		<c:if test="${not empty errorMsg}">
			<div class="message error">${errorMsg}</div>
			<c:remove var="errorMsg" />
		</c:if>

		<form action="add_passen" method="post">
			<label class="form-label">Passenger Name</label> <input type="text"
				class="form-control" name="pass_name" required> <label
				class="form-label">Source</label> <input type="text" id="source"
				class="form-control" name="source" oninput="updateTrainOptions()"
				required> <label class="form-label">Destination</label> <input
				type="text" id="destination" class="form-control" name="destination"
				oninput="updateTrainOptions()" required> <label
				class="form-label">Class</label>
			<div class="radio-group">
				<label><input type="radio" id="firstClass" name="classType"
					value="1st Class" required> 1st Class</label> <label><input
					type="radio" id="secondClass" name="classType" value="2nd Class">
					2nd Class</label> <label><input type="radio" id="thirdClass"
					name="classType" value="3rd Class"> 3rd Class</label> <label><input
					type="radio" id="sleeper" name="classType" value="Sleeper">
					Sleeper</label> <label><input type="radio" id="general"
					name="classType" value="General"> General</label>
			</div>

			<label class="form-label">Journey Date</label> <input type="date"
				class="form-control" name="journeyDate" required> <label
				class="form-label">Train Name</label> <select id="trainName"
				class="form-control" name="trainName" onchange="updateTrainNumber()"
				required>
				<option value="">Select Train</option>
			</select> <label class="form-label">Train Number</label> <input type="text"
				id="trainNumber" class="form-control" name="trainNumber" readonly>

			<button type="submit" class="btn-primary">Submit</button>
		</form>
	</div>

</body>
</html>
