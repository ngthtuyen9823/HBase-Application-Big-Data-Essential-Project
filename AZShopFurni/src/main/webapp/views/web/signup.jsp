<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet">
<link rel="icon" type="image/png" href="https://storage.googleapis.com/web-budget/Image/FE/website-logo.png">
<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/templates/web/vendor/bootstrap/css/bootstrap.min.css"/>">
<!-- Style -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/templates/web/css/login.css"/>">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>


<title>Đăng ký</title>
</head>

<body>
<body>
	<div class="wrapper signup">
		<h1>ĐĂNG KÝ TÀI KHOẢN</h1>
		<h4>${exception}</h4>
		<form action="signup" method="post">
			<div class="input-box">
				<input type="text" placeholder="Nhập tên đăng nhập"
					name="usernamesignup" value="${usernamesignup}" required><i
					class='bx bxs-user-circle'></i>
			</div>
			<div class="input-box">
				<div class="input-field">
					<input type="password" placeholder="Nhập mật khẩu" name="passsignup"
						required> <i class='bx bxs-lock-alt'></i>
				</div>
				<div class="input-field">
					<input type="password" placeholder="Nhập lại mật khẩu"
						name="passcheck" required> <i class='bx bxs-lock-alt'></i>
				</div>
			</div>
			<div class="input-box">
				<div class="input-field">
					<input type="text" placeholder="Nhập họ" name="firstname"
						value="${firstname}" required> <i
						class='bx bxs-user-detail bx-flip-horizontal'></i>
				</div>
				<div class="input-field">
					<input type="text" placeholder="Nhập tên" name="lastname"
						value="${lastname}" required> <i
						class='bx bxs-user-detail bx-flip-horizontal'></i>
				</div>
			</div>
			<div class="input-box">
				<div class="input-field">
					<input type="text" placeholder="Nhập email" name="email"
						value="${email}"> <i
						class='bx bxs-envelope bx-flip-horizontal'></i>
				</div>
				<div class="input-field">
					<select name="gender"
						style="padding: 0 0 0 20px; margin-left: 20px; width: 180px; height: 43px; background: transparent; border: none; outline: none; border: 2px solid rgba(255, 255, 255, .2); border-radius: 40px; font-size: 16px; color: white">
						<option style="background: transparent" value="0">Nam</option>
						<option style="background: transparent" value="1">Nữ</option>
					</select>
				</div>
				<div class="input-field">
					<input type="date" name="dob" value="${dob}">
				</div>
			</div>
			<div class="input-box">
				<div class="input-field">
					<input type="text" placeholder="Nhập số điện thoại" name="phone"
						value="${phone}"> <i class='bx bxs-phone-call'></i>
				</div>
				<div class="input-field">
					<input type="text" placeholder="Chọn thành phố" name="area"
						list="exampleList" value="${area}"> <i class='bx bxs-city' ></i>
					<datalist id="exampleList">
						<c:forEach var="city" items="${listcity}">
							<option value="${city}">
						</c:forEach>
					</datalist>
				</div>
			</div>
			<div class="input-box">
				<input type="text" placeholder="Nhập địa chỉ" name="address"
					value="${address}"> <i class='bx bxs-building-house'></i>

			</div>
			<input type="submit" value="Đăng ký"
				class="btn btn-block btn-primary mb-3">
			<div class="register-link">
				<p>
					Nếu bạn đã có tài khoản <a
						href="${pageContext.request.contextPath}/login">Đăng nhập tại
						đây </a>
				</p>
			</div>
		</form>
	</div>

</body>

</html>