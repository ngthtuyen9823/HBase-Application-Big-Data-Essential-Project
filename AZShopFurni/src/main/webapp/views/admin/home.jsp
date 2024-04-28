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
			<h1 class="mt-4">TRANG CHỦ</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Đơn hàng trong tuần</li>
			</ol>
			<div class="row">
				<div class="col-xl-3 col-md-6">
					<div class="card bg-warning text-white mb-4">
						<div class="card-body">
							Đơn đang chuẩn bị
							<h3>${chDG}</h3>
						</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="#">Xem chi
								tiết</a>
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
							<a class="small text-white stretched-link" href="#">Xem chi
								tiết</a>
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
							<a class="small text-white stretched-link" href="#">Xem chi
								tiết</a>
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
							<a class="small text-white stretched-link" href="#">Xem chi
								tiết</a>
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
							<script>
							 var lineChartData = {
							            labels: [<c:forEach var="item" items="${listPayMentInMonth}">'${item.get(0)}',</c:forEach>],
							            datasets: [
							                {
							                	//fillColor: "#FC8213",
							                	label:'Doanh thu',
							                    data: [<c:forEach var="item" items="${listPayMentInMonth}">${item.get(1)},</c:forEach>],
							                    backgroundColor:' rgba(0, 0, 255, 0.6)'
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
							<i class="fas fa-chart-bar me-1"></i>Số đơn hàng trong 7 ngày gần
							đây nhất
						</div>
						<div class="card-body">
							<canvas id="myChart" width="100%" height="40"></canvas>
							<script>
                                                var barChartData = {
                                                    labels: [<c:forEach var="item" items="${listReceipt}">'${item.time}',</c:forEach>],
                                                    datasets: [
                                                        {
                                                        	fillColor: "#FC8213",
                                                        	label:'Đơn hàng',
                                                            data: [<c:forEach var="item" items="${listReceipt}">${item.value},</c:forEach>],
                                                            backgroundColor:'rgba(255, 99, 132, 0.6)'
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
							<i class="fas fa-chart-bar me-1"></i> Top 5 sản phẩm được đánh
							giá cao nhất
						</div>
						<div class="card-body">
							<canvas id="NguyenChart" width="100%" height="80"></canvas>
							<script>
                var barChartData = {
                    labels: [
                        <c:forEach var="item" items="${productrating}">
                            "${item.get(1)}",
                        </c:forEach>
                    '',],
                    datasets: [
                        {
                            label: 'Số sao trung bình',
                            data: [
                                <c:forEach var="item" items="${productrating}">
                                    "${item.get(2)}",
                                </c:forEach>
                            0,],
                            backgroundColor: '#86C7F3'
                        }
                    ]
                };

                new Chart(document.getElementById("NguyenChart"), {
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
	<script type="text/javascript">
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
          ctx.fillText(text, width /2 - 70, height / 2 -10);
        }							        
    }				     
  },
}); 
</script>
</body>
</html>