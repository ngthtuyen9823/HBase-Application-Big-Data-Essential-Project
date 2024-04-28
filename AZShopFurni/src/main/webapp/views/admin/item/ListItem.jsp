<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ListItem</title>
<style type="text/css">
    .circle {
      display: inline-block;
      width: 20px;
      height: 20px;
      border-radius: 50%;
    }
</style>
</head>
<body>
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">Mặt hàng</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="index.html">Bảng điều khiển</a></li>
				<li class="breadcrumb-item"><a href="<c:url value = "adminProduct"/>">Sản phẩm</a></li>
				<li class="breadcrumb-item active">Mặt hàng</li>
			</ol>
			<c:if test="${ProID != null}">
				<div class="card mb-4">
					<div class="card-body">
						<a href="<c:url value='/admininsertItem?ProID=${ProID}'/>"
							style="margin-right: 50px;">
							<button type="button" class="btn btn-dark">
								<i class="ace-icon fa fa-pencil"></i> Thêm mặt hàng
							</button>
						</a>
					</div>
				</div>
			</c:if>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> Bảng mặt hàng
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>Mã mặt hàng</th>
								<th>Mã sản phẩm</th>
								<th>Màu sắc</th>
								<th>Mã màu</th>
								<th>Kích thước</th>
								<th>Số lượng tồn</th>
								<th>Giá gốc</th>
								<th>Giá khuyến mãi</th>
								<th>Hành động</th>

							</tr>
						</thead>
						<tfoot>
						<tbody>
							<c:forEach var="i" items="${listItem}">
								<tr>
									<td>${i.itemID}</td>
									<td>${i.productID}</td>
									<td>${i.color}</td>
									<td><div style="background-color: ${i.colorCode}; width: 25px; height: 25px;"></div> </td>
									<td>${i.size}</td>
									<td>${i.stock}</td>
									<td>${i.originalPrice}</td>
									<td>${i.promotionPrice}</td>
									<td><div class="hidden-sm hidden-xs btn-group">
											<a href="<c:url value='/adminupdateItem?ItemID=${i.itemID}'/>">
												<button class="btn btn-xs btn-info btn-sm">
													<i class="ace-icon fa fa-pencil"></i>
												</button>
											</a> <a href="<c:url value='/admindeleteItem?ItemID=${i.itemID}&ProductID=${i.productID}'/>">
												<button type="button" class="btn btn-xs btn-info btn-sm"
													id="liveToastBtn"
													onclick="return confirm('Bạn có chắc chắn muốn xóa item có ID là : ${i.itemID} không?')">
													<i class="ace-icon fa fa-trash"></i>
												</button>
											</a>
										</div></td>
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