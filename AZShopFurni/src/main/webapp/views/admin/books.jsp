<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<link href='<c:url value="/templates/web/css/product.css"/>'
	rel="stylesheet" />
</head>

<body>
	<!-- Product -->
	<section class="bg0 p-t-23 p-b-130">
		<div class="container">
			<div class="card mb-4">
				<div class="card-body">
					<a href="<c:url value='/adminInsertBook'/>"
						style="margin-right: 50px;">
						<button type="button" class="btn btn-dark">
							<i class="ace-icon fa fa-pencil"></i> Thêm sách
						</button>
					</a>
				</div>
			</div>

			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> Bảng các đầu sách
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>ISBN13</th>
								<th>ISBN10</th>
								<th>Title</th>
								<th>Authors</th>
								<th>Categories</th>
								<th>Thumbnail</th>
								<th>Description</th>
								<th>Publish Year</th>
								<th>Average Rating</th>
								<th>Num Page</th>
								<th>Rating count</th>
								<th>Edit</th>

							</tr>
						</thead>
						<tfoot>
						<tbody>
							<c:forEach var="i" items="${books}">
								<tr>
									<td>${i.isbn13}</td>
									<td>${i.isbn10}</td>
									<td>${i.title}</td>
									<td>${i.authors}</td>
									<td>${i.categories}</td>
									<td>${i.thumbnail}</td>
									<td>${i.description}</td>
									<td>${i.published_year}</td>
									<td>${i.average_rating}</td>
									<td>${i.numbers}</td>
									<td>${i.ratings_count}</td>
									
									<td><div class="hidden-sm hidden-xs btn-group">
<%-- 											<a
												href='<c:url value = '/adminviewItem?ProductID=${i.productID}'></c:url>'>
												<button class="btn btn-xs btn-info btn-sm">
													<i class="ace-icon fa fa-eye"></i>
												</button>
											</a>  --%>
											<a
												href="<c:url value='/adminUpdateBook?bookID=${i.isbn13}'/>">
												<button class="btn btn-xs btn-info btn-sm">
													<i class="ace-icon fa fa-pencil"></i>
												</button>
											</a>
<%-- 											<a href="#" class="trigger-btn" data-toggle="modal"
												data-target="#myModal"
												data-link="<c:url value='/admindeleteProduct?ProductID=${i.productID}'/>">
												<button type="button" class="btn btn-xs btn-info btn-sm"
													id="liveToastBtn">
													<i class="ace-icon fa fa-trash"></i>
												</button>
											</a> --%>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</section>

	<script>
		
	</script>

</body>

</html>