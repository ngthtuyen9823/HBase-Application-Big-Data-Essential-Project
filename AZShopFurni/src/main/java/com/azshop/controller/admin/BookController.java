package com.azshop.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
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

@WebServlet(urlPatterns = { "/adminBook", "/adminInsertBook", "/adminUpdateBook", "/adminDeleteBook" })
public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IBookService bookService = new BookServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
		String url = req.getRequestURI().toString();
		if (url.contains("/adminBook")) {
			ListBook(req, resp);
		} else if (url.contains("adminInsertBook")) {
			insert(req, resp);
		} else if (url.contains("adminUpdateBook")) {
			getBookUpdate(req, resp);
		} else if (url.contains("adminDeleteBook")) {
			delete(req, resp);
		}

	}

	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String bookID = req.getParameter("bookID");
		bookService.delete(bookID);
		ListBook(req, resp);
	}

	private void getBookUpdate(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String bookID = req.getParameter("bookID");
		BookModel book = bookService.findOne(bookID);
		req.setAttribute("book", book);
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/updateBook.jsp");
		rd.forward(req, resp);

	}

	private void ListBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<BookModel> listBook = bookService.findAll();
		req.setAttribute("books", listBook);
		
		req.getRequestDispatcher("/views/admin/books.jsp").forward(req, resp);

	}

	private void insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/insertBook.jsp");
		rd.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI().toString();
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		if (url.contains("adminInsertBook")) {
			postinsert(req, resp);
		} else if (url.contains("adminUpdateBook")) {
			updateBook(req, resp);
		}
	}

	private void updateBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String isbn13 = req.getParameter("isbn13");
			String isbn10 = req.getParameter("isbn10");
			String title = req.getParameter("title");
			String authors = req.getParameter("authors");
			String categories = req.getParameter("categories");
			String thumbnail = req.getParameter("thumbnail");
			String description = req.getParameter("description");
			int published_year = Integer.parseInt(req.getParameter("published_year"));
			float average_rating = Float.parseFloat(req.getParameter("average_rating"));
			int num_pages = Integer.parseInt(req.getParameter("num_pages"));
			int ratings_count = Integer.parseInt(req.getParameter("ratings_count"));

			BookModel book = new BookModel();
			book.setIsbn13(isbn13);
			book.setIsbn10(isbn10);
			book.setTitle(title);
			book.setAuthors(authors);
			book.setDescription(description);
			book.setCategories(categories);
			book.setThumbnail(thumbnail);
			book.setPublished_year(published_year);
			book.setAverage_rating(average_rating);
			book.setNum_pages(num_pages);
			book.setRatings_count(ratings_count);
			bookService.update(book);
		} catch (Exception ex) {

		}
		ListBook(req, resp);

	}

	private void postinsert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String isbn13 = req.getParameter("isbn13");
			String isbn10 = req.getParameter("isbn10");
			String title = req.getParameter("title");
			String authors = req.getParameter("authors");
			String categories = req.getParameter("categories");
			String thumbnail = req.getParameter("thumbnail");
			String description = req.getParameter("description");
			int published_year = Integer.parseInt(req.getParameter("published_year"));
			float average_rating = Float.parseFloat(req.getParameter("average_rating"));
			int num_pages = Integer.parseInt(req.getParameter("num_pages"));
			int ratings_count = Integer.parseInt(req.getParameter("ratings_count"));

			BookModel book = new BookModel();
			book.setIsbn13(isbn13);
			book.setIsbn10(isbn10);
			book.setTitle(title);
			book.setAuthors(authors);
			book.setDescription(description);
			book.setCategories(categories);
			book.setThumbnail(thumbnail);
			book.setPublished_year(published_year);
			book.setAverage_rating(average_rating);
			book.setNum_pages(num_pages);
			book.setRatings_count(ratings_count);

			bookService.insert(book);
//			MessageUtil.showMessage(req, "addSuccess");
		} catch (Exception ex) {
//			MessageUtil.showMessage(req, "addFail");
		}
		ListBook(req, resp);
	}
}
