<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Table - Customer</title>
</head>
<body>
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">QUẢN LÝ KHÁCH HÀNG</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Khách hàng</li>
			</ol>
			<h3>Top 3 khách hàng thân thiết</h3>
			<div class="row">
				<div class="col-xl-3 col-md-6">
					<div class="card bg-primary text-white mb-4">
						<div class="card-body">
							Khách hàng: ${list3[0].id} <br> ${list3[0].firstName}
							${list3[0].lastName} <br> Tổng thanh toán :
							<fmt:formatNumber type="currency" value="${list3[0].totalMoney}"
								currencyCode="VND" pattern="#,##0 VND" var="formattedPrice" />
							${formattedPrice}
						</div>

						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a
								href="/AZShopFurni/adminInformationCustomer?customerID=${list3[0].id}"
								class="small text-white">Xem chi tiết</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"> </i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card bg-warning text-white mb-4">
						<div class="card-body">
							Khách hàng: ${list3[1].id} <br> ${list3[1].firstName}
							${list3[1].lastName} <br> Tổng thanh toán :
							<fmt:formatNumber type="currency" value="${list3[1].totalMoney}"
								currencyCode="VND" pattern="#,##0 VND" var="formattedPrice" />
							${formattedPrice}
						</div>

						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a
								href="/AZShopFurni/adminInformationCustomer?customerID=${list3[1].id}"
								class="small text-white">Xem chi tiết</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"> </i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card bg-success text-white mb-4">
						<div class="card-body">
							Khách hàng: ${list3[2].id} <br> ${list3[2].firstName}
							${list3[2].lastName} <br> Tổng thanh toán :
							<fmt:formatNumber type="currency" value="${list3[2].totalMoney}"
								currencyCode="VND" pattern="#,##0 VND" var="formattedPrice" />
							${formattedPrice}
						</div>

						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a
								href="/AZShopFurni/adminInformationCustomer?customerID=${list3[2].id}"
								class="small text-white">Xem chi tiết</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"> </i>
							</div>
						</div>
					</div>
				</div>

			</div>

			<h1 class="mt-4">Quản lý khách hàng</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="adminHome">Trang chủ</a></li>
				<li class="breadcrumb-item active">Khách hàng</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					<a href="<c:url value='/adminInsertCustomer'/>">
						<button type="button" class="btn btn-dark">
							<i class="ace-icon fa fa-pencil"></i> Thêm khách hàng mới
						</button>
					</a>
				</div>
			</div>
			<c:if test="${not empty message }">
				<div class="alert alert-${alert}">
					<strong>${message}!</strong>
				</div>
			</c:if>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> Bảng khách hàng
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>Mã</th>
								<th>Họ tên</th>
								<th>Địa chỉ</th>
								<th>Giới tính</th>
								<th>Số điện thoại</th>
								<th>Ngày sinh</th>
								<th>CCCD</th>
								<th>Email</th>
								<th>Cập nhật</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" items="${listCustomer}">
								<tr>
									<td>${i.userID}</td>
									<td>${i.firstName} ${i.lastName}</td>
									<td>${i.address}</td>
									<td><c:choose>
											<c:when test="${i.gender == 1}">Nữ</c:when>
											<c:when test="${i.gender == 0}">Nam</c:when>
											<c:otherwise>Không rõ</c:otherwise>
										</c:choose></td>
									<td>${i.phone}</td>
									<td>${i.dob}</td>
									<td>${i.cid}</td>
									<td>${i.email}</td>
									<td>
										<div class="hidden-sm hidden-xs btn-group">
											<a
												href="<c:url value='/adminUpdateCustomer?customerID=${i.userID}'/>">
												<button class="btn btn-xs btn-info btn-sm">
													<i class="ace-icon fa fa-pencil"></i>
												</button>
											</a> <a href="#" class="trigger-btn" data-toggle="modal"
												data-target="#myModal"
												data-link="<c:url value='/adminDeleteCustomer?customerID=${i.userID}'/>">
												<button type="button" class="btn btn-xs btn-info btn-sm"
													id="liveToastBtn">
													<i class="ace-icon fa fa-trash"></i>
												</button>
											</a> <a
												href="<c:url value='/adminInformationCustomer?customerID=${i.userID}'/>">
												<button type="button" class="btn btn-xs btn-info btn-sm"
													id="liveToastBtn">
													<i class="fa fa-info-circle" aria-hidden="true"></i>
												</button>
											</a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</main>
</body>
</html>