<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<link href='<c:url value="/templates/web/css/product.css"/>'
	rel="stylesheet" />
</head>

<body>
	<!-- Product -->
	<section class="bg0 p-t-23 p-b-130">
		<div class="container">

			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-c-m m-tb-10">
					<div
						class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
						<i
							class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
						<i
							class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Lọc
					</div>
					<div
						class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i
							class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Tìm kiếm

					</div>



				</div>
				<!-- Search product -->
				<form class="dis-none panel-search w-full p-t-10 p-b-15"
					action="/AZShopFurni/search" method="get">
					<div class="bor8 dis-flex p-l-15">
						<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04 ">
							<i class="zmdi zmdi-search"></i>
						</button>
						<input class="form-control" type="text" name="keySearch"
							placeholder="Tìm kiếm theo tên sách... " />
					</div>
				</form>

				<form class="dis-none panel-search w-full p-t-10 p-b-15"
					action="/AZShopFurni/search" method="get">
					<div class="bor8 dis-flex p-l-15">
						<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04 ">
							<i class="zmdi zmdi-search"></i>
						</button>
						<input class="form-control" type="text" name="authorsKey"
							placeholder="Tìm kiếm theo tên tác giả..." />
					</div>
				</form>
				<!-- Filter -->
				<div class="dis-none panel-filter w-full p-t-10">


					<div class="mtext-102 cl2 p-b-15">Đánh giá</div>
					<ul>
						<li class="p-b-6">
							<form action="/AZShopFurni/filter" method="get">
								<input type="hidden">
								<button type="submit" class="filter-link stext-106 trans-04"
									name="avgRating" value="5">
									<i class="fas fa-star" style="color: gold;"></i><i
										class="fas fa-star" style="color: gold;"></i><i
										class="fas fa-star" style="color: gold;"></i><i
										class="fas fa-star" style="color: gold;"></i><i
										class="fas fa-star" style="color: gold;"></i>
								</button>
							</form>
						</li>
						<li class="p-b-6">
							<form action="/AZShopFurni/filter" method="get">
								<input type="hidden">
								<button type="submit" class="filter-link stext-106 trans-04"
									name="avgRating" value="4">
									<i class="fas fa-star" style="color: gold;"></i><i
										class="fas fa-star" style="color: gold;"></i><i
										class="fas fa-star" style="color: gold;"></i><i
										class="fas fa-star" style="color: gold;"></i><i
										class="fa fa-star"></i> trở lên
								</button>
							</form>
						</li>
						<li class="p-b-6">
							<form action="/AZShopFurni/filter" method="get">
								<input type="hidden">
								<button type="submit" class="filter-link stext-106 trans-04"
									name="avgRating" value="3">
									<i class="fas fa-star" style="color: gold;"></i><i
										class="fas fa-star" style="color: gold;"></i><i
										class="fas fa-star" style="color: gold;"></i><i
										class="fa fa-star"></i><i class="fa fa-star"></i> trở lên
								</button>
							</form>
						</li>
						<li class="p-b-6">
							<form action="/AZShopFurni/filter" method="get">
								<input type="hidden">
								<button type="submit" class="filter-link stext-106 trans-04"
									name="avgRating" value="2">
									<i class="fas fa-star" style="color: gold;"></i><i
										class="fas fa-star" style="color: gold;"></i><i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i> trở lên
								</button>
							</form>
						</li>
						<li class="p-b-6">
							<form action="/AZShopFurni/filter" method="get">
								<input type="hidden">
								<button type="submit" class="filter-link stext-106 trans-04"
									name="avgRating" value="1">
									<i class="fas fa-star" style="color: gold;"></i><i
										class="fa fa-star"></i><i class="fa fa-star"></i><i
										class="fa fa-star"></i><i class="fa fa-star"></i> trở lên
								</button>
							</form>
						</li>
					</ul>
					<div class="mtext-102 cl2 p-b-15">Phân loại</div>
					<ul style="list-style-type: none; padding: 0; margin: 0;">
						<c:forEach var="category" items="${listCate}">
							<li class="p-b-6"
								style="display: inline-block; margin-right: 10px;">
								<form action="/AZShopFurni/filter" method="get"
									style="margin: 0;">
									<input type="hidden" name="Cate" value="${category.getKey()}">
									<button type="submit" class="filter-link stext-106 trans-04"
										style="padding: 5px 10px;">${category.getKey()}(${category.getValue()})</button>
								</form>
							</li>
						</c:forEach>
					</ul>
					<div class="mtext-102 cl2 p-b-15">Tác giả</div>
					<ul style="list-style-type: none; padding: 0; margin: 0;">
						<c:forEach var="author" items="${listAuthors}">
							<li class="p-b-6"
								style="display: inline-block; margin-right: 10px;">
								<form action="/AZShopFurni/filter" method="get"
									style="margin: 0;">
									<input type="hidden" name="Author" value="${author.getKey()}">
									<button type="submit" class="filter-link stext-106 trans-04"
										style="padding: 5px 10px;">${author.getKey()}(${author.getValue()})</button>
								</form>
							</li>
						</c:forEach>
					</ul>

				</div>


				<!-- List Products -->
				<div class="row isotope-grid">
					<c:if test="${books.size() > 0}">
						<c:forEach items="${books}" var="item">
							<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ">
								<div class="block2">
									<div class="block2-pic hov-img0 product-image-size">
										<img src="${item.thumbnail}" alt="IMG-PRODUCT"> <a
											href='<c:url value="/books?id=${item.isbn10}"/>'
											class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
											Xem chi tiết</a>
									</div>

									<div class="block2-txt flex-w flex-t p-t-14">
										<div class="block2-txt-child1 flex-col-l ">
											<a href='<c:url value="/books?id=${item.isbn10}"/>'
												class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
												${item.title} </a> <span class="stext-105 cl3">
												${item.description} </span> <span class="stext-105 cl3"> <i
												class="fas fa-star"
												style="${item.average_rating >= 1 ? 'color: gold;' : ''}"></i>
												<i class="fas fa-star"
												style="${item.average_rating >= 2 ? 'color: gold;' : ''}"></i>
												<i class="fas fa-star"
												style="${item.average_rating >= 3 ? 'color: gold;' : ''}"></i>
												<i class="fas fa-star"
												style="${item.average_rating >= 4 ? 'color: gold;' : ''}"></i>
												<i class="fas fa-star"
												style="${item.average_rating >= 5 ? 'color: gold;' : ''}"></i>
											</span>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
			</div>
	</section>

	<script>
		var params = {
			keyword : "${keyword}",
			cateId : "${cateId}",
			sort : "${sort}",
			price : "${price}",
			rating : "${rating}",
			page : "${page}",
		};
		function run() {
			var url = "?"
					+ Object.keys(params).map(
							function(key) {
								if (params[key] !== null
										&& params[key] !== undefined
										&& params[key] !== "") {
									return encodeURIComponent(key) + '='
											+ encodeURIComponent(params[key]);
								}
							}).filter(Boolean).join('&');

			window.location.href = url;
		}

		function changSort(sort) {
			params["sort"] = sort;
			params["page"] = 1
			run(0);
		}
		function changeRating(rating) {
			params["rating"] = rating;
			params["page"] = 1
			run(0);
		}

		function changePage(page) {
			params["page"] = page
			run(0);
		}
	</script>

</body>

</html>