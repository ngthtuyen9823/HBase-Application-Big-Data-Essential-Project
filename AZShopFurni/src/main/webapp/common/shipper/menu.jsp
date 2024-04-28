<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<style>
.profile-img {
	background-size: cover;
	background-position: center;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	object-fit: cover;
}

.profile {
	text-align: center;
	padding: 2rem 0rem;
}

.bg-img {
	background-repeat: no-repeat;
	background-size: cover;
	border-radius: 50%;
	background-size: cover;
}
</style>
<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
	<div class="sb-sidenav-menu">
		<div class="nav">
			<div class="profile pt-3 pb-0">
				<img class="profile-img mb-3" src="${sessionScope.user.avatar}"
					alt="image">
				<h4>${sessionScope.user.lastName}
					${sessionScope.user.firstName}</h4>
				<c:if test="${sessionScope.user.type==1}">
					<small>Seller</small>
				</c:if>
			</div>
			<div class="sb-sidenav-menu-heading">Đơn hàng</div>
			<a class="nav-link"
				href="${pageContext.request.contextPath}/shipper-list-shipping">
				<div class="sb-nav-link-icon">
					<i class="fas fa-truck"></i>
				</div> Cần giao
			</a> <a class="nav-link"
				href="${pageContext.request.contextPath}/shipper-list-need-ship">
				<div class="sb-nav-link-icon">
					<i class="fas fa-cubes"></i>
				</div> Nhận đơn
			</a> <a class="nav-link"
				href="${pageContext.request.contextPath}/shipper-list-history-ship">
				<div class="sb-nav-link-icon">
					<i class="fas fa-history"></i>
				</div> Lịch sử
			</a>
			<div class="sb-sidenav-menu-heading">Thông tin</div>
			<a class="nav-link" href="${pageContext.request.contextPath}/shipper-satistical">
				<div class="sb-nav-link-icon">
					<i class="fas fa-bar-chart"></i>
				</div> Thống kê
			</a> <a class="nav-link" href="${pageContext.request.contextPath}/shipper-info">
				<div class="sb-nav-link-icon">
					<i class="fas fa-address-card"></i>
				</div> Thông tin cá nhân
			</a>
		</div>
	</div>
</nav>

