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

@WebServlet(urlPatterns = { "/home", "/contact", "/BorrowBook" })
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 4317368494648713183L;
	IBookService bookService = new BookServiceImpl();

	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");

		if (req.getRequestURI().contains("/home")) {
			List<Object> list = bookService.findTop();
			List<BookModel> listTopRatingBook = (List<BookModel>) list.get(0);
			List<BookModel> listTopRatingCountBook = (List<BookModel>) list.get(1);
			List<String> listTopAuthor = bookService.findTopAuthor();
			req.setAttribute("topratingbook", listTopRatingBook);
			req.setAttribute("topratingcountbook", listTopRatingCountBook);
			req.setAttribute("topauthor", listTopAuthor);
			req.getRequestDispatcher("/views/web/home.jsp").forward(req, resp);

		} else if (req.getRequestURI().contains("/contact")) {
			req.getRequestDispatcher("/views/web/contact.jsp").forward(req, resp);
		} else if (req.getRequestURI().contains("/BorrowBook")) {
			req.getRequestDispatcher("/views/web/borrow.jsp").forward(req, resp);
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");

		if (req.getRequestURI().contains("/BorrowBook")) {
			req.getRequestDispatcher("/views/web/home.jsp").forward(req, resp);
		}
	}
}
