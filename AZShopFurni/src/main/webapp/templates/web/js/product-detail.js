function changeMainImage(newImage) {
	document.getElementById('mainImage').src = newImage;
	document.getElementById('mainImageLink').href = newImage;
}

var quantity = 1;
document.getElementById('selectedQuantity').value = 1;

function updateQuantity(change) {
	quantity += change;
	quantity = Math.max(1, quantity);
	document.getElementById('quantityInput').value = quantity;
	document.getElementById('selectedQuantity').value = quantity;
}

$(document).ready(function() {
	var selectedItemID = "";
	$(".btn-group button").click(function() {
		selectedItemID = $(this).attr('id');
		$("#selectedItemID").val(selectedItemID);
	});
});

function addToCart() {
	var selectedItemID = $("#selectedItemID").val();
	var selectedQuantity = $("#selectedQuantity").val();
	var errorContainer = $("#errorContainer");

	if (selectedItemID && selectedQuantity > 0) {
		var data = {
			selectedItemID: selectedItemID,
			selectedQuantity: selectedQuantity
		};

		$.ajax({
			type: "POST",
			url: "addToCart",
			data: data,
			success: function(response) {
				errorContainer.text("");
				if (response.error) {
					errorContainer.text(response.error);
				}
				else if (response.redirect) {
					window.location.href = response.redirect;
				} else {
					Swal.fire({
						icon: 'success',
						title: 'Thêm vào giỏ hàng thành công',
						showCancelButton: true,
						confirmButtonColor: '#3085d6',
						cancelButtonColor: '#ffc107;',
						confirmButtonText: 'Tiếp tục mua sắm',
						cancelButtonText: 'Đi đến giỏ hàng',
						allowOutsideClick: false
					}).then((result) => {
						if (!result.isConfirmed) {
							window.location.href = '/AZShopFurni/carts';
						}
					});
				}
			},
			error: function(error) {
				errorContainer.text("Vui lòng chọn mặt hàng!");
			}
		});
	} else {
		errorContainer.text("Vui lòng chọn mặt hàng!");
	}
}



