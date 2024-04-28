package com.azshop.controller.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.azshop.models.BookModel;
import com.azshop.service.IBookService;
import com.azshop.service.impl.BookServiceImpl;

@WebServlet(urlPatterns = { "/books", "/search", "/filter" })
public class BookController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	IBookService bookService = new BookServiceImpl();
	RequestDispatcher rd = null;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");

		if (req.getRequestURI().contains("/books")) {
			List<BookModel> listBook = bookService.findWithCount(15);
			req.setAttribute("books", listBook);

			String idString = req.getParameter("id");
			if (idString != null) {
				int id = Integer.parseInt(req.getParameter("id"));
				BookModel bookModel = bookService.findOne(id);
				req.setAttribute("book", bookModel);
				req.getRequestDispatcher("/views/web/bookdetail.jsp").forward(req, resp);
				return; // Return after forwarding, to avoid further processing
			}
		}
		req.getRequestDispatcher("/views/web/books.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
