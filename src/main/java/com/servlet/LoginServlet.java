package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connections.DBConnect;
import com.dao.UserDao;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            // Get connection and UserDao
            UserDao userDao = new UserDao(DBConnect.getConn());

            // Validate user
            boolean isValid = userDao.validateUser(username, password);

            if (isValid) {
                // Login success
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("home.jsp");
            } else {
                // Login failed: Set error message and forward back to login page
                request.setAttribute("errorMsg", "Invalid Username Or Password!!");
                request.getRequestDispatcher("login.jsp").forward(request, response); // Use forward instead of redirect
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal server error");
        }
    }
}
