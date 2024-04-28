<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Table - Voucher</title>
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
							<h3 class="text-center font-weight-light my-4">Cập nhật mã khuyến mãi</h3>
						</div>
						<div class="card-body">
							<form action="adminUpdateVoucher" method="post">
								<div class="row">
									<div class="col-md-6">
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="voucherID"
												value="${voucher.voucherID}" readonly="readonly" /> <label>Mã</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="description"
												value="${voucher.description}" /> <label>Mô tả</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="discount"
												value="${voucher.discount}" /> <label>Giảm giá</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="minimumPrice"
												value="${voucher.minimumPrice}" /> <label>Giá tiền tối thiểu</label>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="quantity"
												value="${voucher.quantity}" /> <label>Số lượng</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="date" name="mfg"
												value="${voucher.mfg}" /> <label>Ngày bắt đầu</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="date" name="exp"
												value="${voucher.exp}" /> <label>Ngày kết thúc</label>
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