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

@WebServlet(urlPatterns = { "/adminBook", "/adminInsertBook", "/adminUpdateBook", "/adminDeleteBook", "/adminReader",
		"/adminInsertReader", "/adminStaff" ,"/adminBorrow"})
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
		} else if (url.contains("/adminReader")) {
			ListReader(req, resp);
		} else if (url.contains("adminInsertReader")) {
			insertReader(req, resp);
		} else if (url.contains("/adminStaff")) {
			ListStaff(req, resp);
		} else if (url.contains("/adminBorrow")) {
			ListBorrow(req, resp);
		}

	}

	private void ListBorrow(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("MaDG", "101");
		req.setAttribute("MaTT", "1");
		req.setAttribute("MaSach", "11");
		req.setAttribute("NgayMuon", "12/02/2024");
		req.setAttribute("HanMuon", "7");
		req.setAttribute("NgayTra", "15/02/2024");
		req.setAttribute("TinhTrang", "Không");
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/borrow.jsp");
		rd.forward(req, resp);
		
	}

	private void ListStaff(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("MaDG", "101");
		req.setAttribute("HoTen", "Nguyen Van A");
		req.setAttribute("NgaySinh", "05/03/2003");
		req.setAttribute("CCCD", "1234567");
		req.setAttribute("DiaChi", "HCM");
		req.setAttribute("SoDT", "0904257931");
		req.setAttribute("Email", "nva11@gmail.com");
		req.setAttribute("Password", "abc123");
		req.setAttribute("GioiTinh", "Nam");

		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/staff.jsp");
		rd.forward(req, resp);

	}

	private void insertReader(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/insertReader.jsp");
		rd.forward(req, resp);
	}

	private void ListReader(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("MaDG", "101");
		req.setAttribute("HoTen", "Nguyen Van A");
		req.setAttribute("NgaySinh", "05/03/2003");
		req.setAttribute("CCCD", "1234567");
		req.setAttribute("DiaChi", "HCM");
		req.setAttribute("SoDT", "0904257931");
		req.setAttribute("Email", "nva11@gmail.com");
		req.setAttribute("Password", "abc123");
		req.setAttribute("GioiTinh", "Nam");

		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/reader.jsp");
		rd.forward(req, resp);

	}

	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * String bookID = req.getParameter("bookID"); bookService.delete(bookID);
		 */
		ListBook(req, resp);
	}

	private void getBookUpdate(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
//		String bookID = req.getParameter("bookID");
//		BookModel book = bookService.findOne(bookID);
//		req.setAttribute("book", book);
//		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/updateBook.jsp");
//		rd.forward(req, resp);
		BookModel book = new BookModel();
		book.setIsbn13("1");
		book.setIsbn10("2");
		book.setTitle("Muôn Kiếp Nhân Sinh");
		book.setCategories("Tâm Linh");
		book.setNum_pages(10);
		book.setDescription("Gieo nhân nào gặp quả đấy");
		book.setRatings_count(10);
		book.setAverage_rating(5);
		book.setAuthors("Nguyên Phong");
		book.setThumbnail("https://fahashavn");
		req.setAttribute("book", book);
		RequestDispatcher rd = req.getRequestDispatcher("/views/admin/updateBook.jsp");
		rd.forward(req, resp);
	}

	private void ListBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		List<BookModel> listBook = bookService.findAll();
//		req.setAttribute("books", listBook);
//		
//		req.getRequestDispatcher("/views/admin/books.jsp").forward(req, resp);

		List<BookModel> books = new ArrayList<BookModel>();
		BookModel book = new BookModel();
		book.setIsbn13("1");
		book.setIsbn10("2");
		book.setTitle("Muôn Kiếp Nhân Sinh");
		book.setCategories("Tâm Linh");
		book.setNum_pages(10);
		book.setDescription("Gieo nhân nào gặp quả đấy");
		book.setRatings_count(10);
		book.setAverage_rating(5);
		book.setAuthors("Nguyên Phong");
		book.setThumbnail("https://fahashavn");

		books.add(book);
		req.setAttribute("books", books);
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
		} else if (url.contains("adminInsertReader")) {
			ListReader(req, resp);
		}
	}

	private void updateBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * try { String isbn13 = req.getParameter("isbn13"); String isbn10 =
		 * req.getParameter("isbn10"); String title = req.getParameter("title"); String
		 * authors = req.getParameter("authors"); String categories =
		 * req.getParameter("categories"); String thumbnail =
		 * req.getParameter("thumbnail"); String description =
		 * req.getParameter("description"); int published_year =
		 * Integer.parseInt(req.getParameter("published_year")); float average_rating =
		 * Float.parseFloat(req.getParameter("average_rating")); int num_pages =
		 * Integer.parseInt(req.getParameter("num_pages")); int ratings_count =
		 * Integer.parseInt(req.getParameter("ratings_count"));
		 * 
		 * BookModel book = new BookModel(); book.setIsbn13(isbn13);
		 * book.setIsbn10(isbn10); book.setTitle(title); book.setAuthors(authors);
		 * book.setDescription(description); book.setCategories(categories);
		 * book.setThumbnail(thumbnail); book.setPublished_year(published_year);
		 * book.setAverage_rating(average_rating); book.setNum_pages(num_pages);
		 * book.setRatings_count(ratings_count); bookService.update(book); } catch
		 * (Exception ex) {
		 * 
		 * }
		 */
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
