<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Table - Order</title>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-doughnutlabel"></script>


</head>
<body>

	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">QUẢN LÝ ĐƠN HÀNG</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Đơn hàng trong tuần</li>
			</ol>
			<div class="row">
				<div class="col-xl-3 col-md-6">
					<div class="card text-white mb-4"
						style="background-color: #5D5DF6;">
						<div class="card-body">
							Đơn chưa xác nhận
							<h3>${chXN}</h3>
						</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="#">Xem chi tiết</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card text-white mb-4"
						style="background-color: #818001;">
						<div class="card-body">
							Đơn đã xác nhận
							<h3>${daXN}</h3>
						</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="#">Xem chi tiết</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card bg-warning text-white mb-4">
						<div class="card-body">
							Đơn đang chuẩn bị
							<h3>${chDG}</h3>
						</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="#">Xem chi tiết</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card bg-primary text-white mb-4">
						<div class="card-body">
							Đang vận chuyển
							<h3>${dVC}</h3>
						</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="#">Xem chi tiết</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card bg-success text-white mb-4">
						<div class="card-body">
							Đơn thành công
							<h3>${thCong}</h3>
						</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="#">Xem chi tiết</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card bg-danger text-white mb-4">
						<div class="card-body">
							Đơn đã hủy
							<h3>${daHuy}
						</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="#">Xem chi tiết</a>
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
							<i class="fas fa-chart-area me-1"></i> Tổng doanh thu của tháng:
							<span class="highlighted"
								style="font-size: 1.2em; color: #6060F8; font-weight: bold;"><fmt:formatNumber
									type="currency" value="${sumTotal}" currencyCode="VND"
									pattern="#,##0 VND" var="formattedPrice" /> ${formattedPrice}</span>

						</div>
						<div class="card-body">
							<canvas id="myTotalMoneyChart" width="100%" height="40"></canvas>
						</div>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-bar me-1"></i> Thống kê đơn hàng trong
							tháng <span
								style="font-size: 1.2em; color: #ff5733; font-weight: bold;">
								Tổng : ${sumOrder} đơn</span>
						</div>
						<div class="card-body">
							<canvas id="myChart" width="100%" height="40"></canvas>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xl-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-area me-1"></i> Phương thức thanh toán
						</div>
						<div class="card-body">
							<div class="chart-container"
								style="display: block; justify-content: space-between;">
								<canvas id="myHorizontalDoughnutChart" width="100%" height="40"></canvas>
								<canvas id="lot" width="100%" height="40"></canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-6">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-chart-bar me-1"></i> Thống kê tình trạng đơn
							hàng trong 6 tháng
						</div>
						<div class="card-body">
							<canvas id="myChartDouble" width="100%" height="80"></canvas>

						</div>
					</div>
				</div>
			</div>
			<h1 class="mt-4">Quản lý đơn hàng</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="adminHome">Trang chủ</a></li>
				<li class="breadcrumb-item active">Đơn hàng</li>
			</ol>
			
			<c:if test="${not empty message }">
				<div class="alert alert-${alert}">
					<strong>${message}!</strong>
				</div>
			</c:if>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> Bảng dữ liệu đơn hàng
				</div>
				<div class="card-body">
					<div style="margin-bottom: 30px;">
						<form action="adminFilterOrder" method="post">
							<div style="display: inline-block; margin-right: 40px;">
								<label> <select name="fOrderDate"
									class="datatable-selector">
										<option value="-1" ${param.fOrderDate == -1 ? 'selected' : ''}>Tất
											cả</option>
										<option value="0" ${param.fOrderDate == 0 ? 'selected' : ''}>Trong
											ngày</option>
										<option value="7" ${param.fOrderDate == 7 ? 'selected' : ''}>Trong
											tuần</option>
										<option value="30" ${param.fOrderDate == 30 ? 'selected' : ''}>Trong
											tháng</option>
										<option value="360"
											${param.fOrderDate == 360 ? 'selected' : ''}>Trong
											năm</option>
										<option value="1080"
											${param.fOrderDate == 1080 ? 'selected' : ''}>Trong
											ba năm</option>
								</select> Ngày đặt hàng
								</label>
							</div>

							<div style="display: inline-block; margin-right: 60px;">
								<label> <select name="fStatuOrder"
									class="datatable-selector">
										<option value="-1"
											${param.fStatuOrder == -1 ? 'selected' : ''}>Tất cả</option>
										<option value="0" ${param.fStatuOrder == 0 ? 'selected' : ''}>Chờ
											xác nhận</option>
										<option value="1" ${param.fStatuOrder == 1 ? 'selected' : ''}>Đã
											xác nhận</option>
										<option value="2" ${param.fStatuOrder == 2 ? 'selected' : ''}>Đóng
											gói</option>
										<option value="3" ${param.fStatuOrder == 3 ? 'selected' : ''}>Đang
											vận chuyển</option>
										<option value="4" ${param.fStatuOrder == 4 ? 'selected' : ''}>Thành
											công</option>
										<option value="5" ${param.fStatuOrder == 5 ? 'selected' : ''}>Đã
											hủy</option>
								</select> Tình trạng đơn hàng
								</label>
							</div>

							<div style="display: inline-block; margin-right: 40px;">
								<label> <select name="fStatuPayment"
									class="datatable-selector">
										<option value="-1"
											${param.fStatuPayment == -1 ? 'selected' : ''}>Tất
											cả</option>
										<option value="0"
											${param.fStatuPayment == 0 ? 'selected' : ''}>Chưa
											thanh toán</option>
										<option value="1"
											${param.fStatuPayment == 1 ? 'selected' : ''}>Đã
											thanh toán</option>
								</select> Trạng thái thanh toán
								</label>
							</div>
								<div style="display: inline-block;">
								<input type="submit" value=" Tìm kiếm ">
							</div>
						</form>
					</div>

					<table id="datatablesSimple">
						<thead>
							<tr>
								<th>Mã đơn hàng</th>
								<th>Ngày đặt hàng</th>
								<th>Khách hàng</th>
								<th>Người bán</th>
								<th>Người giao</th>
								<th>Tình trạng</th>
								<th>Thanh toán</th>
								<th>Tổng tiền</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="i" items="${listOrder}">
								<tr>
									<td>${i.orderID}</td>
									<td>${i.orderDate}</td>
									<td>${i.customer.lastName}${i.customer.firstName}</td>
									<td>${i.seller.lastName}${i.seller.firstName}</td>
									<td>${i.shipper.lastName }${ i.shipper.firstName}</td>
									<td>
										<div class="d-flex justify-content-start">
											<c:choose>
												<c:when test="${i.status == 0}">
													<i style="color: #5D5DF6"> Chờ xác nhận</i>
												</c:when>
												<c:when test="${i.status == 1}">
													<i style="color: #818001"> Đã xác nhận</i>
												</c:when>
												<c:when test="${i.status == 2}">
													<i style="color: #FFC107"> Đang chuẩn bị</i>
												</c:when>
												<c:when test="${i.status == 3}">
													<i style="color: #007BFF"> Đang vận chuyển</i>
												</c:when>
												<c:when
													test="${i.status == 4}">
													<i style="color: green"> Thành công</i>
												</c:when>
												<c:when test="${i.status == 5}">
													<i style="color: red"> Đã hủy</i>
												</c:when>
												<c:otherwise>
													<i style="color: orange"> Chờ xác nhận</i>
												</c:otherwise>
											</c:choose>
										</div>
									</td>
									<td>
										<div class="d-flex justify-content-center">
											<c:choose>
												<c:when test="${i.payment.status==1}">
													<div style="color: green; font-size: 20;">
														<strong>✔</strong>
													</div>
												</c:when>
												<c:otherwise>
													<div style="color: #FF0000; font-size: 20;">
														<strong>✖</strong>
													</div>
												</c:otherwise>
											</c:choose>
										</div>
									</td>

									<td>${i.totalMoney}</td>
									<td>
										<div class="hidden-sm hidden-xs btn-group">
											<a
												href="<c:url value='/adminUpdateOrder?orderID=${i.orderID}'/>">
												<button type="button" class="btn btn-xs btn-info btn-sm"
													id="liveToastBtn">
													<i class="fa fa-info-circle" aria-hidden="true"></i>
												</button>
											</a>

										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
	<script>
	
	/// Biểu đồ cột.
	
        var barChartData = {
        		
            labels: [<c:forEach var="item" items="${listPayMentInMonth}">'${item.get(0)}',</c:forEach>'',],
            datasets: [
                {
                	fillColor: "#FC8213",
                	label:'Orders',
                    data: [<c:forEach var="item" items="${listPayMentInMonth}">${item.get(2)},</c:forEach>0,],
                    backgroundColor:'rgba(255, 99, 132, 0.6)'
                }]

        };                                          
        new Chart(document.getElementById("myChart").getContext("2d"), {
            type: 'bar',
            data: barChartData
            
        });

                           
	
	/// Biều đồ đường.
	
        var lineChartData = {
            labels: [<c:forEach var="item" items="${listPayMentInMonth}">'${item.get(0)}',</c:forEach>],
            datasets: [
                {
                	//fillColor: "#FC8213",
                	label:'Store revenue',
                    data: [<c:forEach var="item" items="${listPayMentInMonth}">${item.get(1)},</c:forEach>],
                    backgroundColor:' rgba(0, 0, 255, 0.6)'
                }
            ]

        };                                          
        new Chart(document.getElementById("myTotalMoneyChart").getContext("2d"), {
            type: 'line',
            data: lineChartData
        });
        
                            
	
	/// Biểu đồ tròn.
			var ctx = document.getElementById('myHorizontalDoughnutChart').getContext('2d');
		    var myHorizontalDoughnutChart = new Chart(ctx, {
		      type: 'doughnut',
		      data: {
		        datasets: [{
		          data: [${countPaymentCard}, ${countPaymentNormal}, ${countNoPay}],
		          backgroundColor: ['rgba(255, 99, 132, 0.6)', 'rgba(54, 162, 235, 0.6)','rgba(75, 192, 192, 0.6)'],
		        }],
		        labels: ['Chuyển khoản', 'Thanh toán khi nhận hàng', 'Chưa thanh toán'],
		      },
		      options: {
		        rotation: 1 * Math.PI,
		        circumference: 2 * Math.PI,
		        cutoutPercentage: 50, // Tùy chỉnh độ lõm của doughnut
		        animation: {
		            onComplete: function () {
		              var chartInstance = this.chart,
		                ctx = chartInstance.ctx,
		                width = chartInstance.canvas.width,
		                height = chartInstance.canvas.height;

		              ctx.font = '14px Arial';
		              ctx.fillStyle = 'black';
		              ctx.textBaseline = 'middle';
		              ctx.textAlign = 'center';

		              var text = "${countPaymentCard+countPaymentNormal+ countNoPay} đơn"; // Text bạn muốn hiển thị
		              ctx.fillText(text, width /2 -70, height / 2);
		            }							        
		        }		
		      },
		    });
		
		    // Add a second doughnut chart
		    var ctx2 = document.getElementById('lot').getContext('2d');
		    var myHorizontalDoughnutChart2 = new Chart(ctx2, {
		      type: 'doughnut',
		      data: {
		        datasets: [{
		        	data: [${totalPaymentCard}, ${totalPayMentNormal}],
		          backgroundColor: ['rgba(255, 206, 86, 0.6)', 'rgba(75, 192, 192, 0.6)'],
		        }],
		        labels: ['Chuyển khoản', 'Thanh toán khi nhận hàng'],
		      },
		      options: {
		        rotation: 1 * Math.PI,
		        circumference: 2 * Math.PI,
		        cutoutPercentage: 50, // Tùy chỉnh độ lõm của doughnut
		        animation: {
		            onComplete: function () {
		              var chartInstance = this.chart,
		                ctx = chartInstance.ctx,
		                width = chartInstance.canvas.width,
		                height = chartInstance.canvas.height;

		              ctx.font = '14px Arial';
		              ctx.fillStyle = 'black';
		              ctx.textBaseline = 'middle';
		              ctx.textAlign = 'center';

		              var text = "${totalPaymentCard+totalPayMentNormal} đ"; // Text bạn muốn hiển thị
		              ctx.fillText(text, width /2 - 70, height / 2);
		            }							        
		        }				     
		      },
		    }); 
							  
	/// Biểu đồ cột đôi
	
		var ctx = document.getElementById("myChartDouble").getContext("2d");

		var data = {
		    labels: [<c:forEach var="item" items="${listOrderSta}">"${item.get(0)}/2023",</c:forEach>],
		    datasets: [
		        {
		        	label: 'Thành công',
	                backgroundColor: 'rgba(255, 99, 132, 0.6)',
	                data: [<c:forEach var="item" items="${listOrderSta}">${item.get(1)},</c:forEach>],
		        },
		        {
		        	label: 'Hủy',
	                backgroundColor: 'rgba(54, 162, 235, 0.6)',
	                data: [<c:forEach var="item" items="${listOrderSta}">${item.get(2)},</c:forEach>],
	                
		        } 
		    ]
		};

		var myBarChart = new Chart(ctx, {
		    type: 'bar',
		    data: data,
		    options: {
		        barValueSpacing: 20,
		        scales: {
		            yAxes: [{
		                ticks: {
		                    min: 0,
		                }
		            }]
		        }
		    }
		});
							
		
	</script>

</body>


</html>


