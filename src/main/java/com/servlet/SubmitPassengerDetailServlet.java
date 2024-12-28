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

@WebServlet("/add_passen")
public class SubmitPassengerDetailServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("pass_name");
        String source = req.getParameter("source");
        String destination = req.getParameter("destination");
        String classType = req.getParameter("classType");
        String journeyDate = req.getParameter("journeyDate");
        String trainName = req.getParameter("trainName");
        int trainNum = 0;

        try {
            trainNum = Integer.parseInt(req.getParameter("trainNumber"));
        } catch (NumberFormatException e) {
            e.printStackTrace(); // Log the exception
        }

        // Check if required parameters are not null or empty
        if (username == null || source == null || destination == null || classType == null || journeyDate == null || trainName == null || trainNum == 0) {
            HttpSession session = req.getSession();
            session.setAttribute("errorMsg", "Please fill all the fields.");
            resp.sendRedirect("addPassenger.jsp");
            return;
        }

        Passenger pass = new Passenger(username, trainNum, trainName, classType, journeyDate, source, destination);
        PassengerDao passDao = new PassengerDao(DBConnect.getConn());

        boolean success = passDao.addPassenger(pass);
        HttpSession session = req.getSession();

        if (success) {
        	session.setAttribute("succMsg", "Passenger Details submitted successfully!");
            resp.sendRedirect("home.jsp");
        } else {
            session.setAttribute("errorMsg", "Something went wrong on the server.");
            resp.sendRedirect("addPassenger.jsp");
        }
    }
}
