<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<style>
.avatar-lg {
	height: 5rem;
	width: 5rem;
}

.font-size-18 {
	font-size: 18px !important;
}

.font-size-20 {
	font-size: 20px !important;
}

.text-truncate {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

a {
	text-decoration: none !important;
}

.w-xl {
	min-width: 160px;
}

.card {
	margin-bottom: 24px;
	-webkit-box-shadow: 0 2px 3px #e4e8f0;
	box-shadow: 0 2px 3px #e4e8f0;
}

.card {
	position: relative;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	-ms-flex-direction: column;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid #eff0f2;
	border-radius: 1rem;
}

.product-item {
	display: flex;
	flex-wrap: nowrap;
	align-items: flex;
	margin-top: 20px;
}

.product-image {
	margin-left: 30px;
	margin-top: 10px;
	margin-bottom: 0px;
}

.product-info {
	flex-grow: 2;
}

.price-info {
	flex-grow: 10;
	justify-content: flex-start;
	text-align: center;
	align-items: center;
}

.order-details-container {
	margin-bottom: 0;
}

.track-line {
	height: 2px !important;
	background-color: #488978;
	opacity: 1;
	flex: 1 1 auto !important;
}

.off-track-line {
	height: 2px !important;
	background-color: #808080;
	opacity: 1;
	flex: 1 1 auto !important;
}

.dot {
	height: 10px;
	width: 10px;
	margin-left: 3px;
	margin-right: 3px;
	margin-top: 0px;
	background-color: #488978;
	border-radius: 50%;
	display: inline-block
}

.off-dot {
	height: 10px;
	width: 10px;
	margin-left: 3px;
	margin-right: 3px;
	margin-top: 0px;
	background-color: #808080;
	border-radius: 50%;
	display: inline-block
}

.big-dot {
	height: 25px;
	width: 25px;
	margin-left: 0px;
	margin-right: 0px;
	margin-top: 0px;
	background-color: #488978;
	border-radius: 50%;
	display: inline-block;
}

.off-big-dot {
	height: 25px;
	width: 25px;
	margin-left: 0px;
	margin-right: 0px;
	margin-top: 0px;
	background-color: #808080;
	border-radius: 50%;
	display: inline-block;
}

.big-dot i {
	font-size: 12px;
}

.card-stepper {
	z-index: 0
}
</style>
<main>
	<div class="container-fluid px-4">		
	<h2 class="mt-4">Lịch sử xác nhận đơn</h2>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> Đơn hàng
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>Mã đơn</th>
								<th>Tên khách hàng</th>
								<th>Địa chỉ</th>
								<th>Ngày đặt</th>
								<th>Trạng thái</th>
								<th>Tổng tiền</th>
								<th>Thanh toán</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" items="${listOrder}">
								<tr>
									<td>${i.orderID}</td>
									<td>${i.customer.lastName} ${i.customer.firstName}</td>
									<td>${i.address}</td>
									<td>${i.orderDate}</td>
									<td>
										<div class="d-flex justify-content-start">
											<c:choose>
												<c:when test="${i.status==1}">
													<i style="color: green">Đã xác nhận</i>
												</c:when>
												<c:when test="${i.status==2}">
													<i style="color: green">Đang gói hàng</i>
												</c:when>
												<c:when test="${i.status==3}">
													<i style="color: green">Đang giao</i>
												</c:when>
												<c:when test="${i.status==4}">
													<i style="color: green">Đã giao</i>
												</c:when>
												<c:when test="${i.status==5}">
													<i style="color: red">Đã hủy</i>
												</c:when>
												<c:otherwise>
													<i style="color: orange">Chưa xác nhận</i>
												</c:otherwise>
											</c:choose>
										</div>
									</td>
									<td>${i.totalMoney}</td>
									<td>
										<div class="d-flex justify-content-start">
											<c:choose>
												<c:when test="${i.payment.status==1}">
													<i style="color: green"> ✔</i>
												</c:when>
												<c:when test="${i.payment.status==0}">
													<i style="color: red">✖</i>
												</c:when>
											</c:choose>
										</div>
									</td>
									<td>
										<div class="hidden-sm hidden-xs btn-group">
											<a
												href="<c:url value='/sellerOrderDetail?orderID=${i.orderID}'/>">
												<button class="btn btn-xs btn-info btn-sm">
													<i class="fa-regular fa-eye"></i>
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
</main>
