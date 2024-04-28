package com.azshop.controller.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.azshop.config.InitData;
import com.azshop.models.BookModel;
import com.azshop.service.IBookService;
import com.azshop.service.impl.BookServiceImpl;

@WebServlet(urlPatterns = "/home")
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 4317368494648713183L;
	private IBookService bookService = new BookServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");

		List<BookModel> listBook = bookService.findWithCount(5);
		req.setAttribute("books", listBook);

		req.getRequestDispatcher("/views/web/books.jsp").forward(req, resp);
	}
}
