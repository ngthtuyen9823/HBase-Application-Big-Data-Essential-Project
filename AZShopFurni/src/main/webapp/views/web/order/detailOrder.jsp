<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<title>Chi tiết đơn hàng</title>
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

<section class="sec-product-detail bg0 p-t-65 p-b-60">
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-lg-2 p-b-80">
				<div class="side-menu">
					<div class="p-t-55">
						<h4 class="mtext-112 cl2 p-b-33">TÀI KHOẢN</h4>
						<ul>
							<li class="bor18"><a
								href="${pageContext.request.contextPath}/infoUser"
								class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
									Hồ sơ cá nhân </a></li>
							<li class="bor18"><a
								href="${pageContext.request.contextPath}/listOrder"
								class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"
								style="color: #6C7AE0;"> Đơn mua </a></li>
							<li class="bor18"><a
								href="${pageContext.request.contextPath}/listVoucher"
								class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
									Kho voucher </a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-xl-10" >
				<div class="card border shadow-none mb-4">
					<div class="card-body">
						<div class="row">
							<div class="col-md-10">
								<p class="mb-0 mt-1">
									Mã đơn hàng: <span class="fw-medium"> ${order.orderID}</span>
								</p>
								<p class="mb-0 mt-1">
									Ngày đặt: <span class="fw-medium"> <fmt:formatDate
											value="${order.orderDate}" pattern="dd/MM/yyyy" />
									</span>
								</p>

								<p class="mb-0 mt-1">
									<span
										class="fw-medium ${order.status == 0 ? 'text-orange' : ''} 
												           ${order.status == 1 ? 'text-green' : ''} 
												           ${order.status == 2 ? 'text-blue' : ''} 
												           ${order.status == 3 ? 'text-purple' : ''} 
												           ${order.status == 4 ? 'text-success' : ''} 
												           ${order.status == 5 ? 'text-danger' : ''}">
										${order.status == 0 ? 'Đơn hàng chờ xác nhận' :
                                              order.status == 1 ? 'Đơn hàng đã được xác nhận' :
                                              order.status == 2 ? 'Đơn hàng đang được chuẩn bị' :
                                              order.status == 3 ? 'Đơn hàng đang được giao đến bạn' :
                                              order.status == 4 ? 'Đơn hàng đã được giao đến bạn' :
                                              order.status == 5 ? 'Đơn hàng đã bị hủy' : ''}
									</span>
								</p>
							</div>
							<div class="ms-auto" style="margin: 0 auto">
								<form action="customerConfirm" method="post"
									enctype="multipart/form-data">
									<input type="hidden" name="orderID" value="${order.orderID}">
									<c:choose>
										<c:when test="${order.status <= 2 }">
											<input type="hidden" name="action" value="cancelDetailOrder">
											<button type="submit"
												class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
												Hủy đơn</button>
										</c:when>
										<c:when
											test="${order.status == 4 && order.customerConfirmation != 1}">
											<input type="hidden" name="action" value="confirmDetailOrder">
											<button type="submit"
												class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
												Xác nhận</button>
										</c:when>
									</c:choose>
								</form>
							</div>
							<div class="d-none">
								<input type="hidden" name="orderID" value="${order.orderID}">
								<input type="hidden" name="sellerID" value="${order.sellerID}">
								<input type="hidden" name="shipperID" value="${order.shipperID}">
							</div>

							<div class="col-md-12 order-details-container">
								<c:forEach var="j" items="${order.details}">
									<c:if test="${j != null}">
										<div class="product-item">
											<div class="product-image w-50 h-50">
												<img src="${j.item.image}" alt="" width="150" height="150">
											</div>
											<div class="product-info">
												<h5 class="text-truncate font-size-20">
													<a href="#" class="text-dark"> ${j.product.productName}</a>
												</h5>
												<p class="mb-0 mt-1">
													Màu sắc: <span class="fw-medium"> ${j.item.color}</span>
												</p>
												<p class="mb-0 mt-1">
													Size: <span class="fw-medium"> ${j.item.size}</span>
												</p>
												<p class="mb-0 mt-1">
													<span class="fw-medium"> x${j.quantity}</span>
												</p>
											</div>
											<div class="price-info font-size-20" style="color: orange">
												<c:choose>
													<c:when test="${j.item.promotionPrice == 0}">
														<fmt:formatNumber type="currency"
															value="${j.item.originalPrice * j.quantity}"
															currencyCode="VND" pattern="#,##0 VND"
															var="formattedPrice" />
										            ${formattedPrice}
										        </c:when>
													<c:otherwise>
														<fmt:formatNumber type="currency"
															value="${j.item.promotionPrice * j.quantity}"
															currencyCode="VND" pattern="#,##0 VND"
															var="formattedPrice" />
									            ${formattedPrice}
									        </c:otherwise>
												</c:choose>
											</div>
										</div>
									</c:if>
								</c:forEach>
								<hr class="my-4">
								<c:choose>
									<c:when test="${order.status == 0 || order.status==5}">
										<div
											class="d-flex flex-row justify-content-between align-items-center align-content-center">
											<span class="off-dot"></span>
											<hr class="flex-fill off-track-line">
											<span class="off-dot"></span>
											<hr class="flex-fill off-track-line">
											<span class="off-dot"></span>
											<hr class="flex-fill off-track-line">
											<span class="off-dot"></span>
											<hr class="flex-fill off-track-line">
											<span
												class="d-flex justify-content-center align-items-center off-big-dot off-dot">
												<i class="fa fa-check text-white"></i>
											</span>
										</div>
									</c:when>

									<c:when test="${order.status == 1 }">
										<div
											class="d-flex flex-row justify-content-between align-items-center align-content-center">
											<span class="dot"></span>
											<hr class="flex-fill off-track-line">
											<span class="off-dot"></span>
											<hr class="flex-fill off-track-line">
											<span class="off-dot"></span>
											<hr class="flex-fill off-track-line">
											<span class="off-dot"></span>
											<hr class="flex-fill off-track-line">
											<span
												class="d-flex justify-content-center align-items-center off-big-dot off-dot">
												<i class="fa fa-check text-white"></i>
											</span>
										</div>
									</c:when>

									<c:when test="${order.status == 2 }">
										<div
											class="d-flex flex-row justify-content-between align-items-center align-content-center">
											<span class="dot"></span>
											<hr class="flex-fill track-line">
											<span class="dot"></span>
											<hr class="flex-fill off-track-line">
											<span class="off-dot"></span>
											<hr class="flex-fill off-track-line">
											<span class="off-dot"></span>
											<hr class="flex-fill off-track-line">
											<span
												class="d-flex justify-content-center align-items-center off-big-dot off-dot">
												<i class="fa fa-check text-white"></i>
											</span>
										</div>
									</c:when>

									<c:when test="${order.status == 3 }">
										<div
											class="d-flex flex-row justify-content-between align-items-center align-content-center">
											<span class="dot"></span>
											<hr class="flex-fill track-line">
											<span class="dot"></span>
											<hr class="flex-fill track-line">
											<span class="dot"></span>
											<hr class="flex-fill off-track-line">
											<span class="off-dot"></span>
											<hr class="flex-fill off-track-line">
											<span
												class="d-flex justify-content-center align-items-center off-big-dot off-dot">
												<i class="fa fa-check text-white"></i>
											</span>
										</div>
									</c:when>

									<c:when
										test="${order.status == 4  && order.customerConfirmation != 1}">
										<div
											class="d-flex flex-row justify-content-between align-items-center align-content-center">
											<span class="dot"></span>
											<hr class="flex-fill track-line">
											<span class="dot"></span>
											<hr class="flex-fill track-line">
											<span class="dot"></span>
											<hr class="flex-fill track-line">
											<span class="dot"></span>
											<hr class="flex-fill off-track-line">
											<span
												class="d-flex justify-content-center align-items-center off-big-dot off-dot">
												<i class="fa fa-check text-white"></i>
											</span>
										</div>
									</c:when>

									<c:when
										test="${order.status == 4  && order.customerConfirmation == 1}">
										<div
											class="d-flex flex-row justify-content-between align-items-center align-content-center">
											<span class="dot"></span>
											<hr class="flex-fill track-line">
											<span class="dot"></span>
											<hr class="flex-fill track-line">
											<span class="dot"></span>
											<hr class="flex-fill track-line">
											<span class="dot"></span>
											<hr class="flex-fill track-line">
											<span
												class="d-flex justify-content-center align-items-center big-dot dot">
												<i class="fa fa-check text-white"></i>
											</span>
										</div>
									</c:when>
								</c:choose>


								<div
									class="d-flex flex-row justify-content-between align-items-center">
									<div class="d-flex flex-column align-items-start">
										<span>Xác nhận đơn </span>
									</div>
									<div class="d-flex flex-column justify-content-center">
										<span>Chuẩn bị hàng</span>
									</div>
									<div
										class="d-flex flex-column justify-content-center align-items-center">
										<span>Đang giao hàng</span>
									</div>
									<div class="d-flex flex-column align-items-center">
										<span>Đã giao hàng</span>
									</div>
									<div class="d-flex flex-column align-items-end">
										<span>Hoàn thành đơn hàng</span>
									</div>
								</div>
								<hr>
							</div>
							<!-- Actions and Total -->

							<div class="col-md-12">
								<div class="row">
								
								<c:choose>
									<c:when test="${payment.status == 0 && payment.method==1}">
										<div class="col-md-3">
									<img style="    width: 200px; height: 200px" alt="QR thanh toán" src="https://storage.googleapis.com/web-budget/Image/Other/QR.png"></div>
									<div class="col-md-3">
									<p class="text-muted mb-2"><b>MBBank </b>  </p>
										<p class="text-muted mb-2"> LA TIẾN ĐẠT</p>
										<p class="text-muted"><b>Số tài khoản : </b> 1107200388</p>
										<p class="text-muted mb-2"><b>Nội dung chuyển khoản : </b> AZSHOP_${order.orderID}</p>
										
									</div>
									</c:when>
									<c:when test="${payment.status == 1 && payment.method ==1}">
									<div class="col-md-6"></div>
									</c:when>
									<c:when test="${ payment.method==0}">
											<div class="col-md-6"></div>
									</c:when>
								</c:choose>
									<div class="col-md-3 text-end ">
										<p class="text-muted mb-2">Tổng tiền</p>
										<p class="text-muted mb-2">Phí vận chuyển</p>
										<p class="text-muted mb-2">Giảm giá</p>
										<p class="text-muted">Thành tiền</p>
									</div>
									<div class="col-md-3 text-end ">
										<h5 class="font-size-20 mb-2">
											<fmt:formatNumber type="currency" value="${rawPrice}"
												currencyCode="VND" pattern="#,##0 VND" var="formattedPrice" />
											${formattedPrice}
										</h5>
										<h5 class="font-size-20 mb-2">
											<fmt:formatNumber type="currency"
												value="${order.transportFee}" currencyCode="VND"
												pattern="#,##0 VND" var="formattedPrice" />
											${formattedPrice}
										</h5>
										<h5 class="font-size-20 mb-2">
											<fmt:formatNumber type="currency" value="${order.discount}"
												currencyCode="VND" pattern="#,##0 VND" var="formattedPrice" />
											${formattedPrice}
										</h5>
										<h5 class="font-size-20 mb-2" style="color: orange">
											<fmt:formatNumber type="currency" value="${order.totalMoney}"
												currencyCode="VND" pattern="#,##0 VND" var="formattedPrice" />
											${formattedPrice}
										</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
