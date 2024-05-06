package com.azshop.controller.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.azshop.models.BookModel;
import com.azshop.service.IBookService;
import com.azshop.service.impl.BookServiceImpl;

@WebServlet(urlPatterns = { "/login", "/signup" })
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 4317368494648713183L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		if (req.getRequestURI().contains("/login")) {
			req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
		} else if (req.getRequestURI().contains("/signup")) {
			req.getRequestDispatcher("/views/web/signup.jsp").forward(req, resp);
		}
	}
}