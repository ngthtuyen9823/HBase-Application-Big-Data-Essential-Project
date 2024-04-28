<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Table - Shipper</title>
</head>
<body>
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">QUẢN LÝ NHÂN VIÊN GIAO HÀNG</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="adminHome">Trang chủ</a></a></li>
				<li class="breadcrumb-item active">Nhân viên giao hàng</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					<a href="<c:url value='/adminInsertShipper'/>">
						<button type="button" class="btn btn-dark">
							<i class="ace-icon fa fa-pencil"></i> Thêm nhân viên giao hàng mới
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
					<i class="fas fa-table me-1"></i> Bảng dữ liệu người bán hàng
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>Mã</th>
								<th>Tên</th>
								<th>Địa chỉ</th>
								<th>Giới tính</th>
								<th>Số điện thoại</th>
								<th>Ngày sinh</th>
								<th>CCCD</th>
								<!-- <th>Ảnh đại diện</th> -->
								<th>Khu vực</th>
								<th>Email</th>
								<th>Hành động</th>
							</tr>
						</thead>
						<tfoot>
						<tbody>
							<c:forEach var="i" items="${listshipper}">
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
									<%-- <td>${i.avatar}</td> --%>
									<td>${i.area}</td>
									<td>${i.email}</td>
									<td>
										<div class="hidden-sm hidden-xs btn-group">
											<a
												href="<c:url value='/adminUpdateShipper?userID=${i.userID}'/>">
												<button class="btn btn-xs btn-info btn-sm">
													<i class="ace-icon fa fa-pencil"></i>
												</button>
											</a> 
											<a href="#" class="trigger-btn" data-toggle="modal"
												data-target="#myModal"
												data-link="<c:url value='/adminDeleteShipper?userID=${i.userID}'/>">
												<button type="button" class="btn btn-xs btn-info btn-sm"
													id="liveToastBtn">
													<i class="ace-icon fa fa-trash"></i>
												</button>
											</a>
											<a
												href="<c:url value='/adminInformationShipper?userID=${i.userID}'/>">
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
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</main>
</body>
</html>