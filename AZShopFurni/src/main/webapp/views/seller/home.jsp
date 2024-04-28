<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chủ</title>
</head>
<body>
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">Thống Kê</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Dashboard</li>
			</ol>
			<div class="row">
				<div class="col-xl-3 col-md-6">
					<div class="card bg-warning text-white mb-4">
						<div class="card-body">Đơn hàng chưa xác nhận </div>
						<div class="card-body">${orderUnconfirm} </div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="<c:url value='/sellerOrders'/>">Xem chi tiết</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card bg-warning text-white mb-4">
						<div class="card-body">Đơn hàng chưa chuẩn bị </div>
						<div class="card-body">${orderUnpre} </div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="<c:url value='/sellerUnpreOrder'/>">Xem chi tiết</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card bg-success text-white mb-4">
						<div class="card-body">Đơn hàng đã hoàn thành</div>
						<div class="card-body">${orderComplete} </div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="<c:url value='/sellerOrderComplete'/>">Xem chi tiết</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card bg-danger text-white mb-4">
						<div class="card-body">Đơn hàng bị hủy</div>
						<div class="card-body">${orderCanceled} </div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="<c:url value='/sellerOrderCanceled'/>">Xem chi tiết</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-area me-1"></i> Tổng doanh thu của tháng
						</div>
						<div class="card-body">
							<canvas id="myTotalMoneyChart" width="100%" height="40"></canvas>
							<script>
                                                var lineChartData = {
                                                    labels: [<c:forEach var="item" items="${listOrderByMonth}">'${item.get(0)}',</c:forEach>],
                                                    datasets: [
                                                        {
                                                        	//fillColor: "#FC8213",
                                                        	label:'Doanh thu theo tháng',
                                                            data: [<c:forEach var="item" items="${listOrderByMonth}">${item.get(1)},</c:forEach>],
                                                            backgroundColor:' rgba(183, 39, 245, 1)'
                                                        }
                                                    ]

                                                };                                          
                                                new Chart(document.getElementById("myTotalMoneyChart").getContext("2d"), {
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
							<i class="fas fa-chart-bar me-1"></i> Thống kê số đơn hàng mỗi tháng
						</div>
						<div class="card-body">
							<canvas id="myChart" width="100%" height="40"></canvas>
							<script>
                                                var barChartData = {
                                                		
                                                    labels: [<c:forEach var="item" items="${listOrderByMonth}">'${item.get(0)}',</c:forEach>],
                                                    datasets: [
                                                        {
                                                        	fillColor: "#FC8213",
                                                        	label:'Đơn hàng',
                                                            data: [<c:forEach var="item" items="${listOrderByMonth}">${item.get(2)},</c:forEach>],
                                                            backgroundColor:'rgba(27, 245, 71, 1)'
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
		</div>
	</main>
</body>
</html>