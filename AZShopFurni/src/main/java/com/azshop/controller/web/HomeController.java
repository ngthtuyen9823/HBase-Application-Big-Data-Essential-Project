package com.azshop.controller.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = { "/home", "/contact" })
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 4317368494648713183L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");

		if (req.getRequestURI().contains("/home")) {
			req.getRequestDispatcher("/views/web/home.jsp").forward(req, resp);

		} else if (req.getRequestURI().contains("/contact")) {
			req.getRequestDispatcher("/views/web/contact.jsp").forward(req, resp);
		}
	}
}
