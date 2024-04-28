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
				<div class="profile">
				    <img class="profile-img mb-3" src="${sessionScope.user.avatar}" alt="image">
				    <h4>${sessionScope.user.lastName} ${sessionScope.user.firstName}</h4>
				    <c:if test="${sessionScope.user.type==1}">
				    	<small>Seller</small>
				    </c:if>
				</div>
				<a class="nav-link" href="<c:url value='/sellerHome'/>">
					<div class="sb-nav-link-icon"><i class="fa-solid fa-house"></i></div>
					Thống kê
				</a>
				<a class="nav-link" href="sellerConfirmedOrder"> <div class="sb-nav-link-icon"><i class="fas fa-history"></i>
					</div> Lịch sử xác nhận đơn
				</a> 
				<div class="sb-sidenav-menu-heading">Quản lý</div>
				<a class="nav-link" href="sellerInfor"> <div class="sb-nav-link-icon"><i class="fa-regular fa-user"></i>
					</div> Thông tin cá nhân
				</a> 
				<a class="nav-link" href="sellerOrders"> <div class="sb-nav-link-icon"><i class="fas fa-cubes"></i>
					</div> Xác nhận đơn hàng
				</a>
				<a class="nav-link" href="sellerUnpreOrder"> <div class="sb-nav-link-icon"><i class="fa-solid fa-cart-shopping"></i>
					</div> Chuẩn bị đơn hàng
				</a> 
		</div>
		<div class="sb-sidenav-footer" style=" position: fixed;    bottom: 0;    width: 100%;">
			<div class="small">Logged in as:</div>
			Seller
		</div>
	</nav>

