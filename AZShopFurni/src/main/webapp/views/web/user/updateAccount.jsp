<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<title>Đổi mật khẩu</title>
<form action="updateAccount" method="post" enctype="multipart/form-data">
	<section class="bg0 p-t-52 p-b-20">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-lg-2 p-b-80">
					<div class="side-menu">
						<div class="p-t-55">
							<h4 class="mtext-112 cl2 p-b-33" style="margin-top: -70px;">TÀI
								KHOẢN</h4>

							<ul>
								<li class="bor18"><a
									href="${pageContext.request.contextPath}/infoUser"
									class="dis-block stext-115 cl6 hov-cl1 trans-04 p-tb-8 p-lr-4">
										Hồ sơ cá nhân </a></li>

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
				<div class="col-md-6 col-lg-7 p-b-80" style="margin-left: 170px;">
					<div class="p-r-45 p-r-0-lg">
						<div class="p-t-40">
							<h5 class="mtext-113 cl2 p-b-12" style="margin-left: 180px;">thay
								đổi mật khẩu</h5>
							<c:if test="${not empty message }">
								<div class="alert alert-${alert}">
									<strong>${message}!</strong>
								</div>
							</c:if>
							<input type="hidden" name="UserID" value="${accountModel.userID}">
							<input type="hidden" name="UserName"
								value="${accountModel.userName}">
							<div class="row">
								<div class=" m-b-30 mr-3">
									<label> Mật khẩu cũ </label> <input
										class="bor19 stext-111 cl2 plh3 size-116 p-lr-18"
										type="password" id="oldPassword" name="OldPassWord"
										style="width: 300px;">
								</div>
								<div class=" m-b-30">
									<label> Mật khẩu mới</label> <input
										class="bor19 stext-111 cl2 plh3 size-116 p-lr-18"
										type="password" name="Password" style="width: 300px;">
								</div>
								<button
									class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04"
									type="submit" style="margin-left: 218px;">Thay đổi</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>
</form>
