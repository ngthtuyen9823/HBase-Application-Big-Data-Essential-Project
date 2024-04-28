<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateItem</title>
</head>
<body>
	<main>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="card shadow-lg border-0 rounded-lg mt-5">
						<div class="card-header">
							<h3 class="text-center font-weight-light my-4">Cập nhật mặt
								hàng</h3>
						</div>
						<div class="card-body">
							<form action="adminupdateItem" method="post"
								enctype="multipart/form-data">
								<div class="row">
									<div class="col-md-6">
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="productID"
												readonly="readonly" value="${item.productID}" /> <label>Mã
												sản phẩm</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="color"
												value="${item.color}" /> <label>Màu sắc</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="color" name="colorCode"
												id="colorCodeInput" value="${ item.colorCode}" /> <label>Mã
												màu</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="size"
												value="${item.size}" /> <label>Kích thước</label>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="stock"
												value="${item.stock}" /> <label>Số lượng tồn</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="originalPrice"
												id="originalPriceInput" value="${item.originalPrice}" /> <label>
												Giá gốc</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" type="text" name="promotionPrice"
												value="${item.promotionPrice}" /> <label>Giá khuyến
												mãi</label>
										</div>
										<div class="form-floating mb-3">
											<c:if test="${empty images}">
												<div class="input-group" onclick="selectFile()"
													style="height: 58px;">
													<input id="fileInput" name="image" type="file"
														style="display: none;" multiple> <label
														class="input-group-btn"
														style="align-items: center; display: flex;"> <span
														class="btn btn-primary"
														style="height: 58px; display: flex; align-items: center;">Chọn
															ảnh</span>
													</label> <input id="fileCountInput" type="text"
														class="form-control" readonly
														placeholder="Chưa có ảnh nào được chọn" style="height: 58px">
												</div>
											</c:if>
										</div>
									</div>
								</div>

								<div class="text-center mt-4">
									<c:forEach var="i" items="${ images}">
										<img src="${i.image}" height="80px">
									</c:forEach>
									<c:if test="${not empty images}">
									<div class="text-center mt-4">
										<a href="<c:url value="/updateimage?ItemID=${item.itemID}"/>"><button
												type="button" class="btn btn-primary">Xóa ảnh</button></a>
									</div></c:if>
								</div>
								<div class="text-center mt-4">
									<input type="hidden" name="itemID" value="${item.itemID}" /> <input
										type="submit" class="btn btn-primary" value="Cập nhật" />
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