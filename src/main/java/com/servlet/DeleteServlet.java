package com.servlet;

import com.dao.PassengerDao;
import com.connections.DBConnect;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;

@WebServlet("/cancel")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pnrNumber = request.getParameter("pnrNumber");

        if (pnrNumber != null && !pnrNumber.isEmpty()) {
            try {
                PassengerDao dao = new PassengerDao(DBConnect.getConn());
                int pnr = Integer.parseInt(pnrNumber);
                boolean isDeleted = dao.deletePassenger(pnr);

                if (isDeleted) {
                    request.setAttribute("message", "Passenger with PNR " + pnrNumber + " has been successfully canceled.");
                } else {
                    request.setAttribute("message", "Failed to cancel the ticket. Please try again.");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("message", "Invalid PNR number format.");
            }
        } else {
            request.setAttribute("message", "No valid PNR number provided.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("delete.jsp");
        dispatcher.forward(request, response);
    }
}
