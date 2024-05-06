<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
	<div class="sb-sidenav-menu">
		<div class="nav">
			<div class="sb-sidenav-menu-heading">HomePage</div>
			<a class="nav-link" href="<c:url value='/adminHome'/>">
				<div class="sb-nav-link-icon">
					<i class="fas fa-tachometer-alt"></i>
				</div> Thống kê
			</a>
		</div>
		<div class="nav">
			<div class="sb-sidenav-menu-heading">View</div>
			<a class="nav-link" href="<c:url value='/adminBook'/>">
				<div class="sb-nav-link-icon">
					<i class="fas fa-tachometer-alt"></i>
				</div> Quản lý sách
			</a> 
			<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
				data-bs-target="#collapseLayouts" aria-expanded="false"
				aria-controls="collapseLayouts">
				<div class="sb-nav-link-icon">
					<i class="bi bi-people"></i>
				</div> Người dùng
				<div class="sb-sidenav-collapse-arrow">
					<i class="fas fa-angle-down"></i>
				</div>
			</a>
			<div class="collapse" id="collapseLayouts"
				aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
				<nav class="sb-sidenav-menu-nested nav">
					<a class="nav-link" href="<c:url value='/adminReader'/>">Độc giả</a> 
					<a class="nav-link" href="<c:url value='/adminStaff'/>">Thủ Thư</a> 
				</nav>

			</div>
		</div>

		<div class="sb-sidenav-footer"
			style="position: fixed; bottom: 0; width: 100%;">
			<div class="small">Đăng nhập với vai trò:</div>
			Quản lý
		</div>
</nav>

