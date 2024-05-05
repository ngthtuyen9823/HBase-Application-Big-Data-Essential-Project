package com.azshop.controller.web;

import java.io.IOException;
import java.util.List;
import java.util.Map.Entry;

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
		List<Entry<String, Long>> listCategories = bookService.findToFilter().get(0);
		List<Entry<String, Long>> listAuthors = bookService.findToFilter().get(1);

		if (req.getRequestURI().contains("/books")) {
			List<BookModel> listBook = bookService.findWithCount(20);

			req.setAttribute("books", listBook);
			req.setAttribute("listCate", listCategories);
			req.setAttribute("listAuthors", listAuthors);

			String id = req.getParameter("id");
			if (id != null) {
				BookModel bookModel = bookService.findOne(id);
				List<BookModel> listBookCate = bookService.findSameCategory(bookModel.getCategories());
				req.setAttribute("listBookCate", listBookCate);
				req.setAttribute("book", bookModel);
				req.getRequestDispatcher("/views/web/bookdetail.jsp").forward(req, resp);
				return; // Return after forwarding, to avoid further processing
			}
		}

		if (req.getRequestURI().contains("search")) {
			if (req.getParameter("keySearch") != null) {
				String key = req.getParameter("keySearch");
				System.out.println(key);
				List<BookModel> listBook = bookService.findByName(key);

				req.setAttribute("books", listBook);
				req.setAttribute("listCate", listCategories);
				req.getRequestDispatcher("/views/web/books.jsp").forward(req, resp);
				return;
			}
			if (req.getParameter("authorsKey") != null) {
				String key = req.getParameter("authorsKey");
				System.out.println(key);

				List<BookModel> listBook = bookService.findByAuthor(key);
				req.setAttribute("listCate", listCategories);
				req.setAttribute("listAuthors", listAuthors);
				req.setAttribute("books", listBook);
				req.getRequestDispatcher("/views/web/books.jsp").forward(req, resp);
				return;

			}

		}
		if (req.getRequestURI().contains("filter")) {
			if (req.getParameter("avgRating") != null) {
				int key = Integer.parseInt(req.getParameter("avgRating"));
				System.out.println(key);
				List<BookModel> listBook = bookService.filterByRating(key);

				req.setAttribute("books", listBook);
				req.setAttribute("listCate", listCategories);
				req.setAttribute("listAuthors", listAuthors);
				req.getRequestDispatcher("/views/web/books.jsp").forward(req, resp);
				return;
			}

			if (req.getParameter("Cate") != null) {
				String key = req.getParameter("Cate");
				List<BookModel> listBook = bookService.findByCategory(key);

				req.setAttribute("books", listBook);
				req.setAttribute("listCate", listCategories);
				req.setAttribute("listAuthors", listAuthors);
				req.getRequestDispatcher("/views/web/books.jsp").forward(req, resp);
				return;
			}

			if (req.getParameter("Author") != null) {
				String key = req.getParameter("Author");
				List<BookModel> listBook = bookService.findByAuthor(key);

				req.setAttribute("books", listBook);
				req.setAttribute("listCate", listCategories);
				req.setAttribute("listAuthors", listAuthors);
				req.getRequestDispatcher("/views/web/books.jsp").forward(req, resp);
				return;
			}
		}
		req.getRequestDispatcher("/views/web/books.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
