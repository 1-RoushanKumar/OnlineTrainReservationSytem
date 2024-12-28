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
import entity.User;

@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// Retrieve form parameters
		String name = req.getParameter("name");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();

		// Input validation
		if (name == null || name.trim().isEmpty() || password == null || password.trim().isEmpty()) {
			session.setAttribute("errorMsg", "Name and Password cannot be empty!");
			resp.sendRedirect("addUser.jsp");
			return;
		}

		// Create User object
		User user = new User(name, password);

		// DAO object to handle database operations
		UserDao dao = new UserDao(DBConnect.getConn());
		boolean isSuccess = dao.addUser(user);

		// Redirect based on operation success
		if (isSuccess) {
			session.setAttribute("succMsg", "User details submitted successfully!");
		} else {
			session.setAttribute("errorMsg", "Something went wrong on the server!");
		}
		resp.sendRedirect("login.jsp");
	}
}
