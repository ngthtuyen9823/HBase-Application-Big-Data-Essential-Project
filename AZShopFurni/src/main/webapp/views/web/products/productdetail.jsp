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
					> </span> <a
					href="<c:url value='/products?cateId=${product.categoryID}'/>"
					class="link-dark" style="text-decoration: none;">${product.categoryName}</a>
				<span class="mx-2"> > </span> <a href="#" class="link-dark"
					style="text-decoration: none;">${product.productName}</a>
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
						style="max-width: 100%; max-height: 100vh; margin: auto;"
						class="rounded-4 fit" src="${product.listItem[0].image}" />
					</a>
				</div>
				<div class="d-flex justify-content-center mb-3 product-container">
					<c:forEach items="${product.listItem}" var="item" varStatus="loop">
						<div class="" style="flex: 0 0 auto;">
							<a data-fslightbox="mygalley"
								class="border mx-1 rounded-2 item-thumb" target="_blank"
								data-type="image" onmouseover="changeMainImage('${item.image}')"
								style="cursor: pointer;"> <img width="100" height="100"
								class="rounded-2" src="${item.image}" />
							</a>
						</div>
					</c:forEach>
				</div>
			</aside>
			<main class="col-lg-6">
				<div class="ps-lg-3">
					<h3 class="title text-dark">${product.productName}</h3>
					<div class="d-flex flex-row my-3">
						<div class="text-warning mb-1 me-2">
							<span class="stext-105 cl3"> <i class="fas fa-star"
								style="${product.avgRating >= 1 ? 'color: gold;' : ''}"></i> <i
								class="fas fa-star"
								style="${product.avgRating >= 2 ? 'color: gold;' : ''}"></i> <i
								class="fas fa-star"
								style="${product.avgRating >= 3 ? 'color: gold;' : ''}"></i> <i
								class="fas fa-star"
								style="${product.avgRating >= 4 ? 'color: gold;' : ''}"></i> <i
								class="fas fa-star"
								style="${product.avgRating >= 5 ? 'color: gold;' : ''}"></i>
							</span>
						</div>
						<span style="padding-left: 1rem;" class="text-muted"> |
							${product.description}</span>
					</div>
					<div class="mb-3">
						<c:if test="${product.displayedPromotionPrice ne 0}">
							<span class="h5"> <fmt:formatNumber type="currency"
									value="${product.displayedPromotionPrice}" currencyCode="VND"
									pattern="#,##0 VND" var="formattedPrice" />${formattedPrice}
							</span>
							<span style="text-decoration: line-through; color: #999;">
								<fmt:formatNumber type="currency"
									value="${product.displayedOriginalPrice}" currencyCode="VND"
									pattern="#,##0 VND" var="formattedOriginalPrice" />${formattedOriginalPrice}
							</span>
						</c:if>
						<c:if test="${product.displayedPromotionPrice eq 0}">
							<span class="h5"> <fmt:formatNumber type="currency"
									value="${product.displayedOriginalPrice}" currencyCode="VND"
									pattern="#,##0 VND" var="formattedPrice" />${formattedPrice}
							</span>
						</c:if>
					</div>

					<div class="row">
						<dt class="col-3">Chất liệu</dt>
						<dd class="col-9">${product.material}</dd>
						<dt class="col-3">Nhà cung cấp</dt>
						<dd class="col-9">${product.supplierName}</dd>
						<dt class="col-3">Xuất xứ</dt>
						<dd class="col-9">${product.origin}</dd>
					</div>
					<div class="row">
						<dt class="col-3">Mặt hàng</dt>
						<dd class="col-9">
							<div style="display: block;" class="btn-group" role="group"
								aria-label="Basic outlined example">
								<c:forEach items="${product.listItem}" var="item"
									varStatus="loop">
									<button type="button" id="${item.itemID}"
										onmouseover="changeMainImage('${item.image}')"
										onclick="handleButtonClick(this)" value="${item.size}"
										style="border-color: #bdc3c7; border-style: solid; margin: 6px; padding: 8px">
										<span
											style="display: inline-block; width: 12px; height: 12px; border-radius: 50%; background-color: ${item.colorCode};"></span>
										<span>${item.size}</span>
									</button>
								</c:forEach>
								<div id="errorContainer" style="color: red;">
									<c:if test="${message != null}">${message}</c:if>
								</div>
							</div>
						</dd>
					</div>
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
										value="Thêm vào giỏ hàng" readonly
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
<c:if test="${not empty ratingList}">
	<section class="content-item" id="comments" style="box-shadow: none;">
		<div class="container">
			<div class="row">
				<div class="col-lg-9">
					<div class="container">
						<div
							style="box-shadow: 0 -1px 0px 1px rgba(0, 0, 0, 0.1); background-color: #fff; padding: 20px; border-radius: 10px;">
							<h3 style="margin-bottom: 20px; padding: 25px; color: #333;">Đánh
								giá về sản phẩm</h3>
							<div id="reviews" class="review-section"
								style="border-bottom: none; padding-top: 5px; padding-bottom: 15px; display: flex; justify-content: space-between;">

								<div class="col-md-6">
									<table class="stars-counters" style="width: 100%;">
										<tbody>
											<c:forEach items="${ratingList}" var="item" varStatus="loop">
												<tr>
													<td>
														<button
															class="fit-button fit-button-color-blue fit-button-fill-ghost fit-button-size-medium stars-filter">${item.numOfStar}
															Stars</button>
													</td>
													<td>
														<div class="text-warning mb-1 me-2"
															style="font-size: 1.2rem;">
															<span class="stext-105 cl3"> <i
																class="fas fa-star"
																style="${item.numOfStar >= 1 ? 'color: gold;' : ''}"></i>
																<i class="fas fa-star"
																style="${item.numOfStar >= 2 ? 'color: gold;' : ''}"></i>
																<i class="fas fa-star"
																style="${item.numOfStar >= 3 ? 'color: gold;' : ''}"></i>
																<i class="fas fa-star"
																style="${item.numOfStar >= 4 ? 'color: gold;' : ''}"></i>
																<i class="fas fa-star"
																style="${item.numOfStar >= 5 ? 'color: gold;' : ''}"></i>
															</span><span
																style="font-size: 1.3rem; font-color: black; color: black; padding-left: 1.2rem; font-weight: 420;"
																class="ms-1 star-num"> (${item.numOfRating}) </span>
														</div>

													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<c:forEach items="${detailList}" var="item" varStatus="loop">
								<div class="media"
									style="margin-top: 20px; border: 1px solid #ccc; padding: 15px; border-radius: 5px; background-color: #f9f9f9;">
									<a class="pull-left" href="#"><img class="media-object"
										src="${item.avatar}" alt=""
										style="border-radius: 50%; width: 80px; height: 80px;"></a>
									<div class="media-body">
										<h4 class="media-heading" style="color: #333;">${item.name}</h4>
										<p>${item.content}</p>
										<ul class="list-unstyled list-inline media-detail pull-left">
											<li><i class="fa fa-calendar"></i>${item.evaluationDate}</li>
										</ul>
										<ul class="list-unstyled list-inline media-detail pull-right">
											<li class=""><a href="#" style="color: #3498db;">Reply</a></li>
										</ul>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-lg-3">
					<h5 style="font-size: 1.2rem; font-weight: 600; padding: 1.2rem">CÙNG
						NHÀ CUNG CẤP</h5>
					<c:forEach items="${supProList}" var="item" varStatus="loop">
						<div class="product-card"
							style="margin-bottom: 20px; border: 1px solid #ddd; border-radius: 10px; overflow: hidden; background-color: #fff; transition: transform 0.3s ease-in-out;">

							<div class="product-image"
								style="position: relative; overflow: hidden; height: 200px;">
								<a href="<c:url value='/products?id=${item.productID}' />"
									class="product-image"> <img src="${item.displayedImage}"
									class="product-thumb" alt=""
									style="width: 100%; height: 100%; object-fit: cover;">
								</a>
							</div>

							<div class="product-info"
								style="padding: 0px; padding-left: 1.2rem;">
								<h2 class="product-brand"
									style="font-size: 18px; margin-top: 2px; margin-bottom: 0px; color: #333;">${item.productName}</h2>
								<p style="margin-bottom: 5px;" class="product-short-description">${item.description}</p>
								<c:if test="${item.displayedPromotionPrice ne 0}">
									<span class="price"
										style="font-size: 16px; font-weight: bold; color: #3498db; margin-bottom: 5px;">
										<fmt:formatNumber type="currency"
											value="${item.displayedPromotionPrice}" currencyCode="VND"
											pattern="#,##0 VND" var="formattedPrice" />${formattedPrice}
									</span>
									<span class="actual-price"
										style="font-size: 12px; color: #888; text-decoration: line-through;">
										<fmt:formatNumber type="currency"
											value="${item.displayedOriginalPrice}" currencyCode="VND"
											pattern="#,##0 VND" var="formattedPrice" />${formattedPrice}
									</span>
								</c:if>
								<c:if test="${item.displayedPromotionPrice eq 0}">
									<span class="price"
										style="font-size: 16px; font-weight: bold; color: #3498db; margin-bottom: 5px;">
										<fmt:formatNumber type="currency"
											value="${item.displayedOriginalPrice}" currencyCode="VND"
											pattern="#,##0 VND" var="formattedPrice" />${formattedPrice}
									</span>
								</c:if>
							</div>

						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
</c:if>
<c:if test="${empty ratingList}">
	<section class="product" style="padding-bottom: 0;">
		<h3 class="product-category" style="font-weight:500;">Không có đánh giá về sản phẩm!</h3>
	</section>
	<section class="product">
		<h2 class="product-category">sản phẩm cùng nhà cung cấp</h2>
		<button class="pre-btn">
			<img src="images/arrow.png" alt="">
		</button>
		<button class="nxt-btn">
			<img src="images/arrow.png" alt="">
		</button>
		<div class="product-container">
			<c:forEach items="${supProList}" var="item" varStatus="loop">
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
	</section>
</c:if>
<section class="product">
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
</section>