<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- Footer -->
<footer class="bg2 p-t-50 p-b-25">
	<div class="container" style="flex-direction: column; display: flex;">
		<div class="row">

			<div class="col-sm-6 col-lg-3 p-b-10">
				<a href="<c:url value='/home'/>"> <img alt="Logo-web"
					style="width: 200px"
					src="https://storage.googleapis.com/web-budget/Image/Other/logo.png">
				</a>
			</div>

			<div class="col-sm-6 col-lg-3 p-b-10">
				<h4 class="stext-301 cl2 p-b-10">DANH MỤC</h4>

				<ul style="padding-left: 0;">
					<c:forEach items="${rootCategories}" var="category">
						<li class="p-b-10"><a
							href="<c:url value='/products?cateId=${category.categoryID}'/>"
							class="stext-107 cl6 hov-cl1 trans-04">
								${category.categoryName} </a></li>
					</c:forEach>
				</ul>
			</div>

			<div class="col-sm-6 col-lg-3 p-b-10">
				<h4 class="stext-301 cl2 p-b-10">HỖ TRỢ</h4>

				<ul style="padding-left: 0;">
					<li class="p-b-10"><div class="stext-107 cl6 hov-cl1 trans-04">
							Ưu đãi</div></li>

					<li class="p-b-10"><div class="stext-107 cl6 hov-cl1 trans-04">
							Trả hàng</div></li>

					<li class="p-b-10"><div class="stext-107 cl6 hov-cl1 trans-04">
							Giao hàng</div></li>

					<li class="p-b-10"><div class="stext-107 cl6 hov-cl1 trans-04">
							FAQs</div></li>
				</ul>
			</div>

			<div class="col-sm-6 col-lg-3 p-b-10">
				<h4 class="stext-301 cl2 p-b-10">ĐỊA CHỈ CỬA HÀNG</h4>

				<p class="stext-107 cl6 size-201">Hãy đến cửa hàng của chúng tôi
					tại SH603-1, Block S6.03 Vinhome Grand Park, Thủ Đức, TP.Hồ Chí
					Minh hoặc hotline 096 716 6879</p>

				<div class="p-t-27">
					<a href="https://www.facebook.com/makemyhomevn"
						class="fs-18 cl6 hov-cl1 trans-04 m-r-16"> <i
						class='bx bxl-facebook-circle'></i>
					</a> <a href="https://www.instagram.com/makemyhomevn/"
						class="fs-18 cl6 hov-cl1 trans-04 m-r-16"> <i
						class='bx bxl-instagram-alt'></i>
					</a> <a href="https://www.youtube.com/@MAKEMYHOMEVN"
						class="fs-18 cl6 hov-cl1 trans-04 m-r-16"> <i
						class='bx bxl-youtube'></i>
					</a>
				</div>
			</div>


		</div>

		<div class="p-t-0">
			<div class="flex-c-m flex-w p-b-18">
				<div class="m-all-1">
					<img
						src="https://storage.googleapis.com/web-budget/Image/icons/icon-pay-01.png"
						alt="ICON-PAY">
				</div>
				<div class="m-all-1">
					<img
						src="https://storage.googleapis.com/web-budget/Image/icons/icon-pay-02.png"
						alt="ICON-PAY">
				</div>
				<div class="m-all-1">
					<img
						src="https://storage.googleapis.com/web-budget/Image/icons/icon-pay-03.png"
						alt="ICON-PAY">
				</div>
				<div class="m-all-1">
					<img
						src="https://storage.googleapis.com/web-budget/Image/icons/icon-pay-04.png"
						alt="ICON-PAY">
				</div>
				<div class="m-all-1">
					<img
						src="https://storage.googleapis.com/web-budget/Image/icons/icon-pay-05.png"
						alt="ICON-PAY">
				</div>
			</div>

			<p class="stext-107 cl6 txt-center">
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				Copyright &copy;
				<script>
					document.write(new Date().getFullYear());
				</script>
				All rights reserved | Made with <i class="fa fa-heart-o"
					aria-hidden="true"></i> by Nhóm 4</a> &amp; distributed by <a
					href="https://themewagon.com" target="_blank">ThemeWagon</a>
				<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

			</p>
		</div>
	</div>
</footer>


<!-- Back to top -->
<div class="btn-back-to-top" id="myBtn">
	<span class="symbol-btn-back-to-top"> <i
		class="zmdi zmdi-chevron-up"></i>
	</span>
</div>