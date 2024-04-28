<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Table - Seller</title>
</head>
<body>
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">Thống kê biểu đồ</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Thống kê biểu đồ</li>
			</ol>
			<div class="row">
				<div class="col-xl-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-area me-1"></i>KPI của người bán trong năm
						</div>
						<div class="card-body">
							<canvas id="viewchart1" width="100%" height="40"></canvas>
							<script>
					             var lineChartData = {
					                  labels: [<c:forEach var="item" items="${listReceipt}">'${item.time}',</c:forEach>],
					                  datasets: [
					                       {
					                    	   	 label:'Sản phẩm',
					                             data: [<c:forEach var="item" items="${listReceipt}">${item.value},</c:forEach>],
					                       		 backgroundColor:'rgba(255, 99, 132, 0.6)'
					                       }
					                  ]
					
					             };
					             new Chart(document.getElementById("viewchart1").getContext("2d"),{
                                     type: 'line',
                                     data: lineChartData
                                 });
					       </script>
						</div>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-bar me-1"></i>Sản phẩm người bán đã bán chạy nhất
						</div>
						<div class="card-body">
							<canvas id="myChart" width="100%" height="40"></canvas>
							<script>
                                                var barChartData = {
                                                    labels: [<c:forEach var="item" items="${listItem}">'${item.item}',</c:forEach>],
                                                    datasets: [
                                                        {
                                                        	fillColor: "#FC8213",
                                                        	label:'Sản phẩm',
                                                            data: [<c:forEach var="item" items="${listItem}">${item.value},</c:forEach>],
                                                            backgroundColor:'rgba(0, 98, 201, 0.8)'
                                                        }
                                                    ]

                                                };                                          
                                                new Chart(document.getElementById("myChart").getContext("2d"), {
                                                    type: 'bar',
                                                    data: barChartData
                                                });

                            </script>
						</div>
					</div>
				</div>
			</div>
			<h1 class="mt-4">TOP 10 NGƯỜI BÁN HÀNG XUẤT SẮC NHẤT</h1>
			<c:if test="${not empty message }">
				<div class="alert alert-${alert}">
					<strong>${message}!</strong>
				</div>
			</c:if>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> Bảng dữ liệu về người bán hàng
				</div>
				<div class="card-body">
					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>Mã</th>
								<th>Tên</th>
								<th>Địa chỉ</th>
								<th>Giới tính</th>
								<th>Số điện thoại</th>
								<th>Ngày sinh</th>
								<th>CCCD</th>
								<th>Ảnh đại diện</th>
								<th>KPI</th>
								<th>Chi tiết</th>
							</tr>
						</thead>
						<tfoot>
						<tbody>
							<c:forEach var="i" items="${listseller}">
								<tr>
									<td>${i.userID}</td>
									<td>${i.firstName} ${i.lastName}</td>
									<td>${i.address}</td>
									<td><c:choose>
											<c:when test="${i.gender == 1}">Nữ</c:when>
											<c:when test="${i.gender == 0}">Nam</c:when>
											<c:otherwise>Không rõ</c:otherwise>
										</c:choose></td>
									<td>${i.phone}</td>
									<td>${i.dob}</td>
									<td>${i.cid}</td>
									<td>${i.avatar}</td>
									<td>${i.kpi}</td>
									<td>
										<div class="hidden-sm hidden-xs btn-group">
											<a href="<c:url value='/admin-SellerKPIYear?userID=${i.userID}'/>">
												<button class="btn btn-xs btn-info btn-sm">
													<i class="ace-icon fa fa-eye"></i>
												</button>
											</a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
	</main>
</body>
</html>