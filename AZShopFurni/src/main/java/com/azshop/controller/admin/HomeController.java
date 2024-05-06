package com.azshop.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.azshop.models.BookModel;
import com.azshop.service.IBookService;
import com.azshop.service.impl.BookServiceImpl;

@WebServlet(urlPatterns = { "/adminHome" })
public class HomeController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private IBookService bookService = new BookServiceImpl();

	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		resp.setCharacterEncoding("UTF-8");
		req.setCharacterEncoding("UTF-8");
//
//		List<Object> list = bookService.findToReport();
//		List<Entry<Integer, Long>> countPubYear = (List<Entry<Integer, Long>>) list.get(0);
//		List<Entry<Integer, Long>> countRatingPubYear = (List<Entry<Integer, Long>>) list.get(1);
//		List<Entry<Float, Long>> countavgRating = (List<Entry<Float, Long>>) list.get(2);
//
//		req.setAttribute("countpubyear", countPubYear);
//		req.setAttribute("countratingpubyear", countRatingPubYear);
//		req.setAttribute("countavgrating", countavgRating);
//
//		req.getRequestDispatcher("/views/admin/statistical.jsp").forward(req, resp);
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
}