package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.Passenger;

public class PassengerDao {
	private Connection conn;

	public PassengerDao(Connection conn) {
		this.conn = conn;
	}

	// Add a new passenger
	public boolean addPassenger(Passenger passenger) {
		boolean f = false;

		try {
			String sql = "INSERT INTO pnr_detail(passengerName, trainNumber, trainName, classType, journeyDate, source, destination) VALUES (?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, passenger.getPassengerName());
			ps.setInt(2, passenger.getTrainNumber());
			ps.setString(3, passenger.getTrainName());
			ps.setString(4, passenger.getClassType());
			ps.setString(5, passenger.getJourneyDate());
			ps.setString(6, passenger.getSource());
			ps.setString(7, passenger.getDestination());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	// Retrieve all passengers
	public List<Passenger> getAllPassengers() {
		List<Passenger> passengerList = new ArrayList<>();

		String sql = "SELECT * FROM pnr_detail";

		try (PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				Passenger passenger = new Passenger();
				passenger.setPnrNumber(rs.getInt("pnrNumber"));
				passenger.setPassengerName(rs.getString("passengerName"));
				passenger.setTrainNumber(rs.getInt("trainNumber"));
				passenger.setTrainName(rs.getString("trainName"));
				passenger.setClassType(rs.getString("classType"));
				passenger.setJourneyDate(rs.getString("journeyDate"));
				passenger.setSource(rs.getString("source"));
				passenger.setDestination(rs.getString("destination"));

				passengerList.add(passenger);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return passengerList;
	}

	// Retrieve a passenger by PNR number
	public Passenger getPassengerByPnrNumber(int pnrNumber) {
		Passenger passenger = null;

		String sql = "SELECT * FROM pnr_detail WHERE pnrNumber=?";

		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setInt(1, pnrNumber);

			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					passenger = new Passenger();
					passenger.setPnrNumber(rs.getInt("pnrNumber"));
					passenger.setPassengerName(rs.getString("passengerName"));
					passenger.setTrainNumber(rs.getInt("trainNumber"));
					passenger.setTrainName(rs.getString("trainName"));
					passenger.setClassType(rs.getString("classType"));
					passenger.setJourneyDate(rs.getString("journeyDate"));
					passenger.setSource(rs.getString("source"));
					passenger.setDestination(rs.getString("destination"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return passenger;
	}

	// Update passenger details
	public boolean updatePassenger(Passenger passenger) {
		boolean f = false;

		String sql = "UPDATE pnr_detail SET passengerName=?, trainNumber=?, trainName=?, classType=?, journeyDate=?, source=?, destination=? WHERE pnrNumber=?";

		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, passenger.getPassengerName());
			ps.setInt(2, passenger.getTrainNumber());
			ps.setString(3, passenger.getTrainName());
			ps.setString(4, passenger.getClassType());
			ps.setString(5, passenger.getJourneyDate());
			ps.setString(6, passenger.getSource());
			ps.setString(7, passenger.getDestination());
			ps.setInt(8, passenger.getPnrNumber());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	// Delete a passenger by PNR number
    public boolean deletePassenger(int pnrNumber) {
        boolean status = false;
        try {
            String query = "DELETE FROM pnr_detail WHERE pnrNumber = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, pnrNumber);
            int rowsAffected = pstmt.executeUpdate();
            status = rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
