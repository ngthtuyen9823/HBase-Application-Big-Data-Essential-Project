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
					<a href="<c:url value='/adminInsertReader'/>"
						style="margin-right: 50px;">
						<button type="button" class="btn btn-dark">
							<i class="ace-icon fa fa-pencil"></i> Thêm thủ thư
						</button>
					</a>
				</div>
			</div>

			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> Bảng các thủ thư
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>MaDG</th>
								<th>Ho Ten</th>
								<th>Ngay Sinh</th>
								<th>Gioi Tinh</th>
								<th>CCCD</th>
								<th>Dia Chi</th>
								<th>SoDT</th>
								<th>Email</th>
								<th>Password</th>
								<th>Edit</th>

							</tr>
						</thead>
						<tfoot>
						<tbody>
								<tr>
									<td>${MaDG}</td>
									<td>${HoTen}</td>
									<td>${NgaySinh}</td>
									<td>${GioiTinh}</td>
									<td>${CCCD}</td>
									<td>${DiaChi}</td>
									<td>${SoDT}</td>
									<td>${Email}</td>
 									<td>${Password}</td>								
									<td><div class="hidden-sm hidden-xs btn-group">
<%-- 											<a
												href='<c:url value = '/adminviewItem?ProductID=${i.productID}'></c:url>'>
												<button class="btn btn-xs btn-info btn-sm">
													<i class="ace-icon fa fa-eye"></i>
												</button>
											</a>  --%>
											<a
												href="<c:url value='/adminUpdateBook?bookID=${i.isbn10}'/>">
												<button class="btn btn-xs btn-info btn-sm">
													<i class="ace-icon fa fa-pencil"></i>
												</button>
											</a>
 											<a href="#" class="trigger-btn" data-toggle="modal"
												data-target="#myModal"
												data-link="<c:url value='/adminDeleteBook?bookID=${i.isbn10}'/>">
												<button type="button" class="btn btn-xs btn-info btn-sm"
													id="liveToastBtn">
													<i class="ace-icon fa fa-trash"></i>
												</button>
											</a>
										</div>
									</td>
								</tr>
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