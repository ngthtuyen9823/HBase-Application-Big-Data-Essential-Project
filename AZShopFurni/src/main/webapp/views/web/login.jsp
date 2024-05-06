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
<!-- Style -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/templates/web/css/login.css"/>">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
	rel='stylesheet'>

<title>Đăng nhập</title>
</head>

<body
	style="background: url(https://images.unsplash.com/photo-1481627834876-b7833e8f5570?q=80&w=1856&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D) no-repeat;" }/>

<div class="wrapper">
	<form action="#" method="post">
		<h1>ĐĂNG NHẬP</h1>
		<div class="input-box">
			<input type="text" placeholder="Tên đăng nhập" name="username"
				required> <i class='bx bxs-user'></i>
		</div>
		<div class="input-box">
			<input type="password" placeholder="Mật khẩu" name="password"
				required> <i class='bx bxs-lock-alt'></i>
		</div>
		<div class="remember-forgot">
			<label><input type="checkbox" name="remember" value="on">Nhớ
				mật khẩu</label>
		</div>
		<button type="submit" class="btn">
			<a href="/AZShopFurni/adminHome">Đăng nhập</a>
		</button>
		<div class="register-link">
			<p>
				Bạn chưa có tài khoản? <a href="/AZShopFurni/signup">Đăng ký</a>
			</p>
		</div>
	</form>
</div>
</body>
</html>