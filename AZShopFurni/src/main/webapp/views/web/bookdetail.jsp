<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<header>
	<div class="container pt-5">
		<nav class="d-flex">
			<h6 class="mb-0">
				<a href="<c:url value='/home'/>" class="link-dark"
					style="text-decoration: none;">Home</a> <span class="mx-2">
					> </span> <a href="#" class="link-dark" style="text-decoration: none;">${book.categories}</a>
				<span class="mx-2"> > </span> <a href="#" class="link-dark"
					style="text-decoration: none;">${book.title}</a>
			</h6>
		</nav>
	</div>
</header>
<section class="py-5">
	<div class="container">
		<div class="row gx-5">
			<aside style="padding-right: 3rem;" class="col-lg-6">
				<div class="border rounded-4 mb-3 d-flex justify-content-center">
					<a id="mainImageLink" data-fslightbox="mygalley" class="rounded-4"
						target="_blank" data-type="image" href="#"> <img
						id="mainImage"
						style="max-width: 100%; height: 350px; margin: auto;"
						class="rounded-4 fit" src="${book.thumbnail}" />
					</a>
				</div>
			</aside>
			<main class="col-lg-6">
				<div class="ps-lg-3">
					<h3 class="title text-dark">${book.title}</h3>
					<div class="d-flex flex-row my-3">
						<div class="text-warning mb-1 me-2">
							<span class="stext-105 cl3"> <i class="fas fa-star"
								style="${book.average_rating >= 1 ? 'color: gold;' : ''}"></i> <i
								class="fas fa-star"
								style="${book.average_rating >= 2 ? 'color: gold;' : ''}"></i> <i
								class="fas fa-star"
								style="${book.average_rating >= 3 ? 'color: gold;' : ''}"></i> <i
								class="fas fa-star"
								style="${book.average_rating >= 4 ? 'color: gold;' : ''}"></i> <i
								class="fas fa-star"
								style="${book.average_rating >= 5 ? 'color: gold;' : ''}"></i>
							</span>
						</div>

					</div>
					<div class="mb-3">${book.description}</div>

					<div class="row">
						<dt class="col-3">Tác giả</dt>
						<dd class="col-9">${book.authors}</dd>
						<dt class="col-3">Thể loại</dt>
						<dd class="col-9">${book.categories}</dd>
						<dt class="col-3">Kho</dt>
						<dd class="col-9">${book.numbers}</dd>

					</div>
					<div class="row"></div>
					<hr />
					<div class="row mb-3 input-group">

						<label
							style="font-weight: 700; margin-left: 1rem; margin-right: 3rem;"
							class="mb-2">Số lượng </label>
						<button class="px-3" type="button" id="button-addon1"
							data-mdb-ripple-color="dark" onclick="updateQuantity(-1)">
							<i class="fas fa-minus"></i>
						</button>
						<input type="text" style="flex: 0.2 1 auto;"
							class="form-control text-center border border-secondary"
							id="quantityInput" placeholder="1" aria-label="example"
							aria-describedby="button-addon1" />
						<button class="px-3" type="button" id="button-addon2"
							data-mdb-ripple-color="dark" onclick="updateQuantity(1)">
							<i class="fas fa-plus"></i>
						</button>
					</div>
					<div class="mt-5 row">
						<dd class="col-5">
							<form id="addToCartForm" action="#" method="post">
								<div>
									<input type="hidden" name="selectedItemID" id="selectedItemID"
										value=""> <input type="hidden" name="selectedQuantity"
										id="selectedQuantity" value="1">
								</div>
								<div class="text-center">
									<input onclick="addToCart()"
										style="width: 100%; padding: 1rem; cursor: pointer; float: right"
										class="btn btn-primary shadow-0 flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail"
										value="Đặt mượn" readonly
										onmouseover="this.style.cursor='pointer';"
										onmouseout="this.style.cursor='default';" />
								</div>
							</form>
						</dd>
					</div>
				</div>
			</main>
		</div>
	</div>
</section>
<%-- <section class="product">
	<h2 class="product-category">sản phẩm cùng loại</h2>
	<button class="pre-btn">
		<img src="images/arrow.png" alt="">
	</button>
	<button class="nxt-btn">
		<img src="images/arrow.png" alt="">
	</button>
	<div class="product-container">
		<c:forEach items="${cateProList}" var="item" varStatus="loop">
			<div class="product-card">
				<div class="product-image">
					<a href="<c:url value='/products?id=${item.productID}' />"
						class="product-image"><img src="${item.displayedImage}"
						class="product-thumb" alt=""> </a>
				</div>
				<div class="product-info">
					<h2 class="product-brand">${item.productName}</h2>
					<p class="product-short-description">${item.description}</p>
					<c:if test="${item.displayedPromotionPrice ne 0}">
						<span class="price"><fmt:formatNumber type="currency"
								value="${item.displayedPromotionPrice}" currencyCode="VND"
								pattern="#,##0 VND" var="formattedPrice" />${formattedPrice}</span>
						<span class="actual-price"><fmt:formatNumber
								type="currency" value="${item.displayedOriginalPrice}"
								currencyCode="VND" pattern="#,##0 VND" var="formattedPrice" />${formattedPrice}</span>
					</c:if>
					<c:if test="${item.displayedPromotionPrice eq 0}">
						<span class="price"><fmt:formatNumber type="currency"
								value="${item.displayedOriginalPrice}" currencyCode="VND"
								pattern="#,##0 VND" var="formattedPrice" />${formattedPrice}</span>
					</c:if>
				</div>
			</div>
		</c:forEach>
	</div>
</section> --%>