<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<title>Chỉnh sửa thông tin</title>
<form action="updateUser" method="post" enctype="multipart/form-data">
	<section class="bg0 p-t-52 p-b-20">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-lg-2 p-b-80">
					<div class="side-menu">
						<div class="p-t-55" style="margin-top: -67px;">
							<h4 class="mtext-112 cl2 p-b-33">TÀI KHOẢN</h4>
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
				<div class="col-md-6 col-lg-7 p-b-80" style="margin-left: 180px;">
					<div class="p-r-45 p-r-0-lg">
						<div class="p-t-40">
							<h5 class="mtext-113 cl2 p-b-12"
								style="margin-left: 175px; margin-bottom: 20px;">Chỉnh sửa
								thông tin</h5>

							<input type="hidden" name="UserID" value="${userModel.userID}">
							<div class="row">
								<div class=" m-b-30 mr-3">
									<label> Họ và tên đệm</label> <input
										class="bor19 stext-111 cl2 plh3 size-116 p-lr-18" type="text"
										name="LastName" value="${userModel.lastName}"
										style="width: 300px;">
								</div>
								<div class=" m-b-30">
									<label> Tên</label> <input
										class="bor19 stext-111 cl2 plh3 size-116 p-lr-18" type="text"
										name="FirstName" value="${userModel.firstName}"
										style="width: 300px;">
								</div>
								<div class="m-b-30 mr-3">
									<label> Địa chỉ</label> <input
										class="bor19 stext-111 cl2 plh3 size-116 p-lr-18" type="text"
										name="Address" value="${userModel.address}"
										style="width: 300px;">
								</div>
								<div class=" m-b-30">
									<label> Căn cước công dân</label> <input
										class="bor19 stext-111 cl2 plh3 size-116 p-lr-18" type="text"
										name="Cid" value="${userModel.cid}" style="width: 300px;">
								</div>
								<div class="mr-3 m-b-30">
									<label> Số điện thoại</label> <input
										class="bor19 stext-111 cl2 plh3 size-116 p-lr-18" type="text"
										name="Phone" value="${userModel.phone}" style="width: 200px;">
								</div>
								<div class="mr-3 m-b-30">
									<label> Giới tính</label>
									<div class="bor19 rs1-select2 bor19 bg0"
										style="width: 200px; height: 50px;">
										<select class="js-select2" name="Gender">
											<option value="0" ${userModel.gender  == 0 ? 'selected' : ''}>Nam</option>
											<option value="1" ${userModel.gender  == 1 ? 'selected' : ''}>Nữ</option>
										</select>
										<div class="dropDownSelect2"></div>
									</div>
								</div>
								<div class="m-b-30">
									<label> Ngày sinh</label> <input
										class="bor19 stext-111 cl2 plh3 size-116 p-lr-18" type="date"
										name="Dob" value="${userModel.dob}" style="width: 180px;">
								</div>
								<div>
									<input type="hidden" name="Type" value="${userModel.type}">
									<input type="hidden" name="Email" value="${userModel.email}">
									<input type="hidden" name="KPI" value="${userModel.kpi}">
									<input type="hidden" name="Area" value="${userModel.area}">
									<input type="hidden" name="image" value="${userModel.avatar}">
								</div>
								<div>
									<button
										class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04"
										type="submit" style="margin-left: 227px;">Chỉnh sửa</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-lg-3 p-b-80">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="slick3 gallery-lb"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</form>