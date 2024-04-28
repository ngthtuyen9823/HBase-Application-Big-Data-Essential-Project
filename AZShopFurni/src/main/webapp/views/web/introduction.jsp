<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<style>
section {
	padding: 60px 0;
}

.width_60 {
	width: 60%;
}

html, body {
	font-family: 'Montserrat', sans-serif;
	font-size: 15px;
	letter-spacing: 0.25px;
	line-height: 24px;
	outline: none !important;
	background: #ffffff;
	color: #545454;
}

.width_100 {
	width: 100%;
}

img {
	vertical-align: middle;
}

.hack_ur_space .container {
	display: flex;
	justify-content: space-between;
}

.width_30 {
	width: 66.66667%;
}

.container, .container-fluid, .container-lg, .container-md,
	.container-sm, .container-xl, .container-xxl {
	--bs-gutter-x: 1.5rem;
	--bs-gutter-y: 0;
	width: 100%;
	padding-right: calc(var(--bs-gutter-x)* .5);
	padding-left: calc(var(--bs-gutter-x)* .5);
	margin-right: auto;
	margin-left: auto;
}

h4 {
	font-size: calc(1.275rem + .3vw);
}

.hack_ur_space .container p {
	line-height: 1.5;
	text-align: justify;
}

.container {
	display: flex;
}

.container .text {
	padding-right: 15px;
}

.container .img {
	padding-left: 15px;
}

.container:before, .container:after {
	content: " ";
	display: table;
}

.background:before {
	position: absolute;
	display: block;
	content: "";
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 10;
}

.header_background_img {
	min-height: 300px;
	padding: 40px;
	margin-top: 0px;
}

.h2, h2 {
	font-size: 45px !important;
}

h1, h2, h3, h4, h5, h6 {
	font-family: 'Montserrat', sans-serif;
	line-height: auto;
	letter-spacing: 0;
	color: #676767;
	margin-top: 0;
	margin-bottom: 15px;
}

* {
	box-sizing: border-box;
}

main {
	display: block;
}

main {
	margin-bottom: 0;
	overflow: hidden;
}

.header-background-info {
	margin-top: 150px;
}

.icon {
	height: 130px;
	width: 130px;
	margin-bottom: 25px;
}

.container .column {
	text-align: center;
}

.purpose .container p {
	float: left;
	text-align: center !important;
	padding: 0 20px;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.text-center {
	text-align: center;
}

.title-ourteam {
	padding-bottom: 40px;
}

.purpose {
	margin-top: 50px;
	margin-bottom: 100px;
</style>

<div class="wrapper main_content">
    <div class="main_header background header_background_img" style="background-image:url(//theme.hstatic.net/1000280685/1000722794/14/about_header_bg.jpg?v=1313)">
            <div class="container header-background-info">
                <h2 class="">Giới thiệu</h2>
            </div>
    </div>

    <section class="hack_ur_space">
        <div class="container">
            <div class="text width_30">
                <h4 class="title"> Hack your space - Hack your life </h4>
                <p> 
                    “Less is More" là một ngụ ý trong tư duy và thiết kế về sự đúng đắn trong việc tối giản hoá mọi thứ. 
                    Triết lý này trở nên nổi tiếng và lan toả mạnh mẽ vào những năm đầu thế kỷ 20, khi song hành cùng vị
                     kiến trúc sư huyền thoại Ludwig Mies Van Der Rohe của trường phái Minimalism – Chủ nghĩa tối giản.
                <br>
                <br>
                    Kế thừa tư duy đó và một mong muốn tạo dựng những không gian sống mang tính chuẩn mực và hiện đại, 
                    những người trẻ chúng tôi đã cùng nhau cho ra đời AZ-SHOP. Câu chuyện được bắt đầu từ cuối năm 
                    2016 bởi một kiến trúc sư trẻ tuổi, AZ-SHOP bước đầu nhận được khá nhiều sự ủng hộ của các bạn 
                    trẻ và vẫn đang tiếp tục những chương mới. Tại AZ-SHOP, tất cả sản phẩm trang trí nội thất & 
                    giải pháp không gian sống không chỉ đơn thuần tuân thủ theo ngôn ngữ giản lược của Minimalism, mà
                     còn cân bằng được tính năng và độ thẩm mỹ cần có. 
                <br>
                <br>
                    “Ít tức là nhiều", nhưng mỗi chi tiết xuất hiện trên thiết kế đều là một sự chăm chút kỹ lưỡng và
                     hoàn hảo. Và đó cũng chính là tôn chỉ hoạt động của AZ-SHOP. Với tinh thần cầu tiến luôn cố
                      gắng hết mình để cung cấp những sản phẩm chất lượng cộng với dịch vụ thân thiện cho khách hàng, 
                      chúng tôi hy vọng có thể chia sẻ một niềm tin cố hữu với tất cả mọi người: “Cuộc sống sẽ trở nên 
                      tốt đẹp hơn khi không gian sống được quan tâm và đầu tư đúng mực.”
                </p>
            </div>
            <div class="img width_60">
                <img class="width_100" src="https://storage.googleapis.com/web-budget/Image/FE/hack%20your%20life.png" alt="Hack your space">
            </div>
        </div>
        <div class="purpose">
            <div class="container">
            <div class="column">
                <img class="icon" src="https://storage.googleapis.com/web-budget/Image/FE/logo%20background.png">
                    <div class="text">
                        <h4>TRUYỀN CẢM HỨNG</h4>
                        <p>
                            Chúng tôi tin rằng: Không gian sống đẹp có thể làm thay đổi chất lượng cuộc sống của bạn. Và chúng tôi mong mỏi truyền tải niềm tin đó đến cho mọi người để ai cũng có một nơi đáng sống.
                        </p>
                    </div>
            </div>
            <div class="column">
                <img class="icon" src="https://storage.googleapis.com/web-budget/Image/FE/pattern%20background.png">
                    <div class="text">
                        <h4>ĐỊNH HƯỚNG THẨM MỸ</h4>
                        <p>
                            Chúng tôi không chỉ cung cấp sản phẩm nội thất, chúng tôi mang cho bạn phong cách sống. “Less is more” - Một sự đơn giản nhất định nhưng tinh tế trong không gian sống sẽ giúp bạn dễ dàng cân bằng hơn trong cuộc sống.
                        </p>
                    </div>
            </div>
            <div class="column">
                <img class="icon" src="https://storage.googleapis.com/web-budget/Image/FE/pattern%20background%202.png">
                    <div class="text">
                        <h4>XÂY DỰNG GIÁ TRỊ VIỆT</h4>
                        <p>
                            Ứng dụng và phát triển những giá trị truyền thống vào không gian sống hiện đại là một trong những đặc điểm để khẳng định và làm cho chúng tôi trở nên khác biệt. Chúng tôi muốn trở thành một thương hiệu Việt vì người Việt.
                        </p>
                    </div>
            </div>
            </div>
        </div>
        <div class="container">
            <div class="contact-info">
                <div class="contact-adress">
                    <h4>Thông tin liên hệ</h4>
                    <div class="ts-adress">
                        <address>
                            <p>
                                </p><ul class="list-info">
            <li><strong>Công ty TNHH Kiến trúc và Nội thất AZ-SHOP </strong></li>
            <li><strong>GPĐKKD:</strong> số 03144556788 do Sở KHĐT TP.HCM cấp ngày 03/11/2023</li>
            <li><strong>Cửa hàng: </strong> SH603-1, Block S6.03 Vinhome Grand Park, Thủ Đức, TP.Hồ Chí Minh </li>
            <li><strong>Hotline: </strong>096 716 6879</li>
            <li><strong>Email: </strong>suppport@azshopvn.com</li>
            
                            <p></p>
            
                        </ul></address>
                    </div>
                </div>
                <div class="contact-time">
                    <h4>Giờ làm việc</h4>
                    <div class="ts-time">
                        <p>
                            </p><li><strong>Văn phòng: </strong>Thứ 2 – Thứ 7; 9:00 – 18:00</li>
                            <li><strong>Cửa hàng: </strong>Thứ 2 – Thứ 7; 9:00 – 21:00</li>
                        <p></p>
                    </div>
                </div>
            </div>
            
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.5775445182644!2d106.8359462746597!3d10.843606107951775!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317521c38e580d25%3A0xdd48d75138c9dae3!2sVinhomes%20Grand%20Park%20-%20Origami%20S6.03!5e0!3m2!1svi!2s!4v1702369841960!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </section>
</div>