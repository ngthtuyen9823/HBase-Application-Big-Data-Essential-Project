<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
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
}

.seller-info p {
	margin-bottom: 25;
}

.seller-info {
	width: 65%;
}

.seller-avt {
	width: 30%;
	flex-direction: column;
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 0;
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
	margin-top: 30px;
}

.seller-profile img {
	width: 100%;
	aspect-ratio: 1/1;
	object-fit: cover;
	border-radius: 50%;
	grid-row: 1/span 3;
	background-size: cover;
	background-position: center;
}
.update-pass{
	margin-left: 30px;
	width: 200px !important;
}

.hind {
	visibility: hidden;
	position: absolute;
}
a{
	text-decoration: none;
}
</style>
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
		<p>
			<strong>KPI:</strong> ${user.kpi}
		</p>
		<div id="paragraphContainer"></div>
		<a href="adminUpdateSeller?userID=${user.userID}">
			<button class="update">Cập nhật</button>
		</a>
		<a href="adminUpdateAccount?userID=${user.userID}">
			<button class="update-pass">Đổi mật khẩu</button>
		</a>
	</div>
	<div class="seller-avt">
		<img src="${user.avatar}" id="myImage" alt="User Image">
		<input class="hind" type="file" id="imageInput" accept="image/*"> 
		
	</div>
</div>
<script>
	
	function closePage() {
		// JavaScript để chuyển trang
		window.location.href = 'adminSeller'; // Thay 'url_moi' bằng URL mới bạn muốn chuyển đến
	}
</script>
