<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>


<article class="voucher-card fl-left">
	<section class="date">
		<time datetime="23th feb">
			<span style="color: #EE4D2D">${voucher.discount }%</span><span>saleoff</span>
		</time>
	</section>
	<section class="card-cont mb-2">
		<p>${voucher.voucherID }</p>
		<h3>${voucher.description }</h3>
		<div class="even-date mb-2">
			<time>
				<span>Số lượng: ${voucher.quantity }</span> <span><fmt:formatDate
						value="${voucher.mfg }" pattern="dd/MM/yyyy" /> đến <fmt:formatDate
						value="${voucher.exp }" pattern="dd/MM/yyyy" /></span>
			</time>
		</div>
		<div class="even-info">
			<p>
				áp dụng với đơn hàng trên
				<fmt:formatNumber type="currency" value="${voucher.minimumPrice }"
					currencyCode="VND" pattern="#,##0 VND" var="formattedPrice" />
				${formattedPrice}
			</p>
			<a class="mt-20" href="<c:url value='/checkout?voucherId=${voucher.voucherID}'/>">Áp dụng</a>
		</div>
	</section>
</article>