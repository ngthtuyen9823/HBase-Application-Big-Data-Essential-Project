<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<title>Đơn mua</title>
<style>
body {
	margin-top: 0px;
	background-color: #f1f3f7;
}

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
</style>

<section class="sec-product-detail bg0 p-t-65 p-b-60">
	<div class="container">
		<div class="row">
			<!-- Sidebar -->
			<div class="col-md-3 col-lg-2 p-b-80">
				<div class="side-menu">
					<div class="p-t-55">
						<h4 class="mtext-112 cl2 p-b-33" style="margin-top: -111px;">TÀI
							KHOẢN</h4>
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
			<!-- List order -->
			<div class="col-xl-8">
				<c:forEach var="i" items="${listOrder}">
					<div class="card border shadow-none mb-4">
						<div class="card-body">
							<div class="row">
								<div class="col-md-12">
									<fmt:formatDate value="${i.orderDate}" pattern="dd/MM/yyyy" />
									<p class="mb-0 mt-1">
										<span
											class="fw-medium ${i.status == 0 ? 'text-orange' : ''} 
													           ${i.status == 1 ? 'text-green' : ''} 
													           ${i.status == 2 ? 'text-blue' : ''} 
													           ${i.status == 3 ? 'text-purple' : ''} 
													           ${i.status == 4 ? 'text-success' : ''} 
													           ${i.status == 5 ? 'text-danger' : ''}">
											${i.status == 0 ? 'Đơn hàng chờ xác nhận' :
                                               i.status == 1 ? 'Đơn hàng đã được xác nhận' :
                                               i.status == 2 ? 'Đơn hàng đang được chuẩn bị' :
                                               i.status == 3 ? 'Đơn hàng đang được giao đến bạn' :
                                               i.status == 4 ? 'Đơn hàng đã được giao đến bạn' :
                                               i.status == 5 ? 'Đơn hàng đã bị hủy' : ''}
										</span>
									</p>
								</div>
								<div class="d-none">
									<input type="hidden" name="orderID" value="${i.orderID}">
									<input type="hidden" name="sellerID" value="${i.sellerID}">
									<input type="hidden" name="shipperID" value="${i.shipperID}">
								</div>
								<div class="col-md-12 order-details-container">
									<form action="itemRating" method="post"
										enctype="multipart/form-data">
										<c:if test="${i.customerConfirmation == 1}">
											<c:forEach var="j" items="${i.details}">
												<c:if test="${j != null }">
													<div class="product-item">
														<input type="hidden" name="itemID"
															value="${j.item.itemID}"> <input type="hidden"
															name="orderID" value="${i.orderID}">
														<div class="product-image w-50 h-50">
															<img src="${j.item.image}" alt="" width="150"
																height="150">
														</div>
														<div class="product-info">
															<h5 class="text-truncate font-size-20">
																<a href="#" class="text-dark">
																	${j.product.productName}</a>
															</h5>
															<p class="mb-0 mt-1">${j.product.description}</p>
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
															<a
																href="${pageContext.request.contextPath}/itemRating?orderID=${i.orderID}&itemID=${j.itemID}"
																class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
																Đánh giá </a>
														</div>
													</div>
												</c:if>
											</c:forEach>
										</c:if>
										<c:if test="${i.customerConfirmation == 0}">
											<c:forEach var="j" items="${i.details}">
												<c:if test="${j != null }">
													<div class="product-item">
														<div class="product-image w-50 h-50">
															<img src="${j.item.image}" alt="" width="150"
																height="150">
														</div>
														<div class="product-info">
															<h5 class="text-truncate font-size-20">
																<a href="#" class="text-dark">
																	${j.product.productName}</a>
															</h5>
															<p class="mb-0 mt-1">${j.product.description}</p>
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
										</c:if>
									</form>
									<hr>
								</div>
								<!-- Actions and Total -->

								<div class="col-md-12">
									<div class="row">
										<div class="ms-auto" style="margin-left: auto">
											<form action="customerConfirm" method="post"
												enctype="multipart/form-data">
												<a
													href="${pageContext.request.contextPath}/detailOrder?orderID=${i.orderID}"
													class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
													Chi tiết </a> <input type="hidden" name="orderID"
													value="${i.orderID}">
												<c:choose>
													<c:when test="${i.status <= 2 }">
														<input type="hidden" name="action" value="cancelOrder">
														<button type="submit"
															class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
															Hủy đơn</button>
													</c:when>
													<c:when
														test="${i.status == 4 && i.customerConfirmation != 1 }">
														<input type="hidden" name="action" value="confirmOrder">
														<button type="submit"
															class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
															Xác nhận</button>
													</c:when>
												</c:choose>
											</form>
										</div>
										<div class="col-md-3 text-end ">
											<p class="text-muted mb-2">Thành tiền</p>
											<h5 class="font-size-20" style="color: orange">
												<fmt:formatNumber type="currency" value="${i.totalMoney}"
													currencyCode="VND" pattern="#,##0 VND" var="formattedPrice" />
												${formattedPrice}
											</h5>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</section>
