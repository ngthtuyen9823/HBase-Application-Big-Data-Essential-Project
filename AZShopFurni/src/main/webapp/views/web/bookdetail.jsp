<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<header>
	<div class="container pt-5">
		<nav class="d-flex">
			<h6 class="mb-0">
				<%-- <a href="<c:url value='/home'/>" class="link-dark"
					style="text-decoration: none;">Home</a> <span class="mx-2">
					> </span> <a
					href="<c:url value='/books?cateId=${book.categoryID}'/>"
					class="link-dark" style="text-decoration: none;">${book.categoryName}</a>
				<span class="mx-2"> > </span> <a href="#" class="link-dark"
					style="text-decoration: none;">${book.bookName}</a> --%>
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
						class="rounded-4 fit" src="${book.thumbnail}" />
					</a>
				</div>
				<%-- <div class="d-flex justify-content-center mb-3 book-container">
					<c:forEach items="${book.listItem}" var="item" varStatus="loop">
						<div class="" style="flex: 0 0 auto;">
							<a data-fslightbox="mygalley"
								class="border mx-1 rounded-2 item-thumb" target="_blank"
								data-type="image" onmouseover="changeMainImage('${item.image}')"
								style="cursor: pointer;"> <img width="100" height="100"
								class="rounded-2" src="${item.image}" />
							</a>
						</div>
					</c:forEach>
				</div> --%>
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
						<span style="padding-left: 1rem;" class="text-muted"> |
							${book.description}</span>
					</div>


					<div class="row">
						<dt class="col-3">Subtitle</dt>
						<dd class="col-9">${book.subtitle}</dd>
						<dt class="col-3">Author</dt>
						<dd class="col-9">${book.authors}</dd>
						<dt class="col-3">Category</dt>
						<dd class="col-9">${book.categories}</dd>
					</div>
					<div class="row">
						<dt class="col-3">Description</dt>
						<dd class="col-9"></dd>
					</div>
					<hr />
					<div class="row mb-3 input-group">

						<!-- <label
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
						</button> -->
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

