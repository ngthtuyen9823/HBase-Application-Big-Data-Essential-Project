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
							<i class="ace-icon fa fa-pencil"></i> Thêm phiếu mượn
						</button>
					</a>
				</div>
			</div>

			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> Bảng lịch sử mượn trả
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>MaDG</th>
								<th>MaTT</th>
								<th>MaSach</th>
								<th>NgayMuon</th>
								<th>HanMuon</th>
								<th>NgayTra</th>
								<th>TinhTrang<th>
								<th>Edit</th>

							</tr>
						</thead>
						<tbody>
								<tr>
									<td>${MaDG}</td>
									<td>${MaTT}</td>
									<td>${MaSach}</td>
									<td>${NgayMuon}</td>
									<td>${HanMuon}</td>
									<td>${NgayTra}</td>
									<td>${TinhTrang}</td>	
									<td></td>						
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
					</table>
				</div>
			</div>
		</div>
	</section>

	<script>
		
	</script>

</body>

</html>