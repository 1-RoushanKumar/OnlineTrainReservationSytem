package entity;

public class Passenger {
	private int pnrNumber;
	private String passengerName;
	private int trainNumber;
	private String trainName;
	private String classType;
	private String journeyDate;
	private String source;
	private String destination;

	// Constructor
	public Passenger(int pnrNumber, String passengerName, int trainNumber, String trainName, String classType,
			String journeyDate, String source, String destination) {
		this.pnrNumber = pnrNumber;
		this.passengerName = passengerName;
		this.trainNumber = trainNumber;
		this.trainName = trainName;
		this.classType = classType;
		this.journeyDate = journeyDate;
		this.source = source;
		this.destination = destination;
	}

	public Passenger() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Passenger(String passengerName, int trainNumber, String trainName, String classType, String journeyDate,
			String source, String destination) {
		super();
		this.passengerName = passengerName;
		this.trainNumber = trainNumber;
		this.trainName = trainName;
		this.classType = classType;
		this.journeyDate = journeyDate;
		this.source = source;
		this.destination = destination;
	}

	// Getters and Setters
	public int getPnrNumber() {
		return pnrNumber;
	}

	public void setPnrNumber(int pnrNumber) {
		this.pnrNumber = pnrNumber;
	}

	public String getPassengerName() {
		return passengerName;
	}

	public void setPassengerName(String passengerName) {
		this.passengerName = passengerName;
	}

	public int getTrainNumber() {
		return trainNumber;
	}

	public void setTrainNumber(int trainNumber) {
		this.trainNumber = trainNumber;
	}

	public String getTrainName() {
		return trainName;
	}

	public void setTrainName(String trainName) {
		this.trainName = trainName;
	}

	public String getClassType() {
		return classType;
	}

	public void setClassType(String classType) {
		this.classType = classType;
	}

	public String getJourneyDate() {
		return journeyDate;
	}

	public void setJourneyDate(String journeyDate) {
		this.journeyDate = journeyDate;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}
}
