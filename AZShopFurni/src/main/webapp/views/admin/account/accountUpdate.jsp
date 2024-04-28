<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Table - Account</title>
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
							<h3 class="text-center font-weight-light my-4">Chỉnh sửa tài khoản</h3>
						</div>
						<div class="card-body">
							<form action="adminUpdateAccount" method="post">
								<div class="row">
									<div class="form-floating mb-3">
										<input class="form-control" type="text" name="userID"
											value="${account.userID}" readonly="readonly" /> <label>Mã khách hàng</label>
									</div>
									<div class="form-floating mb-3">
										<input class="form-control" type="text" name="userName"
											value="${account.userName}" /> <label>Tên đăng nhập</label>
									</div>
									<div class="form-floating mb-3">
										<input class="form-control" type="text" name="password"
											value="${account.password}" /> <label>Mật khẩu</label>
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

