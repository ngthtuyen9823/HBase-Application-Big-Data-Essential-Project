<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<title>Insert title here</title>

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
star-rating {
	font-size: 0;
}

.star {
	display: inline-block;
	font-size: 30px;
	cursor: pointer;
	margin-right: 5px;
	border: 5px;
	background: none;
	outline: none;
	color: gray;
}

.highlight {
	color: gold;
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
			<div class="col-xl-8">
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
							<div class="d-none">
								<input type="hidden" name="orderID" value="${order.orderID}">
								<input type="hidden" name="sellerID" value="${order.sellerID}">
								<input type="hidden" name="shipperID" value="${order.shipperID}">
							</div>

							<div class="col-md-12 order-details-container">
										<div class="product-item">
											<div class="product-image w-50 h-50">
												<img src="${detail.item.image}" alt="" width="150" height="150">
											</div>
											<div class="product-info">
												<h5 class="text-truncate font-size-20">
													<a href="#" class="text-dark"> ${detail.product.productName}</a>
												</h5>
												<p class="mb-0 mt-1">
													Màu sắc: <span class="fw-medium"> ${detail.item.color}</span>
												</p>
												<p class="mb-0 mt-1">
													Size: <span class="fw-medium"> ${detail.item.size}</span>
												</p>
												<p class="mb-0 mt-1">
													<span class="fw-medium"> x${detail.quantity}</span>
												</p>
											</div>
											<div class="price-info font-size-20" style="color: orange">
												<c:choose>
													<c:when test="${detail.item.promotionPrice == 0}">
														<fmt:formatNumber type="currency"
															value="${detail.item.originalPrice * detail.quantity}"
															currencyCode="VND" pattern="#,##0 VND" var="formattedPrice" />
													            ${formattedPrice}
													        </c:when>
													<c:otherwise>
														<fmt:formatNumber type="currency"
															value="${detail.item.promotionPrice * detail.quantity}"
															currencyCode="VND" pattern="#,##0 VND" var="formattedPrice" />
											            ${formattedPrice}
											        </c:otherwise>
											</c:choose>
											</div>
										</div>
								<hr class="my-4">
							</div>
							<!-- Actions and Total -->


							<div class="review-form col-md-12"
								style=" background-color: #ffffff; padding: 20px; ">
								<div>
									<h3 style="color: #333; font-size: 1.5em; margin-bottom: 15px;">Đánh giá sản phẩm</h3>
									<div id="starRating" class="star-rating">
										<button class="star" onclick="setRating(1)" data-index="1">&#9733;</button>
										<button class="star" onclick="setRating(2)" data-index="2">&#9733;</button>
										<button class="star" onclick="setRating(3)" data-index="3">&#9733;</button>
										<button class="star" onclick="setRating(4)" data-index="4">&#9733;</button>
										<button class="star" onclick="setRating(5)" data-index="5">&#9733;</button>
									</div>
									<form action="submitReview" method="post">
										<fieldset>
											<div>
												<input type="hidden" name="itemID" value="${detail.itemID}">
												<input type="hidden" name="orderID" value="${order.orderID}"> <input
													class="form-control" type="hidden" name="rating"
													id="ratingInput" value="5" />
											</div>
											<div class="form-group stext-105 cl3"
												style="margin-top: 15px;">
												<textarea class="form-control" name="content"
													placeholder="Thêm đánh giá..."
													id="exampleFormControlTextarea1" rows="5"></textarea>
											</div>
										</fieldset>
										<input type="submit" style="float: right; "
											class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail"
											value="Gửi" />
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>



