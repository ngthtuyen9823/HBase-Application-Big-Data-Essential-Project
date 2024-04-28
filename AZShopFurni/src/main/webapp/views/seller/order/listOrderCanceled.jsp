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
		<h1 class="mt-4">Đơn hàng đã hủy</h1>
		<!-- 		<ol class="breadcrumb mb-4">
			<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
			<li class="breadcrumb-item active">Tables</li>
		</ol> -->
		<div class="card mb-4">
			<div class="card-body"></div>
		</div>
		<div class="row">
			<c:forEach var="i" items="${listOrder}">
				<div class="card border mb-4 ms-4" style="width: 47%">
					<div class="card-body">
						<div class="row">
							<div class="col-md-12 mb-2">
								<div class="row">
									<div class="col-md-12 w-75">
										<h6 class="mx=0">Khách hàng: ${i.customer.lastName} ${i.customer.firstName}</h6>
										<p class="mb-0">Trạng thái đơn hàng:  
										<strong> 
										    <c:choose>
										        <c:when test="${i.status == 0}">
										            <div class="text-success" style="color: orange">Chưa xác nhận</div>
										        </c:when>
										        <c:when test="${i.status == 1}">
										            <div class="text-success" style="color: green">Đã xác nhận</div>
										        </c:when>
										        <c:when test="${i.status == 2}">
										            <div class="text-success" style="color: blue">Đang chuẩn bị</div>
										        </c:when>
										        <c:when test="${i.status == 3}">
										            <div class="text-success" style="color: red">Đang được giao</div>
										        </c:when>
										        <c:when test="${i.status == 4}">
										            <h6 class="text-success" style="color: green">Đã giao thành công</h6>
										        </c:when>
										        <c:when test="${i.status == 5}">
										            <div class="text-success text-danger">Bị hủy</div>
										        </c:when>
										    </c:choose>
										</strong> </p>
									</div>
									<h5 class="text-warning px-0 w-25 d-flex justify-content-end">
										
										<c:if test="${i.payment.status == 0}">
											<fmt:formatNumber type="currency" value="${i.totalMoney}"
												currencyCode="VND" pattern="#,##0 đ" var="formattedPrice" />
											${formattedPrice}
										</c:if>
										<c:if test="${i.payment.status != 0}">
											<div class="text-success"> Đã thanh toán</div>
										</c:if>
									</h5>
								</div>

							</div>
							<hr>
							<div class="d-none">
								<input type="hidden" name="orderID" value="${i.orderID}">
								<input type="hidden" name="sellerID" value="${i.sellerID}">
								<input type="hidden" name="shipperID" value="${i.shipperID}">
							</div>
							<div class="col-md-12 order-details-container">
								<c:forEach var="j" items="${i.details}">
									<c:if test="${j != null}">
										<div class="row mb-1">
											<div class="w-75 text-truncate font-size-16">
												${j.product.productName} ${j.product.description} 
												Màu sắc: ${j.item.color}</div>
											<div class="w-25 d-flex justify-content-end">
												x${j.quantity}</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
							<!-- Actions and Total -->

							<i class="text-secondary col-md-6 d-flex align-items-end">${i.orderDate}</i>
							<div class="col-md-3 ms-auto">
								<div class="ms-auto" style="margin-left: auto">
									<a href="sellerOrderDetail?orderID=${i.orderID}"
										class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-13 m-b-5">
										Chi tiết</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			
		</div>
	</div>
</main>
