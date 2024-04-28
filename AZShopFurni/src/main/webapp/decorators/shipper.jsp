<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title></title> -->
<!-- css -->
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link rel="icon" type="image/png" href="https://storage.googleapis.com/web-budget/Image/FE/website-logo.png">
<link href='<c:url value="templates/admin/css/styles.css"/>'
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/templates/web/css/util.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/templates/web/css/main.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/templates/web/css/products/products.css"/>">
<link href='<c:url value="/templates/shipper/css/mymodel.css"/>'
	rel="stylesheet" />

<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src='<c:url value="templates/admin/js/scripts.js"/>'></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
	crossorigin="anonymous"></script>
<script
	src='<c:url value="templates/admin/js/datatables-simple-demo.js"/>'></script>
<script src='<c:url value="templates/admin/js/snippets.js"/>'></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>

</head>
<body class="sb-nav-fixed">
	<!-- header -->
	<%@ include file="/common/shipper/header.jsp"%>
	<!-- header -->
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<%@ include file="/common/shipper/menu.jsp"%>
		</div>
		<div id="layoutSidenav_content">
			<decorator:body></decorator:body>
		</div>
	</div>
</body>
</html>