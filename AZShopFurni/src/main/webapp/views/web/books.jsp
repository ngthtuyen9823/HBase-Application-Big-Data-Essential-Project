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
			<!-- List books -->
			<div class="row isotope-grid">
				<c:if test="${books.size() > 0}">
					<c:forEach items="${books}" var="item">
						<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ">
							<div class="block2">
								<div class="block2-pic hov-img0 product-image-size">
									<img src="${item.thumbnail}" alt="IMG-PRODUCT"> <a
										href='<c:url value="/books?id=${item.isbn13}"/>'
										class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
										Xem chi tiết</a>
								</div>

								<div class="block2-txt flex-w flex-t p-t-14">
									<div class="block2-txt-child1 flex-col-l ">
										<a href='<c:url value="/books?id=${item.isbn13}"/>'
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
		
	</script>

</body>

</html>