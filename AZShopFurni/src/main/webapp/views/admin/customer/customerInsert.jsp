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
							<h3 class="text-center font-weight-light my-4">Thêm khách hàng mới</h3>
						</div>
						<div class="card-body">
							<form action="adminInsertCustomer" method="post">
								<div class="row">
									<div class="col-md-6">
											<div class="form-floating mb-3">
												<input class="form-control" type="text" name="firstName" />
												<label>Tên</label>
											</div>
											<div class="form-floating mb-3">
												<input class="form-control" type="text" name="lastName" />
												<label>Họ</label>
											</div>
											<div class="form-floating mb-3">
												<input class="form-control" type="text" name="address" /> <label>Địa chỉ</label>
											</div>
											<div class="form-floating mb-3">
												<select class="form-control" name="gender">
													<option value="0" ${customer.gender == 0 ? 'selected' : ''}>Nam</option>
													<option value="1" ${customer.gender == 1 ? 'selected' : ''}>Nữ</option>
												</select> <label> Giới tính </label>
											</div>
											<div class="form-floating mb-3">
											<input class="form-control" type="text" name="email"
												/> <label>Email</label>
										</div>	
										</div>
										<div class="col-md-6">
											<div class="form-floating mb-3">
												<input class="form-control" type="text" name="phone" /> <label>Số điện thoại</label>
											</div>
											<div class="form-floating mb-3">
												<input class="form-control" type="date" name="dob" /> <label>Ngày sinh</label>
											</div>
											<div class="form-floating mb-3">
												<input class="form-control" type="text" name="cid" /> <label>Căn cước công dân</label>
											</div>
											<div class="form-floating mb-3">
												<input class="form-control" type="text" name="avatar"
													value="https://storage.googleapis.com/web-budget/Image/Avatar/first.png" /> <label>Avatar</label>
											</div>
										</div>
									</div>
								<div class="text-center mt-4">
									<input type="submit" class="btn btn-primary" value="Thêm" />
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