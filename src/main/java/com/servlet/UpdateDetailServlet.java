package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connections.DBConnect;
import com.dao.PassengerDao;

import entity.Passenger;

@WebServlet("/updatePassenger")
public class UpdateDetailServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String passengerName = req.getParameter("name");
		int trainNumber = Integer.parseInt(req.getParameter("trainNumber"));
		String trainName = req.getParameter("trainName");
		String classType = req.getParameter("classType");
		String journeyDate = req.getParameter("journeyDate");
		String source = req.getParameter("source");
		String destination = req.getParameter("destination");
		int pnrNumber = Integer.parseInt(req.getParameter("pnrNumber"));

		Passenger passenger = new Passenger(pnrNumber, passengerName, trainNumber, trainName, classType, journeyDate,
				source, destination);

		PassengerDao dao = new PassengerDao(DBConnect.getConn());
		HttpSession session = req.getSession();

		boolean success = dao.updatePassenger(passenger);

		if (success) {
			session.setAttribute("succMsg", "Passenger Details Updated Successfully!");
			resp.sendRedirect("home.jsp"); // Correct the redirect path if needed
		} else {
			session.setAttribute("errorMsg", "Something went wrong on the server!");
			resp.sendRedirect("home.jsp"); // Correct the redirect path if needed
		}
	}
}
