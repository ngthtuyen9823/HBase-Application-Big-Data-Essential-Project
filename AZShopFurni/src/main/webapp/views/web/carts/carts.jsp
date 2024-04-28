<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<div class="container padding-bottom-3x mt-5 mb-1">
	<div class="table-responsive shopping-cart">
		<table class="table">
			<thead>
				<tr class="table_head">
					<th>Tên sản phẩm</th>
					<th class="text-center">Giá một sản phẩm</th>
					<th class="text-center">Số lượng</th>
					<th class="text-center">Tổng tiền</th>
					<th class="text-center"><a
						class="btn btn-sm btn-outline-danger"
						href="<c:url value='/deleteCarts' />">Xóa tất cả</a></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="i" items="${carts}">
					<tr>
						<td>
							<div class="product-item">
								<a class="product-thumb"
									href="<c:url value='/products?id=${i.productID}' />"><img
									style="width: 150px; height: 130px;" src="${i.image}"
									alt="Product"></a>
								<div class="product-info">
									<h4 class="product-title">
										<a href="#">${i.productName}</a>
									</h4>
									<span><em>Cỡ:</em>${i.size}</span><span><em>Màu:</em>${i.color}</span>
								</div>
							</div>
						</td>

						<td class="text-center text-lg text-medium"><fmt:formatNumber
								type="currency" value="${i.promotionPrice}" currencyCode="VND"
								pattern="#,##0 VND" var="formattedPrice" /> ${formattedPrice}</td>
						<td class="text-center">
							<div class="input-group" style="justify-content: center;">

								<a class="remove-from-cart" style="display: flex;"
									href="<c:url value='/updateCart?customerID=${i.customerID}&itemID=${i.itemID}&quantity=${i.quantity - 1} '/>"
									data-toggle="tooltip" title=""
									data-original-title="Remove item"><button class="px-3"
										type="button" id="button-addon1" data-mdb-ripple-color="dark">
										<i class="fas fa-minus"></i>
									</button></a> <input type="text" style="flex: 0.2 1 auto;"
									class="form-control text-center border border-secondary"
									id="quantityInput" placeholder="${i.quantity}"
									aria-label="example" aria-describedby="button-addon1" /> <a
									class="remove-from-cart" style="display: flex;"
									href="<c:url value='/updateCart?customerID=${i.customerID}&itemID=${i.itemID}&quantity=${i.quantity + 1} '/>"
									data-toggle="tooltip" title=""
									data-original-title="Remove item"><button class="px-3"
										type="button" id="button-addon1" data-mdb-ripple-color="dark">
										<i class="fas fa-plus"></i>
									</button></a>
							</div>
						</td>
						<td class="text-center text-lg text-medium"><fmt:formatNumber
								type="currency" value="${i.totalPrice}" currencyCode="VND"
								pattern="#,##0 VND" var="formattedPrice" /> ${formattedPrice}</td>
						<td class="text-center"><a class="remove-from-cart"
							href="<c:url value='/deleteCart?customerID=${i.customerID}&itemID=${i.itemID}' />"
							data-toggle="tooltip" title="" data-original-title="Remove item"><i
								class="fa fa-trash"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="shopping-cart-footer">
		<div class="column">
			<div style="padding: 1.3rem; font-size: 1.2rem;"
				class="column text-lg">
				Tổng (chưa tính phí vận chuyển): <span style="font-weight: 500; font-size: 1.5rem;"
					class="text-lg"><fmt:formatNumber type="currency"
						value="${subTotal}" currencyCode="VND" pattern="#,##0 VND"
						var="formattedPrice" /> ${formattedPrice}</span>
			</div>
			<a style="float: right;" href="<c:url value='/checkout' />"><button
					style="width: 260px; float: right; padding: 1.2rem;"
					class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
					Tiến hành thanh toán</button></a>
		</div>
	</div>
</div>