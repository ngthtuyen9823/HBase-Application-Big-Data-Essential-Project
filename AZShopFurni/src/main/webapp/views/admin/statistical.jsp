<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<main>
	<div class="container-fluid px-4">
		<h1 class="mt-4">Thống kê</h1>
		<div class="card mb-4">
			<div class="card-body">
				<h5><i class="fas fa-chart-bar me-1"></i></h5>
				<canvas id="myAreaChart" width="100%" height="30">Số lượng sách theo năm xuất bản</canvas>
			</div>
		</div>
<!-- 		<div class="card mb-4">
			<div class="card-body">
				<h5><i class="fas fa-chart-bar me-1"></i>Số lượng đánh giá theo năm xuất bản</h5>
				<canvas id="myAreaChart2" width="100%" height="30"></canvas>
			</div>
		</div> -->
		<div class="row">
			<div class="col-lg-6">
				<div class="card mb-4">
					<div class="card-body">
						<h5><i class="fas fa-chart-bar me-1"></i> Số lượng đánh giá theo năm xuất bản</h5>
						<canvas id="myAreaChart2" width="100%" height="70"></canvas>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="card mb-4">
					<div class="card-body">
						<h5><i class="fas fa-chart-bar me-1"></i> Những mặc hàng đã giao</h5>
						<canvas id="myAreaChart2" width="100%" height="70"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<%@ include file="/views/admin/chart/chart1.jsp"%>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<%@ include file="/views/admin/chart/chart2.jsp"%>


