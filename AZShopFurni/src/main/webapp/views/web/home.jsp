<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<style>
section {
	padding: 60px 0;
}

.concept_text h3, .about_us h4 {
	font-weight: 700 !important;
}

#height_reset {
	height: 0;
}

.text_center {
	text-align: center;
}

.container {
	display: flex;
	color: #676767;
}

.model_left {
	width: 50%;
	position: relative;
}

.title_model_left {
	position: absolute;
	top: 2%;
	left: 3%;
}

.model_right {
	width: 50%;
	margin-left: 5%;
	padding-top: 30px;
}

.model_right img {
	width: 40%;
}

.model_left img {
	width: 100%;
}

.item_space {
	display: flex;
	justify-content: space-evenly;
}

.item_bottom {
	margin-top: 6%;
}

.text_left {
	width: 35%;
}

.text_left p {
	line-height: 2;
}

.text_right {
	width: 35%;
	text-align: justify;
}

.text_right p {
	line-height: 1.5;
}

.concept_text .container {
	display: flex;
	justify-content: space-evenly;
}

.concept_img .container h5 {
	margin-top: 15px;
	display: block;
}

.img_left {
	width: 50%;
	height: 400px;
	cursor: pointer;
	overflow: hidden;
}

.img_left img {
	transition: all ease-in-out 0.5s;
}

.img_left:hover img {
	transform: scale(1.1);
}

.img_right {
	width: 50%;
	height: 400px;
	cursor: pointer;
	overflow: hidden;
}

.img_right img {
	transition: all ease-in-out 0.5s;
}

.img_right:hover img {
	transform: scale(1.1);
}

.concept_img .container {
	display: flex;
	justify-content: space-evenly;
	gap: 50px;
}

.concept_img img {
	width: 100%;
	display: block;
	margin: auto;
	height: 100%;
}

.width_50 {
	width: 50%;
}

.width_100 {
	width: 100%;
}

.width_25 {
	width: 25%;
}

.width_30 {
	width: 30%;
}

.width_70 {
	width: 60%;
}

.bottom_item_img {
	display: flex;
	gap: 2px;
}

.relative {
	position: relative;
}

.absolute {
	position: absolute;
	bottom: 2%;
	left: 3%;
	display: block;
	color: white;
}

.height_100 {
	height: 100%;
}

.home_decoration {
	display: flex;
	gap: 2px;
}

.top_item {
	margin-bottom: 2px;
}

.about_us .container {
	display: flex;
	justify-content: space-between;
}

.about_us .container p {
	line-height: 1.5;
	text-align: justify;
}

#style_slider {
	display: flex;
	gap: 10px;
}

.item_top img:hover {
	transform: scale(1.08);
}

.item_top img {
	transition: all ease 0.5s;
}

.item_bottom img:hover {
	transform: scale(1.08);
	cursor: pointer;
}

.item_bottom img {
	transition: all ease 0.5s;
}

#opacity {
	opacity: 0.6;
	cursor: pointer;
}

#opacity:hover {
	opacity: 1;
}

.product-container {
	padding: 0 2vw;
}

.product-image-size img {
	width: 230px;
	height: 340px;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.green.min.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
	integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
	crossorigin="anonymous"></script>
<div id="carouselExampleDark" class="carousel carousel-dark slide">
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#carouselExampleDark"
			data-bs-slide-to="0" class="active" aria-current="true"
			aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#carouselExampleDark"
			data-bs-slide-to="1" aria-label="Slide 2"></button>
		<button type="button" data-bs-target="#carouselExampleDark"
			data-bs-slide-to="2" aria-label="Slide 3"></button>
	</div>
	<div class="carousel-inner">
		<div class="carousel-item active" data-bs-interval="10000">
			<img src="images/book2.png" class="d-block w-100" alt="...">
		</div>
		<div class="carousel-item" data-bs-interval="2000">
			<img src="images/book3.png" class="d-block w-100" alt="...">
		</div>
		<div class="carousel-item">
			<img src="images/book1.png" class="d-block w-100" alt="...">

		</div>
	</div>
	<button class="carousel-control-prev" type="button"
		data-bs-target="#carouselExampleDark" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#carouselExampleDark" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
	</button>
</div>

<section class="list_product">
	<div class="container">
		<div class="model_right">
			<div class="item_top item_space">
				<img src="images/book4.png" alt=""> <img
					src="images/book5.png" alt=""> <img src="book6.png" alt="">
				<img src="images/book7.png" alt=""> <img>
			</div>


		</div>
	</div>
</section>
<section class="concept_text">
	<div class="container">
		<div class="text_left">
			<h3 class="text_center">Thư viện với kho sách đa dạng</h3>
			<p>
				FIT LIB tự hàm mang đến trải nghiệm tuyệt vời cho độc giả với không
				gian phòng đọc rộng rãi thoáng mát <br> <br> Sách cung cấp
				bởi FIT LIB sẽ mang đến những kiến thức, trải nghiệm tuyệt vời trong
				hành trình đọc sách và khám phá tri thức.
			</p>
		</div>
		<div class="text_right  ">
			<h3 class="text_center">TRẢI NGHIỆM KHÔNG GIAN ĐỌC SÁCH MỚI CÙNG
				FIT LIB-CONCEPT</h3>
			<P class="text_center">
				KHÔNG GIAN SANG TRỌNG <br> KHO SÁCH ĐA DẠNG <br> SÁCH CẬP
				NHẬT XU HƯỚNG
			</P>
		</div>
	</div>
</section>
<section class="product">
	<h2 class="product-category">Top 5 Sách được đánh giá cao</h2>
	<button class="pre-btn">
		<img src="images/arrow.png" alt="">
	</button>
	<button class="nxt-btn">
		<img src="images/arrow.png" alt="">
	</button>
	<div class="product-container">
		<c:forEach items="${topratingbook}" var="item">
			<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ">
				<div class="block2">
					<div class="block2-pic hov-img0 product-image-size">
						<img src="${item.thumbnail}" alt="IMG-PRODUCT" width="128"
							height="209"> <a
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
								style="${item.average_rating >= 1 ? 'color: gold;' : ''}"></i> <i
								class="fas fa-star"
								style="${item.average_rating >= 2 ? 'color: gold;' : ''}"></i> <i
								class="fas fa-star"
								style="${item.average_rating >= 3 ? 'color: gold;' : ''}"></i> <i
								class="fas fa-star"
								style="${item.average_rating >= 4 ? 'color: gold;' : ''}"></i> <i
								class="fas fa-star"
								style="${item.average_rating >= 5 ? 'color: gold;' : ''}"></i>
							</span>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</section>

<section class="product">
	<h2 class="product-category">Top 5 Sách được nhiều đánh giá nhất</h2>
	<button class="pre-btn">
		<img src="images/arrow.png" alt="">
	</button>
	<button class="nxt-btn">
		<img src="images/arrow.png" alt="">
	</button>
	<div class="product-container">
		<c:forEach items="${topratingcountbook}" var="item">
			<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ">
				<div class="block2">
					<div class="block2-pic hov-img0 product-image-size">
						<img src="${item.thumbnail}" alt="IMG-PRODUCT" width="128"
							height="209"> <a
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
								style="${item.average_rating >= 1 ? 'color: gold;' : ''}"></i> <i
								class="fas fa-star"
								style="${item.average_rating >= 2 ? 'color: gold;' : ''}"></i> <i
								class="fas fa-star"
								style="${item.average_rating >= 3 ? 'color: gold;' : ''}"></i> <i
								class="fas fa-star"
								style="${item.average_rating >= 4 ? 'color: gold;' : ''}"></i> <i
								class="fas fa-star"
								style="${item.average_rating >= 5 ? 'color: gold;' : ''}"></i>
							</span>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</section>
<!-- edit slider -->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"> </script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script>
     const productContainers = [...document.querySelectorAll('.product-container')];
     const nxtBtn = [...document.querySelectorAll('.nxt-btn')];
     const preBtn = [...document.querySelectorAll('.pre-btn')];

     productContainers.forEach((item, i) => {
         let containerDimensions = item.getBoundingClientRect();
         let containerWidth = containerDimensions.width;

         nxtBtn[i].addEventListener('click', () => {
             item.scrollLeft += containerWidth;
         })

         preBtn[i].addEventListener('click', () => {
             item.scrollLeft -= containerWidth;
         })
     })
     </script>
<script>
     $('.owl-carousel').owlCarousel({
    	    loop:true,
    	    margin:10,
    	    nav:true,
    	    responsive:{
    	        0:{
    	            items:1
    	        },
    	        600:{
    	            items:3
    	        },
    	        1000:{
    	            items:5
    	        }
    	    }
    	})
     </script>