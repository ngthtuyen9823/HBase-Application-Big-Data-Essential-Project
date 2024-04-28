<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<title>Thông tin cá nhân</title>
<style>
.seller-profile {
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-family: Arial, sans-serif;
	font-size: 20;
	margin: 40px;
	display: flex;
	flex-direction: row;
	justify-content: end;
	width: 896px;
}

.seller-info p {
	margin: 15px;
	
}

.seller-info {
	width: 65%;
	padding: 50px;
}

.seller-avt {
	width: 30%;
	flex-direction: column;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 0;
	margin-right: 60px;
}

button, .seller-btn {
	padding: 10px 20px;
	width: 120px;
	background-color: #fff;
	color: #000;
	border: black solid 0.5px;
	border-radius: 10px;
	cursor: pointer;
	font-size: 16;
	
}

button:hover, .seller-btn:hover {
	background-color: #d9d9d9;
	border: #d9d9d9 solid 0.5px;
}

.seller-avt label{
 	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-top: 35px;
    margin-bottom: 0;
}

.seller-profile img {
	width: 100%;
	aspect-ratio: 1/1;
	object-fit: cover;
	border-radius: 50%;
	grid-row: 1/span 3;
	background-size: cover;
	background-position: center;
	margin-bottom: 15px;
}
.update-pass{
	margin-left: 30px;
	margin-top: 30px;
	width: 200px !important;
}

.hind {
	visibility: hidden;
	position: absolute;
}
a{
	text-decoration: none;
}
.tai-khoan{
	margin-top: -76px;
}
</style>

<section class="sec-product-detail bg0 p-t-65 p-b-60">
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-lg-2 p-b-80">
				<div class="side-menu">
					<div class="p-t-55">
						<h4 class="mtext-112 cl2 p-b-33 tai-khoan">TÀI KHOẢN</h4>
						<ul>
							<li class="bor18"><a
								href="${pageContext.request.contextPath}/infoUser"
								class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4"
								style="color: #6C7AE0;"> Hồ sơ cá nhân </a></li>
							<li class="bor18"><a
								href="${pageContext.request.contextPath}/listOrder"
								class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
									Đơn mua </a></li>
							<li class="bor18"><a
								href="${pageContext.request.contextPath}/listVoucher"
								class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
									Kho voucher </a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="seller-profile">
				<div class="seller-info">
					<p>
						<strong>Họ tên:</strong> ${user.lastName} ${user.firstName}
					</p>
					<p>
						<strong>Địa chỉ:</strong> ${user.address}
					</p>
					<p>
						<strong>Số điện thoại:</strong> ${user.phone}
					</p>
					<p>
						<strong>Email:</strong> ${user.email}
					</p>
					<p>
						<strong>Giới tính:</strong> ${user.gender==1?'Nữ':'Nam'}
					</p>
					<p>
						<strong>Căn cước công dân:</strong> ${user.cid}
					</p>
					<p>
						<strong>Ngày sinh:</strong>
						<fmt:formatDate value="${user.dob}" pattern="dd/MM/yyyy" />
					</p>
					<div id="paragraphContainer"></div>
					<a href="updateUser?userID=${userModel.userID}">
						<button class="update">Cập nhật</button>
					</a> <a href="updateAccount?userID=${userModel.userID}">
						<button class="update-pass">Đổi mật khẩu</button>
					</a>
				</div>
				<div class="seller-avt">
					<img src="${user.avatar}" id="myImage" alt="User Image"> <input
						class="hind" type="file" id="imageInput" accept="image/*">
					<label class="seller-btn seller-button-img" for="imageInput">Sửa
						ảnh</label>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	// JavaScript để xử lý sự kiện khi giá trị của input file thay đổi
	document.getElementById('imageInput').addEventListener('change',
			function(e) {
				// Đối tượng hình ảnh

				var formData = new FormData();
				formData.append('image', $('#imageInput')[0].files[0]);

				$.ajax({
					type : 'POST',
					url : 'sellerUpdateAvatar',
					data : formData,
					processData : false,
					contentType : false,
					success : function(response) {
						console.log('POST thành công!', response);
						window.location.href = 'infoUser';
					},
					error : function(error) {
						console.error('Lỗi POST:', error);
					}
				});
				//window.location.href = 'infoUser'
			});
</script>
