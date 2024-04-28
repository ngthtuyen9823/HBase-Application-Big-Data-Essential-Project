<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<script>
	//Set new default font family and font color to mimic Bootstrap's default styling
	Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#292b2c';

	// Area Chart Example
	var ctx = document.getElementById("myAreaChart");
	var myLineChart = new Chart(ctx, {
		type : 'line',
		data : {
			labels : [<c:forEach var="item" items="${list1[0]}">'${item}',</c:forEach>],
			datasets : [ {
				label : "KPI",
				lineTension : 0.3,
				backgroundColor : "rgba(0,0,0,0)",
				borderColor : "rgba(2,117,216,0.4)",
				//pointRadius : 5,
				//pointBackgroundColor : "rgba(2,117,216,0)",
				pointBorderColor : "rgba(255,255,255,0)",
				//pointHoverRadius : 5,
				//pointHoverBackgroundColor : "rgba(2,117,216,1)",
				//pointHitRadius : 50,
				pointBorderWidth : 2,
				data : ${list1[1]},
			},{
				label : "Hoàn thành",
				lineTension : 0.3,
				backgroundColor : "rgba(0,0,0,0)",
				borderColor : "rgba(40,167,69,0.4)",
				pointRadius : 5,
				pointBackgroundColor : "rgb(40,167,69)",
				pointBorderColor : "rgba(255,255,255,0.8)",
				pointHoverRadius : 5,
				pointHoverBackgroundColor : "rgb(40,167,69)",
				pointHitRadius : 50,
				pointBorderWidth : 2,
				data : ${list1[3]},
			},{
				label : "Hủy",
				lineTension : 0.3,
				backgroundColor : "rgba(0,0,0,0)",
				borderColor : "rgba(220,53,69,0.4)",
				pointRadius : 5,
				pointBackgroundColor : "rgb(220,53,69)",
				pointBorderColor : "rgba(255,255,255,0.8)",
				pointHoverRadius : 5,
				pointHoverBackgroundColor : "rgb(220,53,69)",
				pointHitRadius : 50,
				pointBorderWidth : 2,
				data : ${list1[4]},
			} ],
		},
		options : {
			scales : {
				xAxes : [ {
					time : {
						unit : 'date'
					},
					gridLines : {
						display : true
					},
					ticks : {
						maxTicksLimit : 32
					}
				} ],
				yAxes : [ {
					ticks : {
						min : 0,
						maxTicksLimit : 100,
					},
					gridLines : {
						color : "rgba(0, 0, 0, .125)",
						display: false
					}
				} ],
			},
			legend : {
				display : true
			}
		}
	});
</script>