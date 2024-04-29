package com.azshop.controller.admin;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.client.Connection;
import org.apache.hadoop.hbase.client.ConnectionFactory;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.client.Table;
import org.apache.hadoop.hbase.util.Bytes;

import com.azshop.dao.IBookDAO;
import com.azshop.dao.impl.BookDAOImpl;
import com.azshop.models.BookModel;

@WebServlet(urlPatterns = { "/adminBook", "/adminInsertBook", "/adminUpdateBook" })
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
			getBookUpdate(req, resp) ;
		}

        		byte[] numPagesBytes = result.getValue(DETAIL_CF, Bytes.toBytes("num_pages"));
        		if (numPagesBytes != null && numPagesBytes.length >= Bytes.SIZEOF_INT) {
        			bookModel.setNumbers(Bytes.toInt(numPagesBytes));
        		} else {
        			// Handle null value or insufficient byte array length
        			bookModel.setNumbers(0); // Set a default value or log a message
        		}

	private void getBookUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

                // Print or use the bookModel object
                listBook.add(bookModel);
            }
        } finally {
            table.close();
            connection.close();
        }
        System.out.println(listBook.get(2).getAuthors());

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
			String subtitle = req.getParameter("subtitle");
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
			book.setSubtitle(subtitle);
			book.setAuthors(authors);
			book.setDescription(description);
			book.setCategories(categories);
			book.setThumbnail(thumbnail);
			book.setPublished_year(published_year);
			book.setAverage_rating(average_rating);
			book.setNum_pages(num_pages);
			book.setRatings_count(ratings_count);

			bookService.update(book);

//			MessageUtil.showMessage(req, "addSuccess");
		} catch (Exception ex) {
//			MessageUtil.showMessage(req, "addFail");
		}
		ListBook(req, resp);
	}

	private void postinsert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String isbn13 = req.getParameter("isbn13");
			String isbn10 = req.getParameter("isbn10");
			String title = req.getParameter("title");
			String subtitle = req.getParameter("subtitle");
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
			book.setSubtitle(subtitle);
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
