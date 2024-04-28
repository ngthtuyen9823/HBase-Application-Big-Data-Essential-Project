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
		<div class="container">
			<c:if test="${not empty message }">
				<div class="alert alert-${alert}">
					<strong>${message}!</strong>
				</div>
			</c:if>
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="card shadow-lg border-0 rounded-lg mt-5">
						<div class="card-header">
							<h3 class="text-center font-weight-light my-4">Cập nhật thông tin người giao hàng</h3>
						</div>
						<div class="card-body">
							<form action="adminUpdateShipper" method="post">
								<div class="row">
									<div class="col-md-6">
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="userID"
												value="${shipper.userID}" readonly="readonly" /> <label>Mã</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="firstName"
												value="${shipper.firstName}" /> <label>Họ</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="lastName"
												value="${shipper.lastName}" /> <label>Tên</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="address"
												value="${shipper.address}" /> <label>Địa chỉ</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="email"
												value="${shipper.email}" /> <label>Email</label>
										</div>
										<div class="form-floating mb-3">
											<div class="form-floating mb-3">
												<select class="form-control" name="gender">
													<option value="0" ${shipper.gender == 0 ? 'selected' : ''}>Nam</option>
													<option value="1" ${shipper.gender == 1 ? 'selected' : ''}>Nữ</option>
												</select> <label> Giới tính </label>
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="phone"
												value="${shipper.phone}" /> <label>Số điện thoại</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="date" name="dob"
												value="${shipper.dob}" /> <label>Ngày sinh</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="cid"
												value="${shipper.cid}" /> <label>CCCD</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="avatar"
												value="${shipper.avatar}" /> <label>Ảnh đại diện</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="area"
												value="${shipper.area}" /> <label>Khu vực</label>
										</div>
									</div>
								</div>
								<div class="text-center mt-4">
									<input type="submit" class="btn btn-primary" value="Cập nhật" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>