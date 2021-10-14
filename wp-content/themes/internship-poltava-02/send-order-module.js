jQuery(document).ready(function ($) {
	const refreshForm = () => {
		$('.success-order').remove();
		$('.modal-title').show();
		$('.loading').remove();
		$('#send-order-table').show();
		$('input[name=name]').val('');
		$('input[name=tel_number]').val('');
		$('input[name=product_name]').val('');
	}
	const clickOnBuy = () => {
		$('button.buy-btn').click(function () {
			let productName = $(this).data('name');
			refreshForm();
			$('#send-order-table').find('#product-name-field').val(productName);
		});
	}
	const sendTableOrder = () => {
		$("#send-order-table").on("submit", function (e) {
			e.preventDefault();
			let form = $(this),
				data = {
					action: "send_order_table",
					formData: form.serialize(),
				};
			$.ajax({
				url: moduleVars.ajaxUrl,
				data: JSON.parse(JSON.stringify(data)),
				type: "POST",
				beforeSend: function () {
					form.append('<span class="loading" style="font-size: 12px; margin-left: 8px;">Отправка</span>');
				},
				complete: function (response) {
					if (response) {
						form.hide();
						$('.modal-title').hide();
						$('.sheet-products__form').append('<h3 class="success-order">Спасибо за Ваш заказ! </h3>');
					}
				},
			});
			return false;
		});
	}
	clickOnBuy();
	sendTableOrder();
});
