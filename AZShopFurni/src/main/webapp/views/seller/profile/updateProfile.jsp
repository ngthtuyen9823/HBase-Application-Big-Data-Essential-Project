<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Table - Seller</title>
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
							<h3 class="text-center font-weight-light my-4">Cập nhật
								thông tin</h3>
						</div>
						<div class="card-body">
							<form action="sellerUpdateInfor" method="post">
								<div class="row">
									<div class="col-md-6">
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="UserID"
												value="${userModel.userID}" readonly="readonly" /> <label>Mã
												nhân viên</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="FirstName"
												value="${userModel.firstName}" /> <label>Tên nhân
												viên</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="LastName"
												value="${userModel.lastName}" /> <label>Họ</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="Address"
												value="${userModel.address}" /> <label>Địa chỉ</label>
										</div>
										<div class="form-floating mb-3">
											<select class="form-control" name="Gender"
												style="height: calc(3.5rem + 2px);">
												<option value="0">Nam</option>
												<c:choose>
													<c:when test="${userModel.gender==1}">
														<option value="1" selected>Nữ</option>
													</c:when>
													<c:otherwise>
														<option value="1">Nữ</option>
													</c:otherwise>
												</c:choose>
											</select> <label> Giới tính </label>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="Phone"
												value="${userModel.phone}" /> <label>Số điện thoại</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="date" name="Dob"
												value="${userModel.dob}" /> <label>Ngày sinh</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="Cid"
												value="${userModel.cid}" /> <label>Căn cước công
												dân</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="Email"
												value="${userModel.email}" /> <label>Email</label>
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