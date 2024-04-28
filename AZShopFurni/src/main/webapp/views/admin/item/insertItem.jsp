<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InsertItem</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<main>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="card shadow-lg border-0 rounded-lg mt-5">
						<div class="card-header">
							<h3 class="text-center font-weight-light my-4">Thêm mặt hàng</h3>
						</div>
						<div class="card-body">
							<form action="admininsertItem" method="post"
								enctype="multipart/form-data">
								<div class="row">
									<div class="col-md-6">
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="productID"
												readonly="readonly" value="${ProID}" /> <label>Mã
												sản phẩm</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="color" /> <label>Màu
												sắc</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="color" name="colorCode"
												id="colorCodeInput" /> <label>Mã màu</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="size" /> <label>Kích
												thước</label>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="stock" /> <label>Số
												lượng tồn</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="originalPrice"
												id="originalPriceInput" /> <label>Giá gốc</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="promotionPrice" />
											<label>Giá khuyến mãi</label>
										</div>
										<div class="form-floating mb-3">
											<div class="input-group" onclick="selectFile()"
												style="height: 58px;">
												<input id="fileInput" name="image" type="file"
													style="display: none;" multiple> <label
													class="input-group-btn"
													style="align-items: center; display: flex;"> <span
													class="btn btn-primary"
													style="height: 58px; display: flex; align-items: center;">Chọn
														ảnh</span>
												</label> <input id="fileCountInput" type="text" class="form-control"
													readonly placeholder="Chưa có ảnh nào được chọn" style="height: 58px">
											</div>
										</div>
									</div>
								</div>
								<!--  <input type="file" name="image" multiple="multiple">-->
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
	<script type="text/javascript">
		function selectFile() {
			const fileInput = document.getElementById('fileInput');
			fileInput.click();
		}

		const fileInput = document.getElementById('fileInput');
		fileInput.addEventListener('change', updateFileCount);

		function updateFileCount() {
			const fileInput = document.getElementById('fileInput');
			const fileCountInput = document.getElementById('fileCountInput');

			if (fileInput.files.length > 0) {
				fileCountInput.value = fileInput.files.length + ' tệp đã chọn';
			} else {
				fileCountInput.value = '';
			}
		}
	</script>
</body>
</html>