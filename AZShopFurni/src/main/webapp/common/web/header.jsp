<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
#height_reset {
	height: 0;
}
</style>
<header class="header-v4">
	<div class="container-menu-desktop" id="height_reset">

		<div class="wrap-menu-desktop how-shadow1">
			<nav class="limiter-menu-desktop container">
				<a href="<c:url value='/home'/>" class="logo"> <img
					src="https://avatars.githubusercontent.com/u/75773455?s=280&v=4"
					alt="IMG-LOGO">
				</a>

				<!-- Menu desktop -->
				<div class="menu-desktop">
					<ul class="main-menu">
						<li
							<c:if test="${fn:contains(pageContext.request.requestURI, 'home')}">class="active-menu"</c:if>><a
							href="<c:url value='/home'/>">Trang chủ</a></li>
						<li
							<c:if test="${fn:contains(pageContext.request.requestURI, 'products')}">class="active-menu"</c:if>><a
							href="<c:url value='/books'/>">Sách</a></li>
						<li><a href="<c:url value='/contact'/>"
							onclick="scrollToBottom()">Liên hệ</a></li>
					</ul>
				</div>

				<!-- Icon header -->
				<div class="wrap-icon-header flex-w flex-r-m">

					<ul class="main-menu">
						<li><a href="<c:url value='/infoUser'/>"
							class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11">
								<i class=".zmdi fa-solid fa-user fa-xl"></i>
						</a>
							<ul class="sub-menu">
								<li><a href="<c:url value='/infoUser'/>">Thông tin cá
										nhân</a></li>
								<li><a href="<c:url value='/logout'/>">Đăng xuất</a></li>
							</ul></li>
					</ul>
					<div
						class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
						data-notify="${carts != null ? carts.size() : 0}">
						<i class="zmdi zmdi-shopping-cart"></i>
					</div>
				</div>
			</nav>
		</div>
	</div>
	<!-- Modal Search -->
	<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
		<div class="container-search-header">
			<button
				class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
				<img src="images/icons/icon-close2.png" alt="CLOSE">
			</button>

			<form class="wrap-search-header flex-w p-l-15">
				<button class="flex-c-m trans-04">
					<i class="zmdi zmdi-search"></i>
				</button>
				<input class="plh3" type="text" name="search"
					placeholder="Search...">
			</form>
		</div>
	</div>
</header>


<script>
	function scrollToBottom() {
		window.scrollTo(0, document.body.scrollHeight);
	}
</script>