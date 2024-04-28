<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link rel="icon" type="image/png" href="https://storage.googleapis.com/web-budget/Image/FE/website-logo.png">

<link href='<c:url value="templates/admin/css/styles.css"/>'
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.min.js"></script>

<meta name="viewport"
	content="width=device-width, initial-scale-1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto Varela+Round">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackilath.bootstrapcdn.com/bootstrap/4.5.0/1s/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<style>
#myModal .modal-confirm {
	color: #636363;
	width: 400px;
}

#myModal .modal-confirm .modal-content {
	padding: 20px;
	border-radius: 5px;
	border: none;
	text-align: center;
	font-size: 14px;
}

#myModal .modal-confirm .modal-header {
	border-bottom: none;
	position: relative;
}

#myModal .modal-confirm h4 {
	text-align: center;
	font-size: 26px;
	margin: 30px 0 -10px;
}

#myModal .modal-confirm .close {
	position: absolute;
	top: -5px;
	right: -2px;
}

#myModal .modal-confirm .modal-body {
	color: #999;
}

#myModal .modal-confirm .modal-footer {
	border: none;
	text-align: center;
	border-radius: 5px;
	font-size: 13px;
	padding: 10px 15px 25px;
}

#myModal .modal-confirm .modal-footer a {
	color: #999;
}

#myModal .modal-confirm .icon-box {
	width: 80px;
	height: 80px;
	margin: 0 auto;
	border-radius: 50%;
	z-index: 9;
	text-align: center;
	border: 3px solid #f15e5e;
}

#myModal .modal-confirm .icon-box i {
	color: #f15e5e;
	font-size: 46px;
	display: inline-block;
	margin-top: 13px;
}

#myModal .modal-confirm .btn, #myModal .modal-confirm .btn:active {
	color: #fff;
	border-radius: 4px;
	background: #60c7c1;
	text-decoration: none;
	transition: all 0.4s;
	line-height: normal;
	min-width: 120px;
	border: none;
	min-height: 40px;
	border-radius: 3px;
	margin: 0 5px;
}

#myModal .modal-confirm .btn-secondary {
	background: #c1c1c1;
}

#myModal .modal-confirm .btn-secondary:hover, #myModal .modal-confirm .btn-secondary:focus
	{
	background: #a8a8a8;
}

#myModal .modal-confirm .btn-danger {
	background: #f15e5e;
}

#myModal .modal-confirm .btn-danger:hover, #myModal .modal-confirm .btn-danger:focus
	{
	background: #ee3535;
}

#myModal .trigger-btn {
	display: inline-block;
	margin: 100px auto;
}
</style>
</head>
<body class="sb-nav-fixed">
	<!-- header -->
	<%@ include file="/common/admin/header.jsp"%>
	<!-- header -->
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<%@ include file="/common/admin/menu.jsp"%>
		</div>
		<div id="layoutSidenav_content">
			<decorator:body></decorator:body>
			<!-- Modal HTML to confirm delete -->
			<div id="myModal" class="modal fade">
				<div class="modal-dialog modal-confirm">
					<div class="modal-content">
						<div class="modal-header flex-column">
							<div class="icon-box">
								<i class="material-icons">&#xE5CD; </i>
							</div>
							<h4 class="modal-title w-100">Bạn có chắc không?</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<p>Bạn có thực sự muốn xóa những bản ghi này? Quá trình này không thể hoàn tác được.</p>
						</div>
						<div class="modal-footer justify-content-center">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Cancel</button>
							<button class="btn btn-danger" id="deleteButton">Delete</button>
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- footer -->
			<%@ include file="/common/admin/footer.jsp"%>
			<!-- footer -->
		</div>
	</div>

	<script>
		$(document).ready(function() {
			// Set the href attribute of the Delete button in the modal
			$('#myModal').on('show.bs.modal', function(e) {
				var link = $(e.relatedTarget).data('link');
				$('#deleteButton').attr('data-link', link);
			});

			// Handle click event of the Delete button
			$('#deleteButton').on('click', function() {
				var link = $(this).attr('data-link');
				// Perform any necessary actions, e.g., navigate to the specified link
				window.location.href = link;
			});
		});
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src='<c:url value="templates/admin/js/scripts.js"/>'></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script
		src='<c:url value="templates/admin/assets/demo/chart-area-demo.js"/>'></script>
	<script
		src='<c:url value="templates/admin/assets/demo/chart-bar-demo.js"/>'></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script
		src='<c:url value="templates/admin/js/datatables-simple-demo.js"/>'></script>
	<script src='<c:url value="templates/admin/js/snippets.js"/>'></script>
</body>
</html>